// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:lottie/lottie.dart';
// import 'package:pinput/pinput.dart';

// class ScreenVerification extends StatefulWidget {
//   const ScreenVerification({super.key});

//   @override
//   State<ScreenVerification> createState() => _ScreenVerificationState();
// }

// class _ScreenVerificationState extends State<ScreenVerification> {
//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56,
//       height: 56,
//       textStyle: TextStyle(
//           fontSize: 20,
//           color: Color.fromRGBO(30, 60, 87, 1),
//           fontWeight: FontWeight.w600),
//       decoration: BoxDecoration(
//         border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
//         borderRadius: BorderRadius.circular(20),
//       ),
//     );

//     final focusedPinTheme = defaultPinTheme.copyDecorationWith(
//       border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
//       borderRadius: BorderRadius.circular(8),
//     );

//     final submittedPinTheme = defaultPinTheme.copyWith(
//       decoration: defaultPinTheme.decoration?.copyWith(
//         color: Color.fromRGBO(234, 239, 243, 1),
//       ),
//     );

//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromARGB(255, 205, 189, 175),
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           leading: IconButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             icon: Icon(Icons.arrow_back),
//             color: Colors.black,
//           ),
//         ),
//         body: Column(
//           children: [
//             Lottie.asset("animations/animation_lkhmxh5n.json"),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 65.0),
//               child: Row(
//                 children: [
//                   Pinput(
//                     length: 4,
//                     pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//                     showCursor: true,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
