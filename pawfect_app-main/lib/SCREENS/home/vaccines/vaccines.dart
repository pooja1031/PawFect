import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pawfect/SCREENS/home/vaccines/vaccine_details/vaccine_five.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccine_details/vaccine_four.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccine_details/vaccine_one.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccine_details/vaccine_three.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccine_details/vaccine_two.dart';

class ScreenVccines extends StatefulWidget {
  const ScreenVccines({super.key});

  @override
  State<ScreenVccines> createState() => _ScreenVccinesState();
}

class _ScreenVccinesState extends State<ScreenVccines> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(220), // Set your preferred height here
          child: AppBar(
            flexibleSpace: Image.asset(
              'assets/Images/vaccinesss.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 45,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 350,
                height: 60,
                color: const Color.fromARGB(255, 28, 163, 41),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ScreenDistember()),
                      );
                    },
                    child: Text(
                      "Canine Distember",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 350,
                height: 60,
                color: const Color.fromARGB(255, 28, 163, 41),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ScreenHepatits()),
                      );
                    },
                    child: Text(
                      "Canine Hepatits",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 350,
                height: 60,
                color: const Color.fromARGB(255, 28, 163, 41),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ScreenParvovirus()),
                      );
                    },
                    child: Text(
                      "Canine Parvovirous",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 350,
                height: 60,
                color: const Color.fromARGB(255, 28, 163, 41),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const ScreenRabies()),
                      );
                    },
                    child: Text(
                      "Rabies",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Container(
                width: 350,
                height: 60,
                color: const Color.fromARGB(255, 28, 163, 41),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const Leptospirosis()),
                      );
                    },
                    child: Text(
                      "Leptospirosis",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
