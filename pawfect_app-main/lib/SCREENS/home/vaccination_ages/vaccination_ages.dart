import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenVaccinationAges extends StatefulWidget {
  const ScreenVaccinationAges({super.key});

  @override
  State<ScreenVaccinationAges> createState() => _ScreenVaccinationAgesState();
}

class _ScreenVaccinationAgesState extends State<ScreenVaccinationAges> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(159), // Set your preferred height here
          child: AppBar(
            leading: IconButton(
              iconSize: 32,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            flexibleSpace: Image.asset(
              'assets/Images/weeks.jpg',
              fit: BoxFit.cover,
            ),
            // Other AppBar properties can be added here
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "WEEKS!!",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 88,
                  ),
                  Text(
                    "What to do??",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "3 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Deworming the pup for round worms and hook worms",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "4 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Vaccination against Parvovirus and Distemper if bitch is not vaccinated",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "5 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Booster Vaccination against Parvvovirus and Disttemper",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "6 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Vaccination against Parvovirus and Distemper if bitch is not vaccinated",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "7-8 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Booster Vccination against Parvovirus and Distemper",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "8-9 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Parvo,Adeno,Leptospirosis,Coronavirus,Parainfluenza,Bordetella",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "8-12 Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Deworming and Antirabies Vaccination",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Container(
                      color: Color(
                        (0xFFE6E1DD),
                      ),
                      width: 105,
                      height: 65,
                      child: Center(
                        child: Text(
                          "15-16Weeks",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(
                      255,
                      28,
                      163,
                      41,
                    ),
                    width: 260,
                    height: 65,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Regular deworming every 3 to 4 months,thereafter",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
