import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pawfect/SCREENS/community/community.dart';

class ScreenComments extends StatefulWidget {
  const ScreenComments({super.key});

  @override
  State<ScreenComments> createState() => _ScreenCommentsState();
}

class _ScreenCommentsState extends State<ScreenComments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 205, 189, 175),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 34.0),
          child: Text(
            "comments",
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 205, 189, 175),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.white,
              width: 350,
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 16),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.green,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0, left: 15),
                        child: Text(
                          "Aswin",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                      height:
                          10), // Add spacing between the first and second lines of text
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, top: 10),
                    child: Text(
                      "The weight of my dog is very low it should have been 29kg but it is now 25 kg what should i do it doesn’t eat home food it only eats chicken", // Replace with the second line of text
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 21.0),
                  child: MaterialButton(
                    height: 40,
                    minWidth: 90,

                    onPressed: () async {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => ScreenComments()),
                      );
                    },

                    // ignore: sort_child_properties_last

                    // ignore: prefer_const_constructors
                    child: Text(
                      'Answers',
                      style: TextStyle(color: Colors.white),
                    ),
                    // ignore: prefer_const_constructors
                    color: Color.fromARGB(255, 144, 111, 82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 198.0),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 64,
              ),
              child: Container(
                width: 230,
                height: 100,
                color: Colors.white,
                child: Center(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text("Feed him with royal canine"),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: MaterialButton(
                        height: 35,
                        minWidth: 60,

                        onPressed: () async {
                          showReplayOptionsadd(context);
                        },

                        // ignore: sort_child_properties_last

                        // ignore: prefer_const_constructors
                        child: Text(
                          'Reply',
                          style: TextStyle(color: Colors.white),
                        ),
                        // ignore: prefer_const_constructors
                        color: Color.fromARGB(255, 144, 111, 82),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
