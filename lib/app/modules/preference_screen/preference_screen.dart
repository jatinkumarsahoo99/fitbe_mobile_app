// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:fitbe/app/common_widgets/show_snack_bar.dart';
import 'package:fitbe/app/modules/preference_screen/provider/gender_provider.dart';
import 'package:fitbe/app/modules/preference_screen/provider/dob_provider.dart';
import 'package:fitbe/app/modules/preference_screen/provider/page_progress_provider.dart';
import 'package:fitbe/app/modules/preference_screen/provider/preference_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../app_api_services/api_end_point.dart';
import '../../app_api_services/http_methods.dart';
import '../../app_theme/colors.dart';
import '../../app_theme/text_styles.dart';

// import '../../common_widgets/circular_scroll_physics/cicular_scroll_physics.dart';
import '../../app_utils/shared_preferance.dart';
import '../../app_utils/utils.dart';
import '../../common_widgets/age_show_widget.dart';
import '../../common_widgets/animated_number_picker.dart';
import '../../common_widgets/common_button.dart';
import '../../common_widgets/common_text_field_view.dart';
import '../../common_widgets/header_text_widget.dart';
import '../../common_widgets/weight_picker/animated_weight_picker.dart';
import 'gender_screen.dart';
// import 'package:numberpicker/numberpicker.dart';

