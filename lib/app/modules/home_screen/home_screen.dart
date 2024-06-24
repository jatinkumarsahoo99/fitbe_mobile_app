import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';
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
                           Text(
                            'Good Morning!',
                            style: TextStyles(context).googleRubikFontsForHeading(fontSize: 12,fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      // const SizedBox(height: 3.0),
                       Text(
                        'Monty Bradshaw',
                        style: TextStyles(context).googleRubikFontsForHeading(fontSize: 20,fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Container(
                    width: 50.0, // Radius * 2
                    height: 50.0, // Radius * 2
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
            const SizedBox(
              height: 4,
            ),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Daily plan",style: TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600,fontSize: 18),)
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(height: 340, child: GridViewExample()),
             Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Goal Statistics",style: TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600,fontSize: 18),),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            const GoalDataCard()
          ],
        ),
      ),
    )));
  }
}
