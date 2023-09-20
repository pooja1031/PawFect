

// ignore_for_file: avoid_print

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:pawfect/SCREENS/splash/user/verification/verification.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:provider/provider.dart';


import '../../../providers/user_provider.dart';
import '../../../utils/utils.dart';


class ScreenUser extends StatefulWidget {
  const ScreenUser({super.key});

  @override
  State<ScreenUser> createState() => _ScreenUserState();
}

class _ScreenUserState extends State<ScreenUser> {
  final countrypicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final TextEditingController phonenumberController = TextEditingController();
final TextEditingController nameController = TextEditingController(); // Add this line
// ignore: unused_field
// 
String? imageUrl;

Uint8List? _image;
    CollectionReference userDataCollection = FirebaseFirestore.instance.collection('userData');
    

  void _updateUserProfile() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // ignore: deprecated_member_use
      user.updateProfile(
        displayName: nameController.text,
        photoURL:user.photoURL,
      );
    }
  }


  bool showLabel = true;
 void uploadImageToStorage(Uint8List imageBytes) async {
  final Reference storageRef = firebase_storage.FirebaseStorage.instance.ref();
  final Reference imageRef = storageRef.child('profile_images/${DateTime.now().millisecondsSinceEpoch}.jpg');

  try {
    // Upload the image
    await imageRef.putData(imageBytes);

    // Get the download URL for the uploaded image
    imageUrl = await imageRef.getDownloadURL();

    // Update Firestore document with this URL.
    _updateUserProfile(); // Call the update function to save the image URL in Firestore

    print('Image uploaded. URL: $imageUrl');
  } catch (error) {
    print('Error uploading image: $error');
  }
}

 void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });

    if (_image != null) {
      uploadImageToStorage(_image!);
      
      // Use the provider to set the selected image
      // ignore: use_build_context_synchronously
      Provider.of<SelectedImageProvider>(context, listen: false)
          .setSelectedImage(_image!);
    }
  }





// void selectImage()async{
//  Uint8List im = await pickImage(ImageSource.gallery) ;
//  setState(() {
//   _image = im;
   
