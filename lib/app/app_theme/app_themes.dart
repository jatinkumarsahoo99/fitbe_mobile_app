

import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme{
  static bool isLightMode = true;

  static Color get scaffoldBackgroundColor =>
      isLightMode ? const Color(0xFFF7F7F7) : const Color(0xFF1A1A1A);

  static Color get redErrorColor =>
      isLightMode ? const Color(0xFFAC0000) : const Color(0xFFAC0000);

  static Color get backgroundColor =>
      isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF2C2C2C);

  static Color get primaryTextColor =>
      isLightMode ? const Color(0xFF262626) : const Color(0xFFFFFFFF);

  static Color get secondaryTextColor =>
      isLightMode ? const Color(0xFFADADAD) : const Color(0xFF6D6D6D);

  static ThemeData getAppTheme(){
    return ThemeData(
      scaffoldBackgroundColor: ColorsGroup.scaffoldBackgroundColor,
      focusColor: ColorsGroup.primaryColor,
      primaryColor: ColorsGroup.primaryColor,
      useMaterial3: true,
        primarySwatch:Colors.blue,
    );
  }

}