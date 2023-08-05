// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pawfect/SCREENS/splash/getstarted.dart';

class ScreenSplash2 extends StatefulWidget {
  const ScreenSplash2({super.key});

  @override
  State<ScreenSplash2> createState() => _ScreenSplash2State();
}

class _ScreenSplash2State extends State<ScreenSplash2> {
  @override
  Widget build(BuildContext context) {
    // final Size screenSize = MediaQuery.of(context).size;
    // final Color customColor = Color.fromARGB(255, 28, 163, 41);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            //child: Image.asset("assets/Images/dog girl.jpeg"), child));
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Images/dog girl.jpeg"),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 710.0, left: 20.0),
              child: Column(children: [
                const Text(
                  "Give the best care to your Pet",
                  style: TextStyle(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 210.0),
                  child: MaterialButton(
                    height: 50,
                    minWidth: 110,

                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ScreenGetStarted()),
                      );
                    },

                    // ignore: sort_child_pro

                    // ignore: prefer_const_constru
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                    // ignore: prefer_const_constructor
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
            )));
    //  ),
    //   ),
    //  );
  }
}
