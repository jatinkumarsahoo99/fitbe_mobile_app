
import 'package:flutter/material.dart';

import '../../main.dart';
import '../flavor_config.dart';


void main() {
  FlavorConfig(
    name: "Dev",
    baseUrl: "https://fitbe-dev.skill-mine.com",
    isProduction: false,
  );

  runApp(const MyApp());
  configLoading();
}
