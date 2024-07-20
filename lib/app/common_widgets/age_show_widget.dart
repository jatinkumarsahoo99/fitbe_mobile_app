import 'package:flutter/material.dart';

class AgeShowWidget extends StatelessWidget {
  final int year;
  final int month;
  final int days;

  const AgeShowWidget({super.key, required this.year, required this.month, required this.days});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$year year's "),
        Text("$month month's "),
        Text("$days day's"),
      ],
    );
  }
}
