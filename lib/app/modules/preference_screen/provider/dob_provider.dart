import 'package:flutter/material.dart';

class DobProvider extends ChangeNotifier {
  TextEditingController dateOfBirth = TextEditingController();

  int year = 0;
  int month = 0;
  int days = 0;

  setDOBData(int yearData, int monthData, int daysData, String dateOfBirthData) {
    dateOfBirth.text = dateOfBirthData;
    year = yearData;
    month = monthData;
    days = daysData;
    notifyListeners();
  }
}
