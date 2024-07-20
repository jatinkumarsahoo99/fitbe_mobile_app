
import 'package:flutter/material.dart';

import '../../main.dart';
import '../flavor_config.dart';

void main() {
  FlavorConfig(
    name: "Production",
    baseUrl: "https://fitbe-main.skill-mine.com",
    isProduction: true,
  );

  runApp(const MyApp());
  configLoading();
}
