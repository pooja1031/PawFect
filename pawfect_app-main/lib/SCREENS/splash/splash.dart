import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:pawfect/SCREENS/splash/splash2.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    gotosplash2();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
   // final Size screenSize = MediaQuery.of(context).size;
    final Color customColor = Color.fromRGBO(28, 163, 41, 1);

    return SafeArea(
        child: Scaffold(
      backgroundColor: customColor,
      body: Container(
decoration:const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [

              Color.fromARGB(255, 28, 163, 41),    // Ending color
              Color.fromARGB(255, 200, 234, 203), // Starting color

            ],
          ),
        ),

        child: Column(
          children: [
            DefaultTextStyle(
              style: GoogleFonts.kalam(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.only(top: 128.0, left: 45, right: 40),
                child: AnimatedTextKit(
                    repeatForever: false,
                    totalRepeatCount: 1,
                    animatedTexts: [
                      TyperAnimatedText("PawFect",
                          speed: Duration(milliseconds: 100))
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Lottie.asset("animations/animation_lkfibtxm.json"),
            ),
          ],
        ),
      ),
    ));
    //   ),
    // );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotosplash2() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => ScreenSplash2()));
  }
}
