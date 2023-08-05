import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'package:pawfect/SCREENS/splash/user/user.dart';

class ScreenGetStarted extends StatefulWidget {
  const ScreenGetStarted({super.key});

  @override
  State<ScreenGetStarted> createState() => _ScreenGetStartedState();
}

class _ScreenGetStartedState extends State<ScreenGetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 139, 120, 103),
      body: Stack(
        children: [
          Center(child: Lottie.asset("animations/animation_lkfs8epp.json")
              // Container(
              // width: 500,
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: AssetImage("assets/Images/loginbacg.png"),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              // ),
              ),
          DefaultTextStyle(
            style: GoogleFonts.kalam(
                fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(top: 128.0, left: 45, right: 40),
              child: AnimatedTextKit(
                  repeatForever: false,
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText(
                        "Complete\nJourney to Raise a\nHappy Dog ",
                        speed: Duration(milliseconds: 100))
                  ]),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 70.0, top: 98),
          //   child: Text(
          //     "Pawfect welcomes a\n       Pawrents ",
          //     style: TextStyle(
          //         fontSize: 33,
          //         fontWeight: FontWeight.bold,
          //         color: Colors.white),
          //   ),
          // ),
          Positioned(
            bottom: 140,
            left: 10,
            right: 70.0,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 28.0, left: 90, bottom: 10, right: 30),
              child: MaterialButton(
                height: 60,
                minWidth: 10,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ScreenUser()),
                  );
                },
                child: Text(
                  'Get Started',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
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
    );
  }
}
