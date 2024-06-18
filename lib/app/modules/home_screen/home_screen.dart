import 'package:flutter/material.dart';

import '../../common_widgets/card_widget_with_per.dart';
import '../../common_widgets/goal_data_card.dart';
import '../../common_widgets/grid_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Row(
            children: [
              Column(
                children: [],
              ),
            ],
          ),
          const CardWidgetWithPer(),
          SizedBox(
              height: 350,
              child: GridViewExample()),
          const SizedBox(
            height: 15,
          ),
          const GoalDataCard()
        ],
      ),
    )));
  }
}
