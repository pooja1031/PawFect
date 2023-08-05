import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'breed/breed.dart';



class screenDogName extends StatefulWidget {
  const screenDogName({super.key});

  @override
  State<screenDogName> createState() => _screenDogNameState();
}

class _screenDogNameState extends State<screenDogName> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
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
              // trailing: Padding(
              //   padding: const EdgeInsets.only(left: 78.0, top: 40),
              //   child: Container(
              //     height: 200,
              //     width: 300,
              //     child: Transform.scale(
              //       scale: 5.5,
              //       child: Image.asset("assets/Images/paws.png"),
              //     ),
              //   ),
              // ),
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
                controller: _textEditingController,
                decoration: InputDecoration(
                  hintText: 'Enter your dog\'s name',
                  labelText: 'Dog\'s Name',
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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Container(
                width: 200, // Adjust the width of the box as desired
                height: 350, // Adjust the height of the box as desired
                decoration: BoxDecoration(
                  color: Colors.white, // Color of the box
                  border: Border.all(
                      color: Colors.white, width: 2), // Border properties
                ),
                child: Image.asset(
                  "assets/Images/ddkc.jpg",
                  fit: BoxFit.contain, // Fit the image within the box
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

                onPressed: () async {
                 if (_textEditingController.text.isEmpty) {
    // Show snackbar to inform the user to enter the details
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please enter your dog Name'),
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ScreenBreed()),
    );
  }
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
          ])),
    );
  }
}
