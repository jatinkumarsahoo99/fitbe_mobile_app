import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

import '../../../app_theme/text_styles.dart';
import '../../strava_auth_web_view/strava_auth_web_view.dart';

class HomeScreenDrawer extends StatelessWidget {
  final String fullName;
  final String mobileNumber;
  final String emailAddress;
  final String userId;
  final VoidCallback logOutTap;
  final AdvancedDrawerController? advancedDrawerController;
  const HomeScreenDrawer(
      {super.key,
      required this.fullName,
      required this.mobileNumber,
      required this.emailAddress,
      required this.logOutTap,
      required this.advancedDrawerController, required this.userId});

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                            size: const Size.fromRadius(40), // Image radius
                            child: Image.asset(
                              'assets/images/man.jpg',
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName,
                        style: TextStyles(context).getBoldStyle().copyWith(fontSize: 18),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Text(
                        mobileNumber,
                        style: TextStyles(context).getBoldStyle().copyWith(fontSize: 12),
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 05,
                      ),
                      Text(
                        emailAddress,
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
              advancedDrawerController?.hideDrawer();
            },
            leading: Icon(Icons.home, color: Theme.of(context).primaryColor),
            title: Text(
              'Home',
              style: TextStyles(context).getRegularStyle().copyWith(fontSize: 15),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  StravaAuthWebView(userId:userId,)),
              );
            },
            leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
            title: Text(
              'Setting',
              style: TextStyles(context).getRegularStyle().copyWith(fontSize: 15),
            ),
          ),
          ListTile(
            onTap: logOutTap,
            leading: Icon(Icons.logout, color: Theme.of(context).primaryColor),
            title: Text(
              'Logout',
              style: TextStyles(context).getRegularStyle().copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
