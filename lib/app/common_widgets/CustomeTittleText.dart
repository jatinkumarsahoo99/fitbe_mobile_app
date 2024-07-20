import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_theme/text_styles.dart';


// import 'package:google_fonts/google_fonts.dart';


class CustomeTittleText extends StatelessWidget {
  String text;
  double? textsize;
  FontWeight? fontWeight;
  Color? color;

  CustomeTittleText(
      {super.key,
        required this.text,
        this.textsize,
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

class CustomeSubTittleText extends StatelessWidget {
  String text;
  double? textsize;
  FontWeight? fontWeight;
  Color? color;
  TextAlign? alignment;
  int? maxlines;

  CustomeSubTittleText(
      {super.key,
        required this.text,
        this.textsize,
        this.fontWeight,
        this.alignment,
        this.maxlines,
        this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyles(context)
          .getBoldStyle().copyWith(fontSize: 10,color: color) ,
      maxLines: maxlines ?? 1,
      overflow: TextOverflow.ellipsis,
      textAlign: alignment,
    );
  }
}

