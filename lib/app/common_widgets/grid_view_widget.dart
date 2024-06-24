import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
    "title": "Calories",
    "value": "360",
    "unit": "Kcal",
    "icon": Icons.local_fire_department,
      "color":const Color(0xffFFF6E0),
      "iconColor":Colors.amber

  },
    {
      "title": "Step",
      "value": "300",
      "unit": "Step",
      "icon": Icons.do_not_step,
      "color":const Color(0xffEFF0FF),
      "iconColor":Colors.blueAccent
    },
    {
      "title": "Training",
      "value": "1.4",
      "unit": "Hours",
      "icon": Icons.fitness_center_sharp,
      "color":const Color(0xffDDFFDA),
      "iconColor":Colors.green
    },
    {
      "title": "Sleep",
      "value": "6.34",
      "unit": "Hours",
      "icon": Icons.bed,
      "color":const Color(0xffEEF7FF),
      "iconColor":Colors.blue
    },
  ];

  GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0, // Space between columns
        mainAxisSpacing: 10.0, // Space between rows
        childAspectRatio: 1.0, // Ratio of width to height of each item
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: items[index]['color']?? const Color(0xFFFFF8E1), // Light beige color
            borderRadius: BorderRadius.circular(20), // Rounded corners
            // border: Border.all(color: Colors.blueAccent, width: 2),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[index]["title"],
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black),
                  ),
                  Icon(
                    items[index]["icon"],
                    color: items[index]['iconColor']?? Colors.amber,
                    size: 24.0,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(
                items[index]["value"],
                style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w500, color: Colors.black),
              ),
              Text(
                items[index]["unit"],
                style: const TextStyle(fontSize: 16, color: Colors.grey,fontWeight: FontWeight.w400),
              ),
            ],
          ),
        );
      },
    );
  }
}