import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class ScreenRabies extends StatefulWidget {
  const ScreenRabies({super.key});

  @override
  State<ScreenRabies> createState() => _ScreenRabiesState();
}

class _ScreenRabiesState extends State<ScreenRabies> {
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
                "Rabies",
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
                'assets/Images/My project (5).png', // Replace with your actual background image asset path
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
                        height: 130,
                        color: Color(0xFFE6E1DD),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              "A dead viral  disease of the nervous system that affects all mammals including humans,may be difficult to detect.",
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
                        height: 130,
                        color: Color(0xFFE6E1DD),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: Text(
                              "First vaccine at  3 months,booster 9-12  months later and then every 1-3 years depending on the vaccine",
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
