import 'package:fitbe/app/app_utils/helper.dart';
import 'package:fitbe/app/modules/home_screen/provider/profile_provider.dart';
import 'package:fitbe/app/modules/home_screen/widget/home_screen_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app_theme/text_styles.dart';
import '../../app_utils/shared_preferance.dart';
import '../../app_utils/utils.dart';
import '../../common_widgets/bar_indicator.dart';
import '../../common_widgets/card_widget_with_per.dart';
import '../../common_widgets/goal_data_card.dart';
import '../../common_widgets/grid_view_widget.dart';
import '../recommendation_screen/IconValModel.dart';
import '../recommendation_screen/recommendation_container_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static Widget builder(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: const HomeScreen(),
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver, SingleTickerProviderStateMixin, Helper {
  AdvancedDrawerController advancedDrawerController = AdvancedDrawerController();
  AnimationController? animationController;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    callUserApi();
    super.initState();
  }

  callUserApi() {
    context.read<ProfileProvider>().callUserDetailsApi();
  }

  List<Color> lstColor = [
    Colors.grey,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.red,
  ];

  List<double> lstData = [10, 15, 25, 35, 13];

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
    return PopScope(
      canPop: false,
      onPopInvoked: (sta) {
        if (!sta) {
          backHomeScreen();
        }
      },
      child: AdvancedDrawer(
        backdrop: const SizedBox(
          width: double.infinity,
          height: double.infinity,
        ),
        controller: advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 150),
        animationController: animationController,
        animateChildDecoration: true,
        key: GlobalKey(),
        rtlOpening: false,
        // openScale: 1.0,
        disabledGestures: true,
        backdropColor: Colors.white,
        childDecoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Colors.red,
        ),
        drawer: SafeArea(
          child: Consumer<ProfileProvider>(
            builder: (context, provider, child) {
              return HomeScreenDrawer(
                fullName: context.read<ProfileProvider>().userDetails?.data?.fullName ?? '',
                mobileNumber: context.read<ProfileProvider>().userDetails?.data?.mobileNumber ?? '',
                emailAddress: context.read<ProfileProvider>().userDetails?.data?.emailAddress ?? '',
                logOutTap: gotoSplashScreen,
                advancedDrawerController: advancedDrawerController,
                userId: context.read<ProfileProvider>().userDetails?.data?.userID ?? "",
              );
            },
          ),
        ),
        child: Scaffold(body: Consumer<ProfileProvider>(
          builder: (context, provider, child) {
            return Skeletonizer(
              enabled: context.read<ProfileProvider>().isLoading,
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    // Icon(Icons.tag_faces, color: Colors.blue),
                                    Image.asset(
                                      "assets/images/hi.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Text(
                                      Utils.getGreeting(),
                                      style: TextStyles(context)
                                          .googleRubikFontsForHeading(fontSize: 12, fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                // const SizedBox(height: 3.0),
                                Text(
                                  context.read<ProfileProvider>().userDetails?.data?.fullName ?? '',
                                  style:
                                      TextStyles(context).googleRubikFontsForHeading(fontSize: 20, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                if (mounted) {
                                  advancedDrawerController.showDrawer();
                                }
                              },
                              child: Container(
                                width: 50.0, // Radius * 2
                                height: 50.0, // Radius * 2
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage('https://i.pngimg.me/thumb/f/720/c3f2c592f9.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const CardWidgetWithPer(),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Caloric Data",
                            style:
                                TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      SizedBox(height: 160, child: GridViewExample()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Daily Plan",
                            style:
                                TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "/dailyPlan");
                            },
                            child: Text(
                              "View All",
                              style: TextStyles(context).googleRubikFontsForText2(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                          itemCount: lstDataForFooter.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Goal Statistics",
                            style:
                                TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const GoalDataCard(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Body Composition Analysis",
                            style:
                                TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Your BMI Is ",
                            textAlign: TextAlign.center,
                            style:
                                TextStyles(context).googleRubikFontsForSecondaryText(fontSize: 14, fontWeight: FontWeight.w400),
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
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )),
            );
          },
        )),
      ),
    );
  }

  void gotoSplashScreen() async {
    bool isOk = await showCommonPopupNew(
      "Are you sure?",
      "You want to Sign Out?.",
      context,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      SharedPref sharedPref = SharedPref();
      await sharedPref.save("isLogIn", "false");
      await sharedPref.save("logInSta", "logOut");
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/signInScreen",
        (Route<dynamic> route) => false,
      );
    }
  }

  void backHomeScreen() async {
    bool isOk = await showCommonPopupNew(
      "Are you sure?",
      "You want to close the app?",
      context,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      SystemNavigator.pop();
    }
  }

  @override
  void dispose() {
    advancedDrawerController.dispose();
    super.dispose();
  }
}
