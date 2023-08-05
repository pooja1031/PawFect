import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class ScreenParvovirus extends StatefulWidget {
  const ScreenParvovirus({super.key});

  @override
  State<ScreenParvovirus> createState() => _ScreenParvovirusState();
}

class _ScreenParvovirusState extends State<ScreenParvovirus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            title: const Padding(
              padding: EdgeInsets.only(left: 3.0),
              child: Text(
                "Canine Parvovirous",
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
                'assets/Images/My project (4).png', // Replace with your actual background image asset path
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
                              "A dangerous and deadly cause intenstial diseases.",
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
                              "Some vets vaccinate parvo until 5 months of age against corona at a-9 weeks of age",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ]));
  }
}
