

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:pawfect/SCREENS/splash/splash.dart';
import 'package:pawfect/providers/user_provider.dart';
import 'package:provider/provider.dart';




void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
    // Initialize Hive
      // Initialize Hive


   runApp(ChangeNotifierProvider(
      create: (context) => SelectedImageProvider(),
    child: const MyApp()));
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const splashscreen());
  }
}
