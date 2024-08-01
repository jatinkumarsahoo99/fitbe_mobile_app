import 'package:fitbe/app/modules/recommendation_screen/recommendation_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app_theme/text_styles.dart';
import '../../common_widgets/bar_indicator.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/custome_tab_view.dart';
import 'IconValModel.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  List<double> lstData = [10, 15, 25, 35, 13];
  List<Color> lstColor = [
    Colors.grey,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  List<String> headerTab = ["Week 1", "Week 2", "Week 3", "Week 4", "Week 5", "Week 6", "Week 7"];

  List<IconValModel> lstDataForFooter = [
    IconValModel(icon: "break_fast", textDesc: "Gap of 14 hours between Dinner and next day Breakfast (Only water allowed)"),
    IconValModel(icon: "cardio", textDesc: "No Carbonated, Aerated or Sugary Drinks"),
    IconValModel(icon: "drink", textDesc: "Avoid all kinds of sweets"),
    IconValModel(icon: "meal", textDesc: "Limited Coffee/Tea with Sugar"),
    IconValModel(icon: "walk", textDesc: "Walk for 1 hour before breakfast"),
    IconValModel(icon: "walk", textDesc: "Walk for 1 hour before breakfast"),
    IconValModel(icon: "walk", textDesc: "Walk for 1 hour before breakfast"),
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
                    "Recommendation",
                    textAlign: TextAlign.center,
                    style: TextStyles(context).googleRubikFontsForHeading(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Your BMI Is ",
                    textAlign: TextAlign.center,
                    style: TextStyles(context).googleRubikFontsForSecondaryText(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    onTap: () {
                      // NavigationServices(context).gotoLoginScreen();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Normal",
                        style: TextStyles(context).googleRubikFontsForText5(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "22.5",
                style: TextStyles(context).googleRubikFontsForText3(fontSize: 30, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BarIndicator(
                  barWidth: size.width * 0.8,
                  lstColor: lstColor,
                  lstData: lstData,
                  fontSize: 7,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              const Padding(
                padding: EdgeInsets.only(left: 4.0, right: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RecommendationContainerWidget(),
                    RecommendationContainerWidget(
                      headerText: "Waist to Height Ratio",
                      normalText: "Healthy",
                      valueNum: "0.49",
                    ),
                  ],
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 7,
                child: CustomTabView(
                  itemCount: headerTab.length,
                  initPosition: 4,
                  tabBuilder: (BuildContext context, int index) {
                    return Tab(
                      text: headerTab[index],
                      height: 32,
                    );
                  },
                  pageBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: lstDataForFooter.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset("assets/images/${lstDataForFooter[index].icon}.svg"),
                                  const SizedBox(
                                    width: 14,
                                  ),
                                  SizedBox(
                                      width: size.width * 0.76,
                                      child: Text(
                                        lstDataForFooter[index].textDesc ?? "",
                                        maxLines: 2,
                                        style: TextStyles(context)
                                            .googleRubikFontsForSecondaryText(fontSize: 10, fontWeight: FontWeight.w400),
                                      ))
                                ],
                              ),
                            );
                          }),
                    );
                  },
                  onPositionChange: (index) {},
                  onScroll: (position) => debugPrint("On Scrolled Called>>>>${position.toString()}"),
                ),
              ),
              CommonButton(
                padding: const EdgeInsets.only(left: 0, right: 0),
                buttonText: "Next",
                backgroundColor: const Color(0xFF2CBFD3),
                radius: 30,
                height: 48,
                onTap: () {
                  // NavigationServices(context).gotoTabScreen();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "/homeScreen",
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
