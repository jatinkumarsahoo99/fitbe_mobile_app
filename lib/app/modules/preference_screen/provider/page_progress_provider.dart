import 'package:flutter/cupertino.dart';

class PageProgressProvider extends ChangeNotifier {
  int currentShowIndex = 0;

  setPageProgress(int val) {
    currentShowIndex = val ;
    notifyListeners();
  }
}
