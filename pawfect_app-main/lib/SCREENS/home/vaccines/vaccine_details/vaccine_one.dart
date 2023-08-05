import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class ScreenDistember extends StatefulWidget {
  const ScreenDistember({super.key});

  @override
  State<ScreenDistember> createState() => _ScreenDistemberState();
}

class _ScreenDistemberState extends State<ScreenDistember> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 205, 189, 175),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              title: const Padding(
                padding: EdgeInsets.only(left: 3.0),
                child: Text(
                  "Canine Distember",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
              fit: StackFit.expand, // Make the Stack cover the entire screen
              children: [
                // Background Image
                Image.asset(
                  'assets/Images/My project (2).png', // Replace with your actual background image asset path
                  fit: BoxFit.cover, // Adjust the fit of the image
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 203.0),
                        child: Text(
                          "Affects",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(
                              255,
                              28,
                              163,
                              41,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Container(
                          width: 340,
                          height: 120,
                          color: Color(0xFFE6E1DD),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: Text(
                                "A usual fatal viral disease that causes respiratory,gastrointestinaland nervous system problems.",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 78.0),
                        child: Text(
                          "Vaccination  Time",
                          style: TextStyle(
                              color: Color.fromARGB(
                                255,
                                28,
                                163,
                                41,
                              ),
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Container(
                          width: 340,
                          height: 120,
                          color: Color(0xFFE6E1DD),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 28.0),
                              child: Text(
                                "Every 3 weeks until 12-14 weeks(6,9,12  weeks or 8,11,14 weeks),followed by an annual booster",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ])),
    );
  }
}
