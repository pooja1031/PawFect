import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentDogName;

  EditProfileScreen({required this.currentName, required this.currentDogName});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dogNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.currentName;
    dogNameController.text = widget.currentDogName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Container(
        decoration:const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
                                           Color.fromARGB(255, 211, 187, 168),

           // Color.fromARGB(255, 28, 163, 41),    // Ending color
            Color.fromARGB(255, 200, 234, 203), // Starting color

          ],
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left:18.0,top:50),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: dogNameController,
                decoration: InputDecoration(labelText: 'Dog Name'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Save the updated data to Firebase
                  await _saveUpdatedData();
                  Navigator.of(context).pop(); // Close the edit screen
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveUpdatedData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userUid = user.uid;

      // Update the user data in Firestore
      await FirebaseFirestore.instance.collection('userData').doc(userUid).update({
        'name': nameController.text,
        'dogName': dogNameController.text,
      });
    }
  }
}
