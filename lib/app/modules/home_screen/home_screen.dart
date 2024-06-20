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
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.tag_faces, color: Colors.blue),
                          Image.asset("assets/images/hi.png",height: 20,width: 20,),
                          const SizedBox(width: 5.0),
                          const Text(
                            'Good Morning!',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      const Text(
                        'Monty Bradshaw',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 60.0, // Radius * 2
                    height: 60.0, // Radius * 2
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/man.jpg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const CardWidgetWithPer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Daily plan",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(height: 350, child: GridViewExample()),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Goal Statistics",style: TextStyle(color: Color(0xff000000),fontSize: 18,fontWeight: FontWeight.w600),),
              ],
            ),
            const GoalDataCard()
          ],
        ),
      ),
    )));
  }
}
