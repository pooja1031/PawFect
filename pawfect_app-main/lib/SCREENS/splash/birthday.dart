import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pawfect/SCREENS/splash/gender.dart';



class ScreenBirthday extends StatefulWidget {
  const ScreenBirthday({super.key});

  @override
  State<ScreenBirthday> createState() => _ScreenBirthdayState();
}

class _ScreenBirthdayState extends State<ScreenBirthday> {
  TextEditingController _textEditingController = TextEditingController();
  DateTime? _selectedDate; // Step 2: Create a variable to hold the selected date

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), // Adjust the first selectable date
      lastDate: DateTime.now(), // Adjust the last selectable date
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked; // Step 4: Update the selected date
        _textEditingController.text = formatDate(picked); // Format and set the selected date to the text field
      });
        showAgePopup(context);
    }
  }

  String formatDate(DateTime date) {
    // You can customize the date format as per your preference
    return '${date.day}/${date.month}/${date.year}';
  }
  void showAgePopup(BuildContext context) {
    int ageInYears = calculateAge(_selectedDate!);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Your Dog Age'),
          content: Text('Your dog is $ageInYears years old!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child:const Text('OK'),
            ),
          ],
            );
      },
    );
  }

  int calculateAge(DateTime birthday) {
    DateTime now = DateTime.now();
    int age = now.year - birthday.year;
    if (now.month < birthday.month || (now.month == birthday.month && now.day < birthday.day)) {
      age--;
    }
    return age;
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color(
            (0xFFE6E1DD),
          ),
          body: ListView(children: [
            ListTile(
              leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
                iconSize: 32,
              ),
              // trailing: Padding(
              //   padding: const EdgeInsets.only(left: 78.0, top: 40),
              //   child: Container(
              //     height: 200,
              //     width: 300,
              //     child: Transform.scale(
              //       scale: 5.5,
              //       child: Image.asset("assets/Images/paws.png"),
              //     ),
              //   ),
              // ),
            ),
         const   SizedBox(
              height: 50,
            ),
          const  ListTile(
              leading: Padding(
                padding:  EdgeInsets.only(left: 28.0),
                child: Text(
                  "When did You Celebrate Your\n          Dog’s Birthday?!!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
            ),
          const  SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0, right: 40),
              child:GestureDetector(
      onTap: () => _selectDate(context), // Show the date picker when tapping the GestureDetector
      child: AbsorbPointer(
        child: TextField(
          controller: _textEditingController,
          decoration: const InputDecoration(
            hintText: 'Enter your dog\'s Birthday',
            labelText: 'Dog\'s Birthday',
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color:  Color.fromARGB(255, 28, 163, 41),
              ),
            ),
            filled: true, // Set filled property to true
            fillColor: Color.fromARGB(255, 205, 189, 175),
            contentPadding: EdgeInsets.symmetric(
              vertical: 17.0, // Adjust vertical padding
              horizontal: 26.0, // Adjust horizontal padding
            ),))))
            ),
          const  SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Container(
                width: 200, // Adjust the width of the box as desired
                height: 350, // Adjust the height of the box as desired
                decoration: BoxDecoration(
                  color: Colors.white, // Color of the box
                  border: Border.all(
                      color: Colors.white, width: 2), // Border properties
                ),
                child: Image.asset(
                  "assets/Images/bday.jpg",
                  fit: BoxFit.contain, // Fit the image within the box
                ),
              ),
            ),
          const  SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 210.0, right: 41),
              child: MaterialButton(
                height: 50,
                minWidth: 90,

                onPressed: () async {
                 if (_textEditingController.text.isEmpty) {
    // Show snackbar to inform the user to enter the details
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please enter your dog\'s birthday.'),
        duration: Duration(seconds: 2),
      ),
    );
  } else {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const ScreenGender()),
    );
  }
                },

                // ignore: sort_child_properties_last

                // ignore: prefer_const_constructors
                child: Text(
                  'Continue',
                  style: TextStyle(color: Colors.white, fontSize: 22),
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
          ])),
    );
  }
}
