import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../../../app_api_services/api_end_point.dart';
import '../../../app_api_services/http_methods.dart';
import '../../../app_utils/shared_preferance.dart';
import '../model/userDetails.dart';

class ProfileProvider extends ChangeNotifier {
  UserDetails? userDetails;
  bool isLoading = true;

  callUserDetailsApi() async {
    try {
      isLoading = true;
      SharedPref sharedPref = SharedPref();
      var userId = await sharedPref.getKey("userID");
      HttpMethodsDio().getMethod(
          api: ApiEndPoint.getUserDetails(json.decode(userId)),
          fun: (map, code) {
            debugPrint(">>>>>>>>>map$map");
            if (code == 200) {
              userDetails = UserDetails.fromJson(map);
              isLoading = false;
              notifyListeners();
            } else {
              userDetails = null;
              isLoading = false;
              notifyListeners();
            }
          });
    } catch (e) {
      userDetails = null;
      isLoading = false;
      notifyListeners();
    }
  }
}
