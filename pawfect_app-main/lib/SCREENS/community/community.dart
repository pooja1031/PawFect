import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:pawfect/SCREENS/community/comments.dart';

class ScreenCommunity extends StatefulWidget {
  const ScreenCommunity({super.key});

  @override
  State<ScreenCommunity> createState() => _ScreenCommunityState();
}

class _ScreenCommunityState extends State<ScreenCommunity> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        floatingActionButton: FloatingActionButton(
          // ignore: prefer_const_constructors
          backgroundColor: Color.fromARGB(255, 73, 71, 71),

          child: const Icon(
            Icons.add,
            size: 30,
            color: Color.fromARGB(255, 236, 225, 225),
          ),
          onPressed: () {
            addapost(context);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 35.0, left: 10, right: 10),
                    child: Text(
                      "Pet Community",
                      style: TextStyle(
                          color: Color.fromARGB(255, 144, 111, 82),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 163,
                    height: 180,
                    color: Colors.amber,
                    child: Image.asset(
                      'assets/Images/community.png', // Replace with your image asset path
                      fit: BoxFit.cover, // Adjust the fit as needed
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 250.0),
                child: Container(
                  width: 150,
                  height: 50,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      "My Feeds",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
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
                              'Comments',
                              style: TextStyle(color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(
                              255,
                              28,
                              163,
                              41,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            showReplayOptionsadd(context);
                          },
                          icon: Icon(Icons.reply),
                        ),
                        Text("Reply"),
                      ],
                    ),
                  ],
                ),
              ),
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
                              'Comments',
                              style: TextStyle(color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(
                              255,
                              28,
                              163,
                              41,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            showReplayOptionsadd(context);
                          },
                          icon: Icon(Icons.reply),
                        ),
                        Text("Reply"),
                      ],
                    ),
                  ],
                ),
              ),
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
                              'Comments',
                              style: TextStyle(color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(
                              255,
                              28,
                              163,
                              41,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            showReplayOptionsadd(context);
                          },
                          icon: Icon(Icons.reply),
                        ),
                        Text("Reply"),
                      ],
                    ),
                  ],
                ),
              ),
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
                              'Comments',
                              style: TextStyle(color: Colors.white),
                            ),
                            // ignore: prefer_const_constructors
                            color: Color.fromARGB(
                              255,
                              28,
                              163,
                              41,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        IconButton(
                          iconSize: 35,
                          onPressed: () {
                            showReplayOptionsadd(context);
                          },
                          icon: Icon(Icons.reply),
                        ),
                        Text("Reply"),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

showReplayOptionsadd(BuildContext context) {
  final myController = TextEditingController();
  double vwidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Color.fromARGB(255, 97, 101, 97),
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 250,
        width: vwidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Reply Here',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: vwidth * 0.90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "give your reply here",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 94, 70, 157),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: vwidth * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromARGB(255, 8, 219, 117),
                      ),
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: vwidth * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromARGB(255, 8, 219, 117),
                      ),
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                        label: Text(
                          'Done',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

addapost(BuildContext context) {
  final myController = TextEditingController();
  double vwidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      backgroundColor: Color.fromARGB(255, 97, 101, 97),
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 250,
        width: vwidth,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: Text(
                    'Add a Post',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: vwidth * 0.90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: myController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "enter your thoughts",
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 94, 70, 157),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: vwidth * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromARGB(255, 8, 219, 117),
                      ),
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        label: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: vwidth * 0.33,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color.fromARGB(255, 8, 219, 117),
                      ),
                      child: TextButton.icon(
                        icon: const Icon(
                          Icons.done,
                          color: Colors.black,
                        ),
                        onPressed: () {},
                        label: Text(
                          'Post',
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}
