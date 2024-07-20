import 'package:flutter/material.dart';

import '../modules/change_password/change_password.dart';
import '../modules/forgot_password/forgot_password.dart';
import '../modules/forgot_password/forgot_password_otp.dart';
import '../modules/home_screen/home_screen.dart';
import '../modules/intro_screen/intro_screen.dart';
import '../modules/preference_screen/preference_screen.dart';
import '../modules/recommendation_screen/recommendation_screen.dart';
import '../modules/sign_in_screen.dart';
import '../modules/signup_screen/signup_screen.dart';
import '../modules/splash_screen/splash_screen.dart';
import '../modules/verification_screen/verification_screen.dart';

class AppRoutes{
  // late BuildContext context;
  static Map<String,WidgetBuilder> appRoutes = {
    "/splashScreen":(context) =>  const SplashScreen(),
    "/introScreen":(context) => const IntroScreen(),
    "/signupScreen": SignUpScreen.builder,
    "/verificationScreen":(context) => const VerificationScreen(),
    "/signInScreen":(context) => const SigninScreen(),
    "/forgotPassword":(context) => const ForgotPassword(),
    "/forgotPasswordOtp":(context) => const ForgotPasswordOtp(),
    "/preferenceScreen":PreferenceScreen.builder,
    "/recommendationScreen":(context) => const RecommendationScreen(),
    "/homeScreen": HomeScreen.builder,
    "/changePassword":(context) => const ChangePassword(),
  };

}