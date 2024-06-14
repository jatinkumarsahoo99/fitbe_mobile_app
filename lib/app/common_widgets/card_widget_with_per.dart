import 'package:fitbe/app/app_theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../app_theme/text_styles.dart';

class CardWidgetWithPer extends StatelessWidget {
  const CardWidgetWithPer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ Color(0xFF2C97D3), Color(0xFF17396D)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 26.0,right: 26,top: 16,bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("My Goal",style: TextStyles(context).googleRubikFontsForButtonText(fontWeight: FontWeight.w600,fontSize: 32),),
                Text("Today’s Goal Completion",style: TextStyles(context).googleRubikFontsForButtonText(fontWeight: FontWeight.w400,fontSize: 14),),
              ],
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 7.0,
              animation: true,
              percent: 0.75,

              center: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                   Text(
                    "75",
                    style:TextStyles(context).googleRubikFontsForButtonText(fontSize: 24,fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "%",
                    style:TextStyles(context).googleRubikFontsForButtonText(fontSize: 8,fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              circularStrokeCap: CircularStrokeCap.round,
              backgroundColor: const Color(0xFF2C97D3),
              progressColor: const Color(0xFF2CBFD3),
              backgroundWidth: 7,

              // arcBackgroundColor: Color(0xFF17396D),
              // arcType: ArcType.FULL,
            ),
          ],
        ),
      ),
    );
  }
}
