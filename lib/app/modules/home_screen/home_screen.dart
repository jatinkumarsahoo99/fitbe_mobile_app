import 'package:flutter/material.dart';

import '../../common_widgets/card_widget_with_per.dart';
import '../../common_widgets/goal_data_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              CardWidgetWithPer(),
              SizedBox(
                height: 15,
              ),
              GoalDataCard()
            ],
          ),
        )));
  }
}
