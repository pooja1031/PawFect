import 'package:flutter/material.dart';

class DogData extends ChangeNotifier {
  String? dogName;

  void setDogName(String name) {
    dogName = name;
    notifyListeners();
  }
}
