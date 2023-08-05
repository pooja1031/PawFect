import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pawfect/SCREENS/widgets/mainpage.dart';

class ScreenGender extends StatefulWidget {
  const ScreenGender({super.key});

  @override
  State<ScreenGender> createState() => _ScreenGenderState();
}

class _ScreenGenderState extends State<ScreenGender> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
    }
 
  void _showGenderOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          // Set the height to control the size of the BottomSheet
          height: 150,
          color:  Color.fromARGB(255, 152, 228, 160), // You can set a background color here if needed
          child: Column(
            children: [
              ListTile(
                onTap: () {
                  _selectGender('Male');
                  Navigator.pop(context);
                },
                title: Text('Male',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
              ListTile(
                onTap: () {
                  _selectGender('Female');
                  Navigator.pop(context);
                },
                title: Text('Female',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              ),
            ],
          ),
        );
      },
    );
  }

  void _selectGender(String gender) {
    setState(() {
      _textEditingController.text = gender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(
            (0xFFE6E1DD),
          ),
          body: ListView(children: [
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
                  "Does your canine pal identify\n          as a Bro or a Sis?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 40),
              child: GestureDetector(
                 onTap: () {
                  _showGenderOptions(context);
                },
                child: AbsorbPointer(
                  absorbing: true,

                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                       hintText: 'Tap to select gender',
                      labelText: 'Dog\'s Gender',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: const Color.fromARGB(255, 28, 163, 41),
                        ),
                      ),
                      filled: true, // Set filled property to true
                              
                      fillColor: Color.fromARGB(255, 205, 189, 175),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 17.0, // Adjust vertical padding
                        horizontal: 26.0, // Adjust horizontal padding
                      ),
                    ),
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
                  color: Colors.white, // Color of the box
                  border: Border.all(
                      color: Colors.white, width: 2), // Border properties
                ),
                child: Image.asset(
                  "assets/Images/genderss.png",
                  fit: BoxFit.contain, // Fit the image within the box
                ),
              ),
            ),
           const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 210.0, right: 41),
              child: MaterialButton(
                height: 50,
                minWidth: 90,

                onPressed: () async {
                 if (_textEditingController.text.isEmpty) {
    // Show snackbar to inform the user to enter the details
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter your dog\'s gender'),
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ScreenMainPage()),
    );
  }
                },

                // ignore: sort_child_properties_last

                // ignore: prefer_const_constructors, sort_child_properties_last
                child: Text(
                  'Continue',
                  style: const TextStyle(color: Colors.white, fontSize: 22),
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
          ])),
    );
  }
}
