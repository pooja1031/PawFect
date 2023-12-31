



// ----------------------
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pawfect/SCREENS/home/home.dart';
import 'package:pawfect/SCREENS/splash/name.dart';
import 'package:pawfect/SCREENS/widgets/mainpage.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // ignore: unused_field
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();


  final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    

    

  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 205, 189, 175),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
        ),
    
      body:
       Container(
        
            decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
               // Color.fromARGB(255, 28, 163, 41),    // Ending color
    Color.fromARGB(255, 205, 189, 175),

                Color.fromARGB(255, 200, 234, 203), // Starting color
                                Color.fromARGB(255, 134, 190, 201),    // Ending color

                                    Color.fromARGB(255, 146, 229, 155),    // Ending color

              ],
            ),
          ),
         child: Column(
          children: [
            Lottie.asset("animations/animation_lkhmxh5n.json"),
              SizedBox(
                height: 20,
              ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
               
                controller: _pinPutController,
             
                pinAnimationType: PinAnimationType.fade,
                onSubmitted: (pin) async {
         try {
           
           await FirebaseAuth.instance
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: _verificationCode!, smsCode: pin))
          .then((value) async {
             if (value.user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => screenDogName()),
              (route) => false);
             } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Invalid OTP. Please enter the correct OTP.')));
             }
           });
         } catch (e) {
           ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
         }
       },
       
              ),
            )
          ],
             ),
       ),
      ) );
  }
//-------
  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => screenDogName()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
void initState() {
  super.initState();
  _verifyPhone();
}

}
