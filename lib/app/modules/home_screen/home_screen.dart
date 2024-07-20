
import 'package:fitbe/app/app_utils/helper.dart';
import 'package:fitbe/app/modules/home_screen/provider/profile_provider.dart';
import 'package:fitbe/app/modules/home_screen/widget/home_screen_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../app_theme/text_styles.dart';
import '../../app_utils/shared_preferance.dart';
import '../../app_utils/utils.dart';
import '../../common_widgets/card_widget_with_per.dart';
import '../../common_widgets/goal_data_card.dart';
import '../../common_widgets/grid_view_widget.dart';

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

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return AdvancedDrawer(
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
                                    style:
                                        TextStyles(context).googleRubikFontsForHeading(fontSize: 12, fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              // const SizedBox(height: 3.0),
                              Text(
                                context.read<ProfileProvider>().userDetails?.data?.fullName ?? '',
                                style: TextStyles(context).googleRubikFontsForHeading(fontSize: 20, fontWeight: FontWeight.w500),
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
                                  image: AssetImage('assets/images/man.jpg'),
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
                          "Daily plan",
                          style: TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    SizedBox(height: 310, child: GridViewExample()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Goal Statistics",
                          style: TextStyles(context).googleRubikFontsForSecondaryText9(fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const GoalDataCard()
                  ],
                ),
              ),
            )),
          );
        },
      )),
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

  @override
  void dispose() {
    advancedDrawerController.dispose();
    super.dispose();
  }
}
