import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitbe/app/app_utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../app_theme/text_styles.dart';
import '../../app_utils/shared_preferance.dart';
import '../../common_widgets/CustomeTittleText.dart';
import '../../common_widgets/card_widget_with_per.dart';
import '../../common_widgets/goal_data_card.dart';
import '../../common_widgets/grid_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver, SingleTickerProviderStateMixin, Helper {
  late AdvancedDrawerController advancedDrawerController;
  AnimationController? animationController;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    advancedDrawerController = AdvancedDrawerController();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.27,
                child: DrawerHeader(
                  // decoration: const BoxDecoration(color: Colors.),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                                size: const Size.fromRadius(40), // Image radius
                                child: Image.asset(
                                  'assets/images/man.jpg',
                                  fit: BoxFit.cover,
                                )),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // driverINfoWidget("assets/icon/time.png", "10.2", "Hours online"),
                              driverINfoWidget("assets/icon/meter.png", "100", "Total Distance"),
                              const SizedBox(
                                width: 10,
                              ),
                              driverINfoWidget("assets/icon/jobs.png", "50", "Total Jobs"),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jatin Kumar Sahoo",
                            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 18),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 05,
                          ),
                          Text(
                            "9178109440",
                            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 12),
                            maxLines: 2,
                          ),
                          const SizedBox(
                            height: 05,
                          ),
                          Text(
                            "jatinkumarsahoo99@gmail.com",
                            style: TextStyles(context).getBoldStyle().copyWith(fontSize: 12),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  advancedDrawerController.hideDrawer();
                },
                leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
                title: Text(
                  'Home',
                  style: TextStyles(context).getRegularStyle().copyWith(fontSize: 15),
                ),
              ),
              ListTile(
                onTap: () {
                  gotoSplashScreen();
                },
                leading: Icon(Icons.logout, color: Theme.of(context).primaryColor),
                title: Text(
                  'Logout',
                  style: TextStyles(context).getRegularStyle().copyWith(fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
      child: Scaffold(
          body: SafeArea(
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
                              'Good Morning!',
                              style: TextStyles(context).googleRubikFontsForHeading(fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 3.0),
                        Text(
                          'Monty Bradshaw',
                          style: TextStyles(context).googleRubikFontsForHeading(fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        advancedDrawerController.showDrawer();
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
              SizedBox(height: 340, child: GridViewExample()),
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
      ))),
    );
  }

  Widget driverINfoWidget(String img, String tittle, String subTittle) {
    return Column(
      children: [
        Image.asset(
          img,
          height: 30,
          width: 30,
          // color: Color(0xFF4FBE9F),
          color: Theme.of(context).primaryColor,
          // color: Colors.blue,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomeTittleText(
          text: tittle,
          textsize: 10,
          color: Colors.black,
        ),
        const SizedBox(
          height: 5,
        ),
        CustomeSubTittleText(
          text: subTittle,
          textsize: 10,
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ],
    );
  }

  void gotoSplashScreen() async {
    bool isOk = await showCommonPopupNew(
      "Are you sure?",
      "You want to Sign Out.",
      context,
      barrierDismissible: true,
      isYesOrNoPopup: true,
    );
    if (isOk) {
      SharedPref sharedPref = SharedPref();
      await sharedPref.save("isLogIn", "false");
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/signInScreen",
        (Route<dynamic> route) => false,
      );
    }
  }
}
