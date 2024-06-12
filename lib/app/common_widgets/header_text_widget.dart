import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';

class HeaderTextWidget extends StatelessWidget {
  final String ? headerText;
  final String ? headDesc;
  final double ?fontSize;
  final double ?headerFontSize;
   const HeaderTextWidget({super.key,this.headDesc,this.headerText,this.fontSize,this.headerFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          headerText??"Tell Us About Yourself!",
          textAlign: TextAlign.center,
          style: TextStyles(context)
              .googleRubikFontsForHeading(
              fontSize: headerFontSize??18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          headDesc??"For a Tailored Experience, Please Share Your Gender.",
          textAlign: TextAlign.center,
          style: TextStyles(context).googleRubikFontsForText(
              fontSize: fontSize??10, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