//  });
// }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor:const Color.fromARGB(255, 188, 160, 136),
    
          body: Container(
    
    
            decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 28, 163, 41),    // Ending color
                Color.fromARGB(255, 200, 234, 203), // Starting color
                Color.fromARGB(255, 134, 190, 201),    // Ending color
                Color.fromARGB(255, 200, 234, 203), // Starting color
              ],
            ),
          ),
            child: Stack(children: [
                        Padding(
                          padding: const EdgeInsets.only(top:620.0,),
                          child: Center(child: Padding(
                            padding: const EdgeInsets.only(right:68.0),
                            child: Lottie.asset("animations/login.json",width: 550),
                          )
                        
                                   
                                  ),
                        ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 68),
                child: Text(
                  "Pawfect welcomes a\n            Pawrent ",
                  style: GoogleFonts.kanit(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      // Color.fromARGB(255, 238, 233, 233),
                  
                      //Color.fromARGB(255, 17, 18, 17),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 395.0, left: 35),
                child: Text(
                  "Please Enter Your",
                  style: TextStyle(
                    fontSize: 22,
                   // fontWeight: FontWeight.bold,
                    color:Colors.black,
                   // const Color.fromARGB(255, 28, 163, 41),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 400.0, left: 40, right: 40),
              //   child: Container(
              //     height: 170,
              //     child: TextFormField(
              //       // Your text field properties go here
              //       decoration: InputDecoration(
              //         hintText: "Name", hintStyle: TextStyle(fontSize: 25),
              //         // border: OutlineInputBorder(
              //         //   borderRadius: BorderRadius.circular(20),
              //         // ),
              //         filled: true, // Set filled property to true
              //         fillColor: Color.fromARGB(255, 163, 142, 142),
              //         contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top:198.0,left: 120),
                child: Stack(
                  children: [
                    _image!=null?CircleAvatar(
                      radius: 64,
                      backgroundImage: MemoryImage(_image!),
                    )
                    :const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage("https://cdn.vectorstock.com/i/preview-1x/70/84/default-avatar-profile-icon-symbol-for-website-vector-46547084.jpg"),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(onPressed: (){
                        selectImage();
                      }, icon: Icon(Icons.add_a_photo)))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Positioned(
                top: 450,
                left: 30,
                right: 30,
                child: Container(
                  width: 350,
                  height: 60,
                  color: 
                   Color.fromARGB(255, 163, 142, 142),
                  child: TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                   // maxLines: 1,
                    decoration: InputDecoration(
                      labelText: showLabel ? "Name" : "",
                      floatingLabelBehavior: FloatingLabelBehavior
                          .never, // Hide label text while entering details
                  
                      filled: true, // Set filled property to true
                    ),
                  ),
                ),
              ),
                  
              SizedBox(
                height: 20,
              ),
                  
              Positioned(
                top: 540,
                left: 30,
                right: 30,
                child: Container(
                  width: 350,
                  height: 60,
                  color: 
                  Color.fromARGB(255, 163, 142, 142),
                  child: TextFormField(
                    controller: phonenumberController,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    //maxLines: 1,
                   // maxLength: 10,
              
                    decoration: InputDecoration(
                      labelText: showLabel ? "Mobile" : "",
                      filled: true, // Set filled property to true
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: Container(
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          GestureDetector(
                            onTap: () async {
                              final code =
                                  await countrypicker.showPicker(context: context);
                              setState(() {
                                countryCode = code;
                              });
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: 45,
                                  height: 35,
                                  child:countryCode?.flagImage(),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  width: 45,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                      child: Text(countryCode?.dialCode ?? "+91")),
                                ),
                              ],
                            ),
                          )
                        ]),
                      ),
                      // labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 630,
                left: 130,
                right: 130,
                child: MaterialButton(
                  height: 50,
                  minWidth: 110,
                  
                
                  
                  
            //       onPressed: () async {
            // if (_validateFields()) {
            //   // Obtain the current user's ID from Firebase Authentication
            //   User? user = FirebaseAuth.instance.currentUser;
            //   if (user != null) {
            //     String userUid = user.uid;
                  
            //     // Fetch the existing data from the splash screen if available
            //     DocumentSnapshot userDataSnapshot = await userDataCollection.doc(userUid).get();
            //     Map<String, dynamic>? existingData = userDataSnapshot.data() as Map<String, dynamic>?;
                  
            //     if (existingData == null) {
            // existingData = {}; // Initialize as an empty map if no existing data found
            //     }
                  
            //     // Add/update the new data from the user screen
            //     existingData['name'] = nameController.text;
            //     existingData['phoneNumber'] = phonenumberController.text;
                  
            //     // Save the combined data to Firestore
            //     await userDataCollection.doc(userUid).set(existingData);
            //       _updateUserProfile();
                  
            //     // Navigate to the OTP screen
            //     Navigator.of(context).push(
            // MaterialPageRoute(builder: (context) => OTPScreen(phonenumberController.text)),
            //     );
            //   } else {
            //     print("User is not authenticated.");
            //     // Handle the case where the user is not authenticated
            //   }
            // }
            //       },
            
            onPressed: () async {
  if (_validateFields()) {
    // Obtain the current user from Firebase Authentication
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Generate a unique user ID
      String userUid = user.uid;

      // Collect user data
      Map<String, dynamic> userData = {
        'name': nameController.text,
        'phoneNumber': phonenumberController.text,
         'profileImage': imageUrl, 

      };

      // Store user data in the 'userData' collection
      try {
        await FirebaseFirestore.instance.collection('userData').doc(userUid).set(userData);

        // Update user profile (if needed)
        _updateUserProfile();

        // Navigate to the dog's name screen
       Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => OTPScreen(phonenumberController.text)),
                );
      } catch (e) {
        print('Error storing user data: $e');
        // Handle the error (e.g., show an error message)
      }
    } else {
      print("User is not authenticated.");
      // Handle the case where the user is not authenticated
    }
  }
},

                  
                  // ignore: sort_child_properties_last
                  
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Get OTP',
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
                  
                  
              
            ]),
          )),
    );
  }

  bool _validateFields() {
  if (phonenumberController.text.isEmpty) {
    _showSnackbar("Please enter your phone number.");
    return false;
  }

  if (countryCode == null) {
    _showSnackbar("Please choose a country code.");
    return false;
  }

  return true;
}

void _showSnackbar(String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
}       