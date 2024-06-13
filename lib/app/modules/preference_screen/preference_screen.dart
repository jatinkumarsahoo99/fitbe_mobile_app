// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../app_theme/colors.dart';
import '../../app_theme/text_styles.dart';
// import '../../common_widgets/circular_scroll_physics/cicular_scroll_physics.dart';
import '../../common_widgets/animated_number_picker.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/header_text_widget.dart';
import '../../common_widgets/weight_picker/animated_weight_picker.dart';
import 'gender_screen.dart';
// import 'package:numberpicker/numberpicker.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  var pageController = PageController(initialPage: 0);
  int currentShowIndex = 0;
  int selectAge = 10;
  int selectWeight = 10;
  int selectHeight = 10;

  @override
  void initState() {
    super.initState();
  }

  getHeaderWidget({required int index}){
    Map<int,dynamic> dataMap = {
      1:["Tell Us About Yourself!","For a Tailored Experience, Please Share Your Gender."],
      2:["How Old Are You?","Enhance Your Experience by Sharing Your Age."],
      3:["What’s Your Height?","Personalize Your Plan by Sharing Your Height."],
      4:["What’s Your Weight?","To Customize Your Journey, Let Us Know Your Weight."],
      5:["What’s Your Hip Size?","Maximize Your Results: Tell Us Your Hip Measurement."],
      6:["What’s Your Waist Size?","Tell Us Your Waist Measurement."],
    };
    return  HeaderTextWidget(
      headerText:dataMap[index][0],
      headDesc:dataMap[index][1],
      key: UniqueKey(),
    );

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 23,
              ),
              /* LinearProgressIndicator(
                value:double.parse(currentShowIndex.toString()),
              ),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut);
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
                  SizedBox(
                    width: size.width * 0.7,
                    child: LinearPercentIndicator(
                      progressColor: ColorsGroup.primaryColor,
                      backgroundColor: Colors.grey,
                      percent: ((currentShowIndex + 1) / 6),
                      animation: true,
                      lineHeight: 10,
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      barRadius: const Radius.circular(5),
                    ),
                  ),
                  Text(
                    "${(currentShowIndex + 1)}/6",
                    style: TextStyles(context).googleRubikFontsForText3(
                        fontSize: 12, fontWeight: FontWeight.w500),
                  )
                ],
              ),
              getHeaderWidget(index:(currentShowIndex +1 ) ),
              Expanded(
                  flex: 9,
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) {
                      currentShowIndex = i;
                      setState(() {});
                    },
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GenderScreen(
                        onTap: (index) {
                          debugPrint(">>>>>>>>>>>>>Index$index");
                        },
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: AnimatedNumberPicker(onChange: (int selectedItem) {
                              debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                              selectAge = selectedItem;
                            },key: UniqueKey(),maxNum: 200,minNum: 0,suffix: "",selectedItemScrollPosition:selectAge ,),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: AnimatedNumberPicker(onChange: (int selectedItem) {
                              debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                              selectHeight = selectedItem;
                            },key: UniqueKey(),maxNum: 200,minNum: 0,suffix: " cm",selectedItemScrollPosition:selectHeight ,),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: AnimatedWeightPicker(
                              min: 0,
                              max: 200,
                              majorIntervalAt: 5,
                              subIntervalAt: 3,
                              showSelectedValue: true,
                              onChange: (newValue) {
                                setState(() {});
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Image.asset(
                                  "assets/images/female_hip.png",
                                  height: 300,
                                )),
                                Expanded(
                                  child: AnimatedNumberPicker(onChange: (int selectedItem) {
                                    debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                                    selectHeight = selectedItem;
                                  },key: UniqueKey(),maxNum: 200,minNum: 0,suffix: " cm",selectedItemScrollPosition:selectHeight ,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Image.asset(
                                      "assets/images/female_waist.png",
                                      height: 300,
                                    )),
                                Expanded(
                                  child: AnimatedNumberPicker(onChange: (int selectedItem) {
                                    debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                                    selectHeight = selectedItem;
                                  },key: UniqueKey(),maxNum: 200,minNum: 0,suffix: " cm",selectedItemScrollPosition:selectHeight ,),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              CommonButton(
                padding: const EdgeInsets.only(left: 0, right: 0),
                buttonText: "Next",
                backgroundColor: const Color(0xFF2CBFD3),
                radius: 30,
                height: 48,
                onTap: () {
                  if((currentShowIndex + 1) < 6) {
                    pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut);
                  }else{
                    Navigator.pushNamed(context, "/recommendationScreen");
                  }
                  // NavigationServices(context).gotoTabScreen();
                  // Navigator.pushNamed(context, "/preferenceScreen");
                },
              ),
              Expanded(flex: 1, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
