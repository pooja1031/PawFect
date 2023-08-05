import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


import 'package:pawfect/SCREENS/chat/chat.dart';
import 'package:pawfect/SCREENS/community/community.dart';
import 'package:pawfect/SCREENS/home/foods/foods.dart';
import 'package:pawfect/SCREENS/home/vaccination_ages/vaccination_ages.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccines.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final tabs = [
    const ScreenHome(),
    const ScreenChatBot(),
    const ScreenCommunity(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 189, 175),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 34.0),
          child: Text(
            "PawFect",
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 205, 189, 175),
            ),
          ),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(
          height: 30,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, bottom: 0),
              child: Container(
                height: 210,
                width: 330,
                color: const Color.fromARGB(255, 221, 210, 210),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 90, right: 70, top: 30),
                      child: Text(
                        "Name:",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.0, left: 64),
                      child: Text(
                        "Age:",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 32.0, left: 50),
                      child: Text(
                        "Breed:",
                        style: TextStyle(color: Colors.black, fontSize: 21),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 15,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Image border
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(80), // Image radius
                  child: Image.asset('assets/Images/kkkkk.png',
                      width: 200, height: 200, fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            "   “Dear dog parents, take a\nmoment to go through these”",
            style: TextStyle(
                color: Color.fromARGB(
                  255,
                  28,
                  163,
                  41,
                ),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 30),
          child: Container(
            height: 60,
            width: 365,
            color: Color.fromARGB(
              255,
              28,
              163,
              41,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ScreenFoodsToAvoid()),
                );
              },
              child: Text(
                "Foods to Avoid",
                style: TextStyle(
                    color: const Color.fromARGB(255, 205, 189, 175),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //-------------vaccination ages
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 30),
          child: Container(
            height: 60,
            width: 365,
            color: Color.fromARGB(
              255,
              28,
              163,
              41,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ScreenVaccinationAges()),
                );
              },
              child: Text(
                "Vaccination ages",
                style: TextStyle(
                    color: const Color.fromARGB(255, 205, 189, 175),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //---------------vacccinations for dogs
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 30),
          child: Container(
            height: 60,
            width: 365,
            color: Color.fromARGB(
              255,
              28,
              163,
              41,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ScreenVccines()),
                );
              },
              child: Text(
                "Vaccinations for dogs",
                style: TextStyle(
                    color: const Color.fromARGB(255, 205, 189, 175),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        //List of vet hospitals
        Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 30),
          child: Container(
            height: 60,
            width: 365,
            color: Color.fromARGB(
              255,
              28,
              163,
              41,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const ScreenFoodsToAvoid()),
                );
              },
              child: Text(
                "List of Veterinary Hospitals",
                style: TextStyle(
                    color: const Color.fromARGB(255, 205, 189, 175),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
