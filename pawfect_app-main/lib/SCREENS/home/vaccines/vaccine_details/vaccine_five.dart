import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class Leptospirosis extends StatefulWidget {
  const Leptospirosis({super.key});

  @override
  State<Leptospirosis> createState() => _LeptospirosisState();
}

class _LeptospirosisState extends State<Leptospirosis> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 205, 189, 175),
          appBar: AppBar(toolbarHeight: 80,
            title: const Padding(
              padding: EdgeInsets.only(left: 3.0),
              child: Text(
                "Leptospirosis",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          body: Container(
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                   //Color.fromARGB(255, 123, 104, 87),  
                 // Color.fromARGB(255, 244, 228, 208),
                  Color.fromARGB(255, 206, 222, 208),
                  Color.fromARGB(255, 206, 222, 208), 
     
    
                ],
              ),
            ),
            child: Stack(
                fit: StackFit.expand, // Make the Stack cover the entire screen
                children: [
                  // Background Image
                  Image.asset(
                    'assets/Images/My project (6).png', // Replace with your actual background image asset path
                    fit: BoxFit.cover, // Adjust the fit of the image
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
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
                            height: 90,
                            color: Color(0xFFE6E1DD),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "A bacterial disease that affects liver and kidney",
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
                            height: 80,
                            color: Color(0xFFE6E1DD),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 14.0),
                                child: Text(
                                  "veterinarians donot include until 9 weeks of age",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          )),
    );
  }
}
