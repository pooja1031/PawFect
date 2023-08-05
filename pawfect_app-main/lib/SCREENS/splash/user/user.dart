import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pawfect/SCREENS/splash/letusknow.dart';


class ScreenUser extends StatefulWidget {
  const ScreenUser({super.key});

  @override
  State<ScreenUser> createState() => _ScreenUserState();
}

class _ScreenUserState extends State<ScreenUser> {
  final countrypicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  final TextEditingController phonenumberController = TextEditingController();
  bool showLabel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 163, 41),
        body: Stack(children: [
          Center(
            child: Container(
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Images/loginbacg.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0, top: 98),
            child: Text(
              "Pawfect welcomes a\n      Pawrents ",
              style: GoogleFonts.kalam(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 370.0, left: 20),
            child: Text(
              "Please Enter Your",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 28, 163, 41),
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
              color: Color.fromARGB(255, 163, 142, 142),
              child: TextFormField(
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                maxLines: 1,
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
              color: Color.fromARGB(255, 163, 142, 142),
              child: TextFormField(
                controller: phonenumberController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                maxLines: 1,
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
                              child: countryCode != null
                                  ? countryCode!.flagImage()
                                  : null,
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

              onPressed: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const ScreenLetUsknow()),
                );
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
        ]));
  }
}          












//ontap:materialbutton
//  {
//                 if (CountryCode != null) {
//                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       content: Text(
//                           "${countryCode!.dialCode}-${phonenumberController.text.trim()}")));
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text("Please enter a PhoneNumber")));
//                 }
//               