class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GenderProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DobProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PreferenceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PageProgressProvider(),
        ),
      ],
      child: const PreferenceScreen(),
    );
  }

  @override
  State<PreferenceScreen> createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  var pageController = PageController(initialPage: 0);
  String selectWeight = "";
  int selectHeight = 10;
  int selectHipSize = 10;
  int selectWaistSize = 10;
  bool selectHipSizeTap = false;
  bool selectWaistSizeTap = false;
  bool selectAgeTap = false;
  bool selectWeightTap = false;
  bool selectHeightTap = false;

  @override
  void initState() {
    super.initState();
  }

  getHeaderWidget({required int index}) {
    Map<int, dynamic> dataMap = {
      1: ["Tell Us About Yourself!", "For a Tailored Experience, Please Share Your Gender."],
      2: ["How Old Are You?", "Enhance Your Experience by Sharing Your Age."],
      3: ["What’s Your Height?", "Personalize Your Plan by Sharing Your Height."],
      4: ["What’s Your Weight?", "To Customize Your Journey, Let Us Know Your Weight."],
      5: ["What’s Your Hip Size?", "Maximize Your Results: Tell Us Your Hip Measurement."],
      6: ["What’s Your Waist Size?", "Tell Us Your Waist Measurement."],
    };
    return HeaderTextWidget(
      headerText: dataMap[index][0],
      headDesc: dataMap[index][1],
      key: UniqueKey(),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.day,
        firstDate: DateTime(2015),
        lastDate: DateTime(2101));
    if (picked != null) {}
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
              Consumer<PageProgressProvider>(
                builder: (context, provider, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
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
                          percent: ((context.read<PageProgressProvider>().currentShowIndex + 1) / 6),
                          animation: true,
                          lineHeight: 10,
                          linearStrokeCap: LinearStrokeCap.roundAll,
                          barRadius: const Radius.circular(5),
                        ),
                      ),
                      Text(
                        "${(context.read<PageProgressProvider>().currentShowIndex + 1)}/6",
                        style: TextStyles(context).googleRubikFontsForText3(fontSize: 12, fontWeight: FontWeight.w500),
                      )
                    ],
                  );
                },
              ),
              getHeaderWidget(index: (context.read<PageProgressProvider>().currentShowIndex + 1)),
              Expanded(
                  flex: 9,
                  child: PageView(
                    controller: pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (i) {
                      context.read<PageProgressProvider>().setPageProgress(i);
                      /* currentShowIndex = i;
                      setState(() {});*/
                    },
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GenderScreen(
                        onTap: (index) {
                          debugPrint(">>>>>>>>>>>>>Index$index");
                          // selectGender = (index == 1) ? "Male" : "Female";
                        },
                      ),
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(16)),
                              border: Border.all(color: ColorsGroup.primaryColor, width: 1),
                              color: ColorsGroup.primaryColor,
                            ),
                            child: Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(
                                  primary: Colors.white, // Header background color
                                  onPrimary: Colors.black, // Header text color
                                  onSurface: Colors.white,

                                  // Body text color
                                ),
                                textButtonTheme: TextButtonThemeData(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.teal, // Button text color
                                  ),
                                ),
                              ),
                              child: CalendarDatePicker(
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now().subtract(const Duration(days: 38000)),
                                lastDate: DateTime.now(),
                                onDateChanged: (DateTime value) {
                                  var (yearData, monthData, daysData) = Utils.calculateAgeWithYearMonthAndDay(value);
                                  context
                                      .read<DobProvider>()
                                      .setDOBData(yearData, monthData, daysData, DateFormat("dd-MM-yyyy").format(value));
                                  // debugPrint(">>>>>>>>>>>>${DateFormat("yyyy-MM-dd").format(value)}");
                                },
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Consumer<DobProvider>(
                            builder: (context, provider, child) {
                              return AgeShowWidget(
                                  year: context.read<DobProvider>().year,
                                  month: context.read<DobProvider>().month,
                                  days: context.read<DobProvider>().days);
                            },
                          ),
                          CommonTextFieldView(
                            controller: context.read<DobProvider>().dateOfBirth,
                            // errorText: _errorFName,
                            padding: const EdgeInsets.only(left: 0, right: 0),
                            titleText: "Your DOB",
                            hintText: "Your DOB",
                            keyboardType: TextInputType.text,
                            readOnly: true,
                            onChanged: (String txt) {},
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Expanded(
                            child: AnimatedNumberPicker(
                              onChange: (int selectedItem) {
                                debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                                selectHeight = selectedItem;
                                selectHeightTap = true;
                              },
                              key: UniqueKey(),
                              maxNum: 200,
                              minNum: 0,
                              suffix: " cm",
                              selectedItemScrollPosition: selectHeight,
                            ),
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
                                selectWeight = newValue;
                                selectWeightTap = true;
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
                                Expanded(child: Consumer<GenderProvider>(
                                  builder: (context, provider, child) {
                                    return Image.asset(
                                      "assets/images/${(context.read<GenderProvider>().selectedGender == "Female") ? "female_hip" : "man_hip"}.png",
                                      height: 300,
                                    );
                                  },
                                )),
                                Expanded(
                                  child: AnimatedNumberPicker(
                                    onChange: (int selectedItem) {
                                      debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                                      selectHipSize = selectedItem;
                                      selectHipSizeTap = true;
                                    },
                                    key: UniqueKey(),
                                    maxNum: 200,
                                    minNum: 0,
                                    suffix: " cm",
                                    selectedItemScrollPosition: selectHipSize,
                                  ),
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
                                Expanded(child: Consumer<GenderProvider>(
                                  builder: (context, provider, child) {
                                    return Image.asset(
                                      "assets/images/${(context.read<GenderProvider>().selectedGender == "Female") ? "female_waist" : "man_waist"}.png",
                                      height: 300,
                                    );
                                  },
                                )),
                                Expanded(
                                  child: AnimatedNumberPicker(
                                    onChange: (int selectedItem) {
                                      debugPrint(">>>>>>>>>>>>>onChangeData$selectedItem");
                                      selectWaistSize = selectedItem;
                                      selectWaistSizeTap = true;
                                    },
                                    key: UniqueKey(),
                                    maxNum: 200,
                                    minNum: 0,
                                    suffix: " cm",
                                    selectedItemScrollPosition: selectWaistSize,
                                  ),
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
                onTap: () async {
                  if (context.read<GenderProvider>().selectedGender == "" &&
                      context.read<PageProgressProvider>().currentShowIndex == 0) {
                    ShowSnackBar.showError(context, "Please select your gender");
                  } else if (context.read<DobProvider>().dateOfBirth.text == "" &&
                      context.read<PageProgressProvider>().currentShowIndex == 1) {
                    ShowSnackBar.showError(context, "Please select your age");
                  } else if (!selectHeightTap && context.read<PageProgressProvider>().currentShowIndex == 2) {
                    ShowSnackBar.showError(context, "Please select your height");
                  } else if (!selectWeightTap && context.read<PageProgressProvider>().currentShowIndex == 3) {
                    ShowSnackBar.showError(context, "Please select your weight");
                  } else if (!selectHipSizeTap && context.read<PageProgressProvider>().currentShowIndex == 4) {
                    ShowSnackBar.showError(context, "Please select your hip");
                  } else if (!selectWaistSizeTap && context.read<PageProgressProvider>().currentShowIndex == 5) {
                    ShowSnackBar.showError(context, "Please select your waist");
                  } else {
                    if ((context.read<PageProgressProvider>().currentShowIndex + 1) < 6) {
                      pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
                    } else {
                      SharedPref sharedPref = SharedPref();
                      Map<String, dynamic> userDetails = {
                        "Gender": context.read<GenderProvider>().selectedGender,
                        "Height": selectHeight.toString(),
                        "Weight": selectWeight.toString(),
                        "HipSize": selectHipSize.toString(),
                        "Waist": selectWaistSize.toString(),
                        "DateOfBirth": context.read<DobProvider>().dateOfBirth.text,
                      };
                      var userId = await sharedPref.getKey("userID");
                      userDetails['UserID'] = json.decode(userId);
                      debugPrint(">>>>>>>>>>>userDetails$userDetails");

                      await sharedPref.save("userData", json.encode(userDetails));
                      callPreferenceApi(userDetails);

                      /*Navigator.pushNamedAndRemoveUntil(
                        context,
                        "/recommendationScreen",
                        (Route<dynamic> route) => false,
                      );*/
                    }
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

  callPreferenceApi(Map<String, dynamic>? postData) {
    Utils.showProgressIndicator();
    debugPrint(">>>>>>>postData$postData");
    HttpMethodsDio().postMethod(
        api: ApiEndPoint.preferences,
        fun: (map, code) async {
          Utils.disMissProgressIndicator();
          if (code == 200) {
            SharedPref sharedPref = SharedPref();
            await sharedPref.save("logInSta", "COMPLETED");
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/recommendationScreen",
              (Route<dynamic> route) => false,
            );
          } else if (map is Map && map.containsKey("message")) {
            ShowSnackBar.showError(context, map["message"] ?? "Something went wrong");
          } else {
            ShowSnackBar.showError(context, "$map");
            /*Navigator.pushNamedAndRemoveUntil(
              context,
              "/recommendationScreen",
              (Route<dynamic> route) => false,
            );*/
          }
        },
        json: postData);
  }
}
