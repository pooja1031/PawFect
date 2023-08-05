// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pawfect/SCREENS/splash/name.dart';

class ScreenLetUsknow extends StatelessWidget {
  const ScreenLetUsknow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(
        //   (0xFFE6E1DD),
        // ),
        // body: Column(
        //   children: [
        //     Container(
        //       height: 170,
        //       decoration: const BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage("assets/Images/paw.png"),
        //         ),
        //       ),
        //     ),
        //     const Padding(
        //       padding: const EdgeInsets.only(left: 28.0),
        //       child: Text(
        //         "Let us know few things about your furry pal....",
        //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
        //       ),
        //     ),
        //     const SizedBox(
        //       height: 20,
        //     ),
        //     MaterialButton(
        //       height: 50,
        //       minWidth: 110,
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(builder: (context) => screenDogName()),
        //         );
        //       },
        //       // ignore: prefer_const_constructors
        //       child: Text(
        //         'Next',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //       // ignore: ojreojpoprefer_const_constructors
        //       color: Color.fromARGB(
        //         255,
        //         28,
        //         163,
        //         41,
        //       ),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5),
        //       ),
        //     ),
        //   ],
        // ),
        backgroundColor: const Color.fromARGB(255, 28, 163, 41),
        body: Stack(
          children: [
            Center(
              child: Container(
                width: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Images/letusknow.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 93.0, top: 239),
              child: Text(
                "Let us know few things\n about your furry pal....",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 140,
              left: 10,
              right: 70.0,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 28.0, left: 110, bottom: 320),
                child: MaterialButton(
                  height: 50,
                  minWidth: 20,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => screenDogName()),
                    );
                  },
                  child: Text(
                    'Next',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  color: Color.fromARGB(255, 28, 163, 41),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
