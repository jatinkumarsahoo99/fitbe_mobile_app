
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';
import '../flavor_config.dart';


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
