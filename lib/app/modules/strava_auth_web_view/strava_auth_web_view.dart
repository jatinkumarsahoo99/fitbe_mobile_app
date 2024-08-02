import 'package:flutter/material.dart';

import '../../app_api_services/api_end_point.dart';
import '../../common_widgets/common_web_view_widget.dart';

class StravaAuthWebView extends StatelessWidget {
  final String userId;
  const StravaAuthWebView({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonWebViewWidget(
        webViewUrl: ApiEndPoint.stravaAuthUrl(
          userId,
        ),
        webViewBackUrl: "https://fitbe-dev.skill-mine.com/strava/test/code/$userId?state=&code=",
        onPageFinished: (url) {
          if (url.contains('https://fitbe-dev.skill-mine.com/strava/test/code/$userId?state=&code=')) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              "/homeScreen",
              (Route<dynamic> route) => false,
            );
          }
        },
      ),
    );
  }
}
