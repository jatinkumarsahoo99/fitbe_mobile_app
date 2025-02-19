import 'dart:convert';

import 'package:fitbe/app/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_utils/shared_preferance.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with Helper {
  SharedPref sharedPref = SharedPref();
  callTimer() {
    debugPrint(">>>>>>>>>>>>>>>callTimer");
    Future.delayed(const Duration(seconds: 3), () {
      getLogInData();
    });
  }

  getLogInData() async {
    String? isLogIn = await sharedPref.getKey("isLogIn");
    String? logInSta = await sharedPref.getKey("logInSta");
    var logInData = await sharedPref.getKey("logInData");
    var userPrefData = await sharedPref.getKey("userData");

    if (isLogIn.toString().contains("true")) {
      if (logInSta.toString().contains("VERIFICATION_PENDING")) {
        if (logInData != null && logInData != "" && logInData != "null") {
          Map<String, dynamic> map = json.decode(json.decode(logInData));
          debugPrint(">>>>>loginData$isLogIn $logInSta $map");
          openDialog(map);
        } else {
          await sharedPref.save("isLogIn", "false");
          Navigator.pushNamedAndRemoveUntil(
            context,
            "/introScreen",
            (Route<dynamic> route) => false,
          );
        }
      } else if ((jsonDecode(logInSta ?? "")).toString().trim() == "COMPLETED") {
        Navigator.pushNamedAndRemoveUntil(
          context,
          "/homeScreen",
          (Route<dynamic> route) => false,
        );
      } else if (logInSta.toString().contains("VERIFICATION_COMPLETED")) {
        Navigator.pushNamedAndRemoveUntil(context, "/preferenceScreen", (Route<dynamic> route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, "/introScreen", (Route<dynamic> route) => false);
      }
    }
    else {
      Navigator.pushNamedAndRemoveUntil(context, "/introScreen", (Route<dynamic> route) => false);
    }

    debugPrint(">>>>>loginData$isLogIn $logInSta");
  }

  openDialog(Map<String, dynamic> postData) async {
    bool isOk = await showCommonPopupNew("Verification", "Verification Pending\nPlease complete your verification", context,
        barrierDismissible: false, isYesOrNoPopup: false);
    if (isOk) {
      Navigator.pushNamed(
        context,
        "/verificationScreen",
        arguments: postData,
      );
    }
  }

  @override
  void initState() {
    callTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/images/fitbe_logo.svg"),
      ),
    );
  }
}
