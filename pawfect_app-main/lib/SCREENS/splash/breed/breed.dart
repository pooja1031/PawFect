import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:pawfect/SCREENS/splash/birthday.dart';

class ScreenBreed extends StatefulWidget {
  const ScreenBreed({Key? key}) : super(key: key);

  @override
  State<ScreenBreed> createState() => _ScreenBreedState();
}

class _ScreenBreedState extends State<ScreenBreed> {
  TextEditingController _textEditingController = TextEditingController();
CollectionReference userDataCollection = FirebaseFirestore.instance.collection('userData');

  List<String> _dogBreeds = [];
  List<String> _suggestions = [];
  

  @override
  void initState() {
    super.initState();
    _fetchDogBreeds();
    _textEditingController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<void> _fetchDogBreeds() async {
    try {
      final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/list/all'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<String> breeds = data['message'].keys.toList();
        setState(() {
          _dogBreeds = breeds;
        });
      } else {
        throw Exception('Failed to fetch dog breeds');
      }
    } catch (e) {
      print('Error fetching dog breeds: $e');
    }
  }

  void _onSearchChanged() {
    String query = _textEditingController.text.toLowerCase();
    List<String> filteredBreeds = _dogBreeds.where((breed) => breed.toLowerCase().contains(query)).toList();
    setState(() {
      _suggestions = filteredBreeds;
    });
  }
  // void _onSuggestionSelected(String suggestion) {
  //   _textEditingController.text = suggestion;
  //   _textEditingController.selection = TextSelection.fromPosition(
  //     TextPosition(offset: _textEditingController.text.length),
  //   );
  //   setState(() {
  //     _suggestions.clear();
  //   });
  // }
  void _onSuggestionSelected(String suggestion) {
  _textEditingController.text = suggestion;
  _textEditingController.selection = TextSelection.fromPosition(
    TextPosition(offset: _textEditingController.text.length),
  );
  setState(() {
    _suggestions.clear();
  });

  // Obtain the current user's ID from Firebase Authentication
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    String userUid = user.uid;

    // Save the selected breed to Firestore under the user's document
    String selectedBreed = suggestion;
    userDataCollection.doc(userUid).update({'breed': selectedBreed})
        .then((value) => print("Breed added to Firestore: $selectedBreed"))
        .catchError((error) => print("Error adding breed to Firestore: $error"));
  } else {
    print("User is not authenticated.");
    // Handle the case where the user is not authenticated
  }
}



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor:const Color(0xFFE6E1DD),
        body: Container(

          decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             // Color.fromARGB(255, 28, 163, 41),    // Ending color
              Color.fromARGB(255, 200, 234, 203), // Starting color
                               Color(0xFFE6E1DD),

            ],
          ),
        ),

          child: ListView(
            children: [
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 32,
                ),
              
          ),
              const Padding(
                 padding: const EdgeInsets.only(top:90),
                 child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 28.0),
                    child: Text(
                      "Which Breed  do  Your dog\n            belong  to?!!!",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                           ),
               ),
            const  SizedBox(
                height: 20,
              ),
        
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 40,),
                child: TextField(
                  controller: _textEditingController,
                  decoration:const InputDecoration(
                    hintText: 'Enter your dog\'s Breed',
                    labelText: 'Dog\'s Breed',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color:  Color.fromARGB(255, 28, 163, 41),
                      ),
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(255, 205, 189, 175),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 17.0,
                      horizontal: 26.0,
                    ),
                  ),
                ),
              ),
              
        
              
        
             const SizedBox(height: 20),
            
             Stack(
                children: [
                  // The suggestions list is at the bottom
                  // The image is overlaid on top
                  Padding(
                    padding: const EdgeInsets.only(left: 45.0, right: 40),
                    child: SizedBox(
                      width: 306,
                      height: 350,
                      child: Image.asset(
                        "assets/Images/breeed.jpg",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                                   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: _suggestions.isEmpty // Check if suggestions list is empty
                    ? SizedBox.shrink() // If empty, hide the Container
                    : Container(
                        padding: EdgeInsets.all(16.0), // Add padding inside the box
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 148, 141, 141), // Box background color
                          borderRadius: BorderRadius.circular(10.0), // Rounded corners
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Box shadow color
                              spreadRadius: 2, // Shadow spread radius
                              blurRadius: 5, // Shadow blur radius
                              offset: Offset(0, 3), // Shadow offset
                            ),
                          ],
                        ),
                                    child: _buildSuggestionsList(),
                                  ),),
        
                ],
              ),
        
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 210.0, right: 41),
                child: MaterialButton(
                  height: 50,
                  minWidth: 90,
        
                  
                   onPressed: () async {
          if (_textEditingController.text.isEmpty) {
            // Show snackbar to inform the user to enter the details
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
          content: Text('Please enter your dog\'s breed.'),
          duration: Duration(seconds: 2),
              ),
            );
          } else {
            _onSuggestionSelected(_textEditingController.text); // Call the function to save breed to Firestore
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScreenBirthday()),
            );
          }
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ScreenBirthday()),
             );
        },
        
        
                  // ignore: sort_child_properties_last
        
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  // ignore: prefer_const_constructors
                  color: Color.fromARGB(
                    255,
                    28,
                    163,
                    41,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestionsList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_suggestions[index]),
          onTap: () {
            _onSuggestionSelected(_suggestions[index]);
          },
        );
      },
    );
  }
}
