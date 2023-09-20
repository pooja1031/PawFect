import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'breed/breed.dart';



class screenDogName extends StatefulWidget {
  const screenDogName({super.key});

  @override
  State<screenDogName> createState() => _screenDogNameState();
}

class _screenDogNameState extends State<screenDogName> {
  TextEditingController _dogname = TextEditingController();
CollectionReference userDataCollection = FirebaseFirestore.instance.collection('userData');

  @override
  void dispose() {
    _dogname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFE6E1DD),
        body: Container(
          decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
                Color(0xFFE6E1DD),
             // Color.fromARGB(255, 28, 163, 41),    // Ending color
              Color.fromARGB(255, 200, 234, 203), // Starting color

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
                  icon: Icon(Icons.arrow_back),
                  color: Colors.black,
                  iconSize: 32,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ListTile(
                leading: Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Text(
                    "What do you call your dog?!!!",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 45.0, right: 40),
                child: TextField(
                  controller: _dogname,
                  decoration: InputDecoration(
                    hintText: 'Enter your dog\'s name',
                    labelText: 'Dog\'s Name',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 28, 163, 41),
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
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40.0, right: 40),
                child: Container(
                  width: 200,
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: Image.asset(
                    "assets/Images/ddkc.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 210.0, right: 41),
                child: MaterialButton(
                  height: 50,
                  minWidth: 90,
        //           onPressed: () async {
        // if (_dogname.text.isEmpty) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //   const  SnackBar(
        //       content: Text('Please enter your dog Name'),
        //       duration: Duration(seconds: 2),
        //     ),
        //   );
        // } else {
        //   // Obtain the current user's ID from Firebase Authentication
        //   User? user = FirebaseAuth.instance.currentUser;
        //   if (user != null) {
        //     String userUid = user.uid;
        
        //     // Write data to Firestore
        //     await userDataCollection.doc(userUid).set({'dogName': _dogname.text});
        
        //     // Navigate to the next screen
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenBreed()));
        //   } else {
        //     print("User is not authenticated.");
        //     // Handle the case where the user is not authenticated
        //   }
        // }
        
        //           },

onPressed: () async {
  if (_dogname.text.isNotEmpty) {
    // Obtain the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Generate a unique user ID
      String userUid = user.uid;

      // Store the dog's name in the existing 'userData' collection
      try {
        await FirebaseFirestore.instance.collection('userData').doc(userUid).update({
          'dogName': _dogname.text,
        });
      //  Navigate to the next screen
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreenBreed()));

        // Navigate to the next screen
        // Add your navigation logic here
      } catch (e) {
        print('Error storing dog name: $e');
        // Handle the error (e.g., show an error message)
      }
    } else {
      print("User is not authenticated.");
      // Handle the case where the user is not authenticated
    }
  }
},






                  child: Text(
                    'Continue',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  color: Color.fromARGB(255, 28, 163, 41),
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
}





