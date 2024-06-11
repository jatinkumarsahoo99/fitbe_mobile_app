

import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';

class GenderScreen extends StatefulWidget {
  Function(int index) onTap;
   GenderScreen({super.key,required this.onTap});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          "Tell Us About Yourself!",
          textAlign: TextAlign.center,
          style: TextStyles(context).googleRubikFontsForHeading(
              fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "For a Tailored Experience, Please Share Your Gender.",
          textAlign: TextAlign.center,
          style: TextStyles(context).googleRubikFontsForText(
              fontSize: 10, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 32,
        ),
        GestureDetector(
          onTap: (){
            widget.onTap(1);
            selectedIndex = 1;
            setState(() {

            });
          },
          child: Container(
            /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),*/
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color:(selectedIndex == 1)? const Color(0xFF2CBFD3) :  const Color(0xFFF4F6F9)),
            child:  Padding(
              padding:  const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Icon(Icons.male,size: 40,),
                  Text("Male",style:TextStyles(context).googleRubikFontsForHeading(fontSize: 12,fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height:40 ,
        ),

        GestureDetector(
          onTap: (){
            widget.onTap(2);
            selectedIndex = 2;
            setState(() {

            });
          },
          child: Container(
           /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),*/
            decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color:(selectedIndex == 2)? const Color(0xFF2CBFD3) :  const Color(0xFFF4F6F9)),
            child:  Padding(
              padding:  const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Icon(Icons.female,size: 40,),
                  Text("Female",style:TextStyles(context).googleRubikFontsForHeading(fontSize: 12,fontWeight: FontWeight.w400))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
