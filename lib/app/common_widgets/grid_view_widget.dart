import 'package:flutter/material.dart';

class GridViewExample extends StatelessWidget {
  final List<Map<String, dynamic>> items = List.generate(4, (index) => {
    "title": "Calories",
    "value": "360",
    "unit": "Kcal",
    "icon": Icons.local_fire_department, // You can change the icon here
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
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
              color: const Color(0xFFFFF8E1), // Light beige color
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
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Icon(
                      items[index]["icon"],
                      color: Colors.amber,
                      size: 24.0,
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  items[index]["value"],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                Text(
                  items[index]["unit"],
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}