import 'package:flutter/material.dart';

import '../../common_widgets/bmi_category_bar.dart';
import '../../common_widgets/custome_tab_view.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomTabView(
          itemCount: 3,
          tabBuilder: (BuildContext context, int index) {
            return const Tab(
              text: "Week 3",
              height: 32,
            );
          },
          pageBuilder: (BuildContext context, int index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: BMICategoryBar(),
            );
          },
          onPositionChange: (index) {

          },
          onScroll: (position) =>
              debugPrint("On Scrolled Called>>>>${position.toString()}"),
        ),
      ),
    );
  }
}
