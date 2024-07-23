
import 'package:fitbe/flavors/flavor_config.dart';
import 'package:fitbe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  FlavorConfig(
    name: "Dev",
    baseUrl: "https://fitbe-dev.skill-mine.com",
    isProduction: false,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    // systemNavigationBarColor: themeData.scaffoldBackgroundColor,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
  configLoading();
}
