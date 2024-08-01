import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_theme/text_styles.dart';
import '../recommendation_screen/IconValModel.dart';

class DailyPlan extends StatefulWidget {
  const DailyPlan({super.key});

  @override
  State<DailyPlan> createState() => _DailyPlanState();
}

class _DailyPlanState extends State<DailyPlan> {
  List<IconValModel> lstDataForFooter = [
    IconValModel(
        icon: "break_fast",
        textHeader: "Gap of 14 hours between Dinner",
        textDesc:
            "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae consequat integer. Mauris eu metus dictum risus mauris mauris purus. Tristique mi arcu maecenas enim quis. Elementum at lobortis dolor morbi orci integer purus."),
    IconValModel(
        icon: "cardio",
        textDesc: "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae consequat integer.",
        textHeader: "No Carbonated, Aerated or Sugary Drinks"),
    IconValModel(
        icon: "drink",
        textDesc:
            "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae consequat integer. Mauris eu metus",
        textHeader: "Avoid all kinds of sweets"),
    IconValModel(
        icon: "meal",
        textDesc: "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget",
        textHeader: "Limited Coffee/Tea with Sugar"),
    IconValModel(
        icon: "walk",
        textDesc:
            "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae consequat integer. Mauris eu metus dictum risus mauris mauris purus. Tristique mi arcu maecenas enim quis. Elementum at lobortis dolor morbi orci integer purus.",
        textHeader: "Walk for 1 hour before breakfast"),
    IconValModel(
        icon: "walk",
        textDesc:
            "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae consequat integer. Mauris eu metus dictum risus mauris mauris purus. Tristique mi arcu maecenas enim quis. Elementum at lobortis dolor",
        textHeader: "Limit Cardio, HIIT, Weight training to 2 days a week"),
    IconValModel(
        icon: "walk",
        textDesc: "Lorem ipsum dolor sit amet consectetur. Augue donec varius pretium eget mattis vitae conseq",
        textHeader: "If hungry outside meal times, try water first."),
    // IconValModel(icon: "coffee",textVal: "Limit Cardio, HIIT, Weight training to 2 days a week"),
    // IconValModel(icon: "sweets",textVal: "If hungry outside meal times, try water first."),
  ];

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
                    "Daily Plan",
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
              SizedBox(
                child: ListView.builder(
                    itemCount: lstDataForFooter.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset(
                              "assets/images/${lstDataForFooter[index].icon}.svg",
                              width: 35,
                              height: 35,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: size.width * 0.76,
                                  child: Text(
                                    lstDataForFooter[index].textHeader ?? "",
                                    maxLines: 3,
                                    style: TextStyles(context)
                                        .googleRubikFontsForSecondaryText(fontSize: 12, fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                SizedBox(
                                    width: size.width * 0.76,
                                    child: Text(
                                      lstDataForFooter[index].textDesc ?? "",
                                      maxLines: 10,
                                      style: TextStyles(context)
                                          .googleRubikFontsForSecondaryText(fontSize: 10, fontWeight: FontWeight.w400),
                                    )),
                              ],
                            )
                          ],
                        ),
                      );
                    }),
              ),
              Expanded(
                flex: 18,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
