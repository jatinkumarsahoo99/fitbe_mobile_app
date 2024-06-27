
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
// import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 44,
          ),
          Image.asset(
            "assets/images/intro.png",
            height: 357.5,
          ),
          const SizedBox(
            height: 75,
          ),
          Text(
            "Empowering Your Fitness Goals,",
            style: TextStyles(context).googleRubikFontsForHeading(fontSize: 18),
          ),
          Text(
            "Every Day.",
            style:
                TextStyles(context).googleRubikFontsForHeading2(fontSize: 18),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.",
              style: TextStyles(context).googleRubikFontsForText(
                  fontSize: 10, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          // Text("Every Day.",style:TextStyles(context).googleRubikFontsForHeading2(fontSize: 18),),
          CommonButton(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 40, top: 24),
            buttonText: "Let’s Get Started",
            radius: 30,
            onTap: () {
              Navigator.pushNamed(context, "/signInScreen");
            },
          ),
          Expanded(
            child: Container(),
          ),
          Text.rich(TextSpan(
              text: "Already Have An Account? ",
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF202020))),
              children: <InlineSpan>[
                TextSpan(
                    text: "Sign In",
                    style: GoogleFonts.rubik(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Color(0xFF2CBFD3),
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: Color(0xFF2CBFD3),
                      ),
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {

                    })
              ])),

        ],
      ),
    );
  }
}
