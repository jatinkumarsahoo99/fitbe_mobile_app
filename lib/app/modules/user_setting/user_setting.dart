import 'package:flutter/material.dart';

import '../../app_theme/text_styles.dart';

class UserSetting extends StatefulWidget {
  const UserSetting({super.key});

  @override
  State<UserSetting> createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          // color: const Color(0xFFD9D9D9)
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_back_sharp,
                            size: 20,
                          ),
                        )),
                  ),
                  Text(
                    "Setting",
                    textAlign: TextAlign.center,
                    style: TextStyles(context).googleRubikFontsForHeading(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
              
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
