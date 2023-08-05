import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenFoodsToAvoid extends StatefulWidget {
  const ScreenFoodsToAvoid({super.key});

  @override
  State<ScreenFoodsToAvoid> createState() => _ScreenFoodsToAvoidState();
}

class _ScreenFoodsToAvoidState extends State<ScreenFoodsToAvoid> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 205, 189, 175),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200),
        child: AppBar(
          flexibleSpace: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0),
                child: Image.asset(
                  'assets/Images/food.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 75,
                left: 130,
                right: 60,
                child: Text(
                  '    Doggie\nFood  No No’s',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //   body: Column(
      //      Image.asset(
      //       'assets/Images/image1.jpg',
      //       fit: BoxFit.cover,
      //     ),
      // ),
      body: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: 290, // Set your desired width
              height: 300, // Set your desired height
              child: Image.asset(
                'assets/Images/ttt2.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
