import 'package:flutter/material.dart';

class GoalDataCard extends StatelessWidget {
  const GoalDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ Color(0xFF606591), Color(0xFF2088B4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Goal Data"),
                Text("Last 7 days >")
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text("4 of 7")
                  ],
                ),
                Column(
                  children: [],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
