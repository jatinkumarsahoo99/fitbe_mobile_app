import 'package:flutter/material.dart';

import '../../app_api_services/api_end_point.dart';
import '../../common_widgets/common_web_view_widget.dart';

class StravaAuthWebView extends StatefulWidget {
  final String userId;
  const StravaAuthWebView({super.key, required this.userId});

  @override
  State<StravaAuthWebView> createState() => _StravaAuthWebViewState();
}

class _StravaAuthWebViewState extends State<StravaAuthWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonWebViewWidget(
        webViewUrl: ApiEndPoint.stravaAuthUrl(
          widget.userId,
        ),
        webViewBackUrl: "https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}?state=&code=",
        onPageFinished: (url) {
          if (url.contains('https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}?state=&code=')) {
            if(mounted) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                "/homeScreen",
                    (Route<dynamic> route) => false,
              );
            }
          }
        },
      ),
    );
  }
}
