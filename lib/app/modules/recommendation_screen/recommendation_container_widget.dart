import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';

class RecommendationContainerWidget extends StatelessWidget {
  final String? headerText;
  final String? normalText;
  final String? valueNum;
  const RecommendationContainerWidget({super.key,this.headerText,this.normalText,this.valueNum});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          headerText??"Waist to Hip Ratio",
          textAlign: TextAlign.center,
          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 14,fontWeight: FontWeight.w400),
        ),
        Text(
          normalText??"Excellent",
          style:TextStyles(context).googleRubikFontsForText5(fontSize: 14,fontWeight: FontWeight.w400),
        ),
        Text(valueNum??"0.84",style: TextStyles(context).googleRubikFontsForText3(fontSize: 40,fontWeight: FontWeight.w500),)
      ],
    );
  }
}
