import 'package:flutter/cupertino.dart';

class GenderProvider extends ChangeNotifier {
  String ? selectedGender = "";

  selectGender(int val) {
    selectedGender =  (val == 1)?"Male":"Female";
    notifyListeners();
  }
}
