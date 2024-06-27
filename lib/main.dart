import 'package:fitbe/app/app_theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/app_routes/app_routes.dart';
import 'app/modules/splash_screen/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness:  Brightness.dark,
    statusBarBrightness:  Brightness.dark,
    // systemNavigationBarColor: themeData.scaffoldBackgroundColor,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness:  Brightness.dark,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitbe',
      theme:AppTheme.getAppTheme(),
      home:  const SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.appRoutes,
    );
  }
}
