import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';


class CustomTittleText extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? color;

  const CustomTittleText(
      {super.key,
        required this.text,
        this.textSize,
        this.fontWeight,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
      TextStyles(context)
          .getBoldStyle().copyWith(fontSize: 20)
    );
  }
}

class CustomSubTittleText extends StatelessWidget {
  final String text;
  final double? textSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign? alignment;
  final int? maxLines;

  const CustomSubTittleText(
      {super.key,
        required this.text,
        this.textSize,
        this.fontWeight,
        this.alignment,
        this.maxLines,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles(context)
          .getBoldStyle().copyWith(fontSize: 10,color: color) ,
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
    );
  }
}

