import 'package:fitbe/app/common_widgets/week_status_widget.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class GoalDataCard extends StatelessWidget {
  const GoalDataCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ Color(0xFF606591), Color(0xFF2088B4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child:  Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Goal Data",style: TextStyles(context).googleRubikFontsForButtonText(fontSize: 16,fontWeight: FontWeight.w500),),
                Text("Last 7 days >",style: TextStyles(context).googleRubikFontsForButtonText(fontSize: 12,fontWeight: FontWeight.w400))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Column(
                  children: [
                    Text("4 of 7",style: TextStyles(context).googleRubikFontsForButtonText(fontSize: 14,fontWeight: FontWeight.w500),),
                    Text("Archived",style: TextStyles(context).googleRubikFontsForButtonText(fontSize: 14,fontWeight: FontWeight.w500),)
                  ],
                ),
                SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.535,
                    child: WeekStatusWidget())
              ],
            )
          ],
        ),
      ),
    );
  }
}
