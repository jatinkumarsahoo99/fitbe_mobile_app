import 'package:fitbe/app/modules/preference_screen/provider/gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_theme/text_styles.dart';

class GenderScreen extends StatelessWidget {
  final Function(int index) onTap;

  const GenderScreen({super.key, required this.onTap});

  // int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<GenderProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                onTap(1);
                context.read<GenderProvider>().selectGender(1);
                // selectedIndex = 1;
                /*  setState(() {

                });*/
              },
              child: Container(
                /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),*/
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (context.read<GenderProvider>().selectedGender == "Male")
                        ? const Color(0xFF2CBFD3)
                        : const Color(0xFFF4F6F9)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.male,
                        size: 40,
                      ),
                      Text("Male",
                          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 12, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                onTap(2);
                // selectedIndex = 2;
                context.read<GenderProvider>().selectGender(2);
                // setState(() {
                //
                // });
              },
              child: Container(
                /* shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),*/
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (context.read<GenderProvider>().selectedGender == "Female")
                        ? const Color(0xFF2CBFD3)
                        : const Color(0xFFF4F6F9)),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.female,
                        size: 40,
                      ),
                      Text("Female",
                          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 12, fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
