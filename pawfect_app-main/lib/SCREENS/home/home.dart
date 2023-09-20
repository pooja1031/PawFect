import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:pawfect/SCREENS/chat/chat.dart';
import 'package:pawfect/SCREENS/community/community.dart';
import 'package:pawfect/SCREENS/home/foods/foods.dart';
import 'package:pawfect/SCREENS/home/vaccination_ages/vaccination_ages.dart';
import 'package:pawfect/SCREENS/home/vaccines/vaccines.dart';
import 'package:pawfect/SCREENS/profile/drawer.dart';
import 'package:pawfect/SCREENS/profile/profile.dart';


class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  String? uid;
    Map<String, dynamic> userData = {};
    // 
    

  final tabs = [
    const ScreenHome(),
    const ScreenChatBot(),
    const ScreenCommunity(),
  ];
   @override
  void initState() {
    super.initState();
    uid = FirebaseAuth.instance.currentUser!.uid;
    fetchUserDataFromFirestore().then((data) {
      setState(() {
        userData = data;
      });
    });
  }
  Future<Map<String, dynamic>> fetchUserDataFromFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userUid = user.uid;
      DocumentSnapshot snapshot =
          await FirebaseFirestore.instance.collection('userData').doc(userUid).get();
      return snapshot.data() as Map<String, dynamic>;
    } else {
      return {}; 
    }
  }
  void gotoprofilepage(){
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        appBar: AppBar(
          toolbarHeight: 100,
          
          title:  Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Text(
              "PawFect",
              style: GoogleFonts.libreBaskerville(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 205, 189, 175),
                
              ),
            ),
            
          ),
          
        ),
        drawer: myDrawer(onaboutTap: () {  }, onprofileTap: gotoprofilepage, ),
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
                  decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 102, 200, 110), 
                                 Color.fromARGB(255, 68, 65, 63),    

              ],
            ),
          ),
                  height: 210,
                  width: 330,
                 // color: Color.fromARGB(255, 209, 217, 214),
                  child: 
                  Column(
                    children:  [
                      Padding(
                        padding: EdgeInsets.only(left: 70, top: 50),
                        child: Text(
                          "Name:${userData['dogName'] ?? ''}",
                          style: GoogleFonts.robotoCondensed(color: Color.fromARGB(255, 205, 189, 175),fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 27.0, left: 64),
                        child: Text(
                                                 "Age: ${userData['age'] ?? ''}",
    
                          style: GoogleFonts.robotoCondensed(color: Color.fromARGB(255, 205, 189, 175),fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only( left: 130),
                        child: Text(
                                 "Breed: ${userData['breed'] ?? ''}",
    
                          style: GoogleFonts.robotoCondensed(color: Color.fromARGB(255, 205, 189, 175),fontSize: 22,fontWeight: FontWeight.bold),
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
                  borderRadius: BorderRadius.circular(20), 
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(80), 
                    child: Image.asset('assets/Images/doghomeg.jpeg',
                      //'assets/Images/kkkkk.png',
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
              decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 68, 65, 63),    
                Color.fromARGB(255, 102, 200, 110), 
              ],
            ),
          ),
              // color: Color.fromARGB(
              //   255,
              //   28,
              //   163,
              //   41,
              // ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ScreenFoodsToAvoid()),
                  );
                },
                child: Text(
                  "Foods to Avoid",
                  style: GoogleFonts.robotoCondensed(
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
               decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 68, 65, 63),    
                Color.fromARGB(255, 102, 200, 110), 
              ],
            ),
          ),
              // color: Color.fromARGB(
              //   255,
              //   28,
              //   163,
              //   41,
              // ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const ScreenVaccinationAges()),
                  );
                },
                child: Text(
                  "Vaccination ages",
                  style: GoogleFonts.robotoCondensed(
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
              // color: Color.fromARGB(
              //   255,
              //   28,
              //   163,
              //   41,
              // ),
              decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 68, 65, 63),    
                Color.fromARGB(255, 102, 200, 110), 
              ],
            ),
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
                  style: GoogleFonts.robotoCondensed(
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
              // color: Color.fromARGB(
              //   255,
              //   28,
              //   163,
              //   41,
              // ),
              decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                 Color.fromARGB(255, 68, 65, 63),    
                Color.fromARGB(255, 102, 200, 110), 
              ],
            ),
          ),
              child: TextButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //       builder: (context) =>  VetHospitalScreen()),
                  // );
                },
                child: Text(
                  "List of Veterinary Hospitals",
                  style: GoogleFonts.robotoCondensed(
                      color: const Color.fromARGB(255, 205, 189, 175),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   uid = FirebaseAuth.instance.currentUser!.uid;
  // }
}
