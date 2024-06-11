import 'package:flutter/material.dart';

import '../modules/forgot_password/forgot_password.dart';
import '../modules/forgot_password/forgot_password_otp.dart';
import '../modules/intro_screen/intro_screen.dart';
import '../modules/signIn_screen.dart';
import '../modules/signup_screen/signup_screen.dart';
import '../modules/splash_screen/splash_screen.dart';
import '../modules/verification_screen/verification_screen.dart';

class AppRoutes{
  // late BuildContext context;
  static Map<String,Widget Function(BuildContext)> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    "/introScreen":(context) => const IntroScreen(),
    "/signupScreen":(context) => const SignUpScreen(),
    "/verificationScreen":(context) => const VerificationScreen(),
    "/signInScreen":(context) => const SigninScreen(),
    "/forgotPassword":(context) => const ForgotPassword(),
    "/forgotPasswordOtp":(context) => const ForgotPasswordOtp(),
  };

}