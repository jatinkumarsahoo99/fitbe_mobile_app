import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
    "title": "Calories Burnt",
    "value": "360",
    "unit": "Kcal",
    "icon": Icons.local_fire_department,
      "color":const Color(0xffFFF6E0),
      "iconColor":Colors.amber

  },
    {
      "title": "Calories Intake",
      "value": "300",
      "unit": "Kcal",
      "icon": Icons.food_bank_rounded,
      "color":const Color(0xffEFF0FF),
      "iconColor":Colors.blueAccent
    },
   /* {
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
    },*/
  ];

  GridViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 10.0, // Space between columns
        mainAxisSpacing: 10.0, // Space between rows
        childAspectRatio: 1.2, // Ratio of width to height of each item
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: items[index]['color']?? const Color(0xFFFFF8E1), // Light beige color
            borderRadius: BorderRadius.circular(20), // Rounded corners
            // border: Border.all(color: Colors.blueAccent, width: 2),
          ),
          padding: const EdgeInsets.only(left: 12.0,right: 12,top: 6,bottom: 6),
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