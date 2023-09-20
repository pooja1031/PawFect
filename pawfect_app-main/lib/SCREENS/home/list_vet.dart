// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class VetHospitalScreen extends StatefulWidget {
//   @override
//   _VetHospitalScreenState createState() => _VetHospitalScreenState();
// }

// class _VetHospitalScreenState extends State<VetHospitalScreen> {
//   final TextEditingController locationController = TextEditingController();
//   List<dynamic> hospitals = [];

//   Future<void> searchVetHospitals(String location) async {
//     final apiKey = 'AIzaSyCsmiqasXbcUAqGhckoh5vT2ZSCYHEQgXo'; 
//     final placesApiUrl =
//         'https://maps.googleapis.com/maps/api/place/textsearch/json?query=veterinary+hospital+in+$location&key=$apiKey';

//     final response = await http.get(Uri.parse(placesApiUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       setState(() {
//         hospitals = data['results'];
//       });
//     } else {
//       throw Exception('Failed to load vet hospitals');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: true,

//       appBar: AppBar(
//         title: Text('Find Veterinary Hospitals'),
//       ),
//      body: SingleChildScrollView(
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             decoration: InputDecoration(
//               hintText: 'Enter text',
//               labelText: 'Text Field',
//             ),
//           ),
//         ),
//           ElevatedButton(
//             onPressed: () async {
//               final location = locationController.text;
//               await searchVetHospitals(location);
//             },
//             child: Text('Find Hospitals'),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: hospitals.length,
//               itemBuilder: (ctx, index) {
//                 final hospital = hospitals[index];
//                 return ListTile(
//                   title: Text(hospital['name']),
//                   subtitle: Text(hospital['formatted_address']),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//      ) );
//   }
// }
