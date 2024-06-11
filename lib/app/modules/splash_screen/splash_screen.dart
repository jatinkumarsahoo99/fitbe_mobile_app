import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  callTimer(){
      debugPrint(">>>>>>>>>>>>>>>callTimer");
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, "/introScreen");
      });
  }

  @override
  void initState() {
    callTimer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: SvgPicture.asset("assets/images/fitbe_logo.svg"),
      ),
    );
  }
}
