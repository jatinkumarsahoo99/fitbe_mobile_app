import 'dart:async';

import 'package:fitbe/app/modules/intro_screen/strava_authentication.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strava_client/strava_client.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widgets/common_button.dart';
// import 'package:flutter_svg/svg.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late final StravaClient stravaClient;
  TokenResponse? token;
  @override
  void initState() {
    stravaClient = StravaClient(secret: "8d016d9d0c15ac0e88aa59b4dfc188357b0833e3", clientId: "131394");
    super.initState();
  }

  FutureOr<Null> showErrorMessage(dynamic error, dynamic stackTrace) {
    if (error is Fault) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Did Receive Fault"),
              content: Text(
                  "Message: ${error.message}\n-----------------\nErrors:\n${(error.errors ?? []).map((e) => "Code: ${e.code}\nResource: ${e.resource}\nField: ${e.field}\n").toList().join("\n----------\n")}"),
            );
          });
    }
  }

  void testAuthentication() {
    ExampleAuthentication(stravaClient).testAuthentication(
      [AuthenticationScope.profile_read_all, AuthenticationScope.read_all, AuthenticationScope.activity_read_all],
      "https://fitbe-dev.skill-mine.com/strava/test/code/jatin",
    ).then((token) {
      this.token = token;
      print(">>>>>>token$token");
    }).catchError(showErrorMessage);
  }

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
            style: TextStyles(context).googleRubikFontsForHeading2(fontSize: 18),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut et massa mi. Aliquam in hendrerit urna.",
              style: TextStyles(context).googleRubikFontsForText(fontSize: 10, fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
          // Text("Every Day.",style:TextStyles(context).googleRubikFontsForHeading2(fontSize: 18),),
          CommonButton(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 40, top: 24),
            buttonText: "Let’s Get Started",
            radius: 30,
            onTap: () {
              Navigator.pushNamed(context, "/signInScreen");
              // testAuthentication();
            },
          ),
          Expanded(
            child: Container(),
          ),
          Text.rich(TextSpan(
              text: "Already Have An Account? ",
              style: GoogleFonts.rubik(
                  textStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Color(0xFF202020))),
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
                    recognizer: TapGestureRecognizer()..onTap = () {})
              ])),
        ],
      ),
    );
  }
}
