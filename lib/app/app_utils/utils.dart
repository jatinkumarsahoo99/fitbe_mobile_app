import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Utils{

  static showProgressIndicator(){

    EasyLoading.show(dismissOnTap: true);
  }

  static disMissProgressIndicator(){
    EasyLoading.dismiss();
  }

  static dynamic checkUserId(String? userId) {
    if(userId != null && userId != "") {
      try {
        if (double
            .parse(userId)
            .runtimeType == double && userId.length == 10) {
          return true;
        } else {
          return "Please enter valid mobile no";
        }
      } catch (e) {
        if (userId.isValidEmail()) {
          return true;
        } else {
          return "Please enter valid email id";
        }
      }
    }else{
      return "Please enter Email Id Or Mobile Number";
    }
  }

  static bool checkIsDouble(String id){
    try{
      double.parse(id);
      return true;
    }catch(e){
      return false;
    }
  }

}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}