import 'package:fitbe/app/app_theme/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'app/app_routes/app_routes.dart';
import 'app/modules/splash_screen/splash_screen.dart';

import 'flavors/dev/dev_main.dart' as dev;
import 'flavors/prod/prod_main.dart' as prod;

// import 'flavors/env.dart' as env;

void main() {
  // runApp(const MyApp());

  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'prod':
      prod.main();
      break;
    case 'dev':
    default:
      dev.main();
      break;



  }
  // env.main();
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = const Color(0xFF2CBFD3)
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitbe',
      theme: AppTheme.getAppTheme(),
      home: const SplashScreen(),
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(builder: (context, widget) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: widget ?? Container(),
        );
      }),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes.appRoutes,
    );
  }
}
