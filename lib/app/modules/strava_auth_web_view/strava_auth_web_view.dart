import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../app_api_services/api_end_point.dart';
import '../../common_widgets/common_web_view_widget.dart';

class StravaAuthWebView extends StatefulWidget {
  final String userId;
  const StravaAuthWebView({super.key, required this.userId});

  @override
  State<StravaAuthWebView> createState() => _StravaAuthWebViewState();
}

class _StravaAuthWebViewState extends State<StravaAuthWebView> {
  late String token;
  late WebViewController controller = WebViewController();

  @override
  void initState() {
    initialiseWebViewController();
    super.initState();
  }

  initialiseWebViewController() {
    controller = controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint("Page loaded $progress%");
          },
          onPageStarted: (String url) {
            debugPrint(">>>>>>>>>>>>>>>>>>>onPageStarted$url");
          },
          onPageFinished: (String url) {
            debugPrint(">>>>>>>>>>>>>>>>>>>onPageFinished$url");
            if (url.contains('https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}?state=&code=')) {
              if (mounted) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/homeScreen",
                  (Route<dynamic> route) => false,
                );
              }
            }
            // debugPrint(url);
          },
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            debugPrint(">>>>>>>>>>>>>>>>>>>onPageFinished${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          // requestFunction();
          Uri.parse(
              "https://www.strava.com/oauth/authorize?client_id=131394&response_type=code&redirect_uri=https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}&approval_prompt=force&scope=read,activity:read"));

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CommonWebViewWidget(
        webViewUrl: ApiEndPoint.stravaAuthUrl(widget.userId,),
        webViewBackUrl: "https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}?state=&code=",
        onPageFinished: (url){
          if (url.contains('https://fitbe-dev.skill-mine.com/strava/test/code/${widget.userId}?state=&code=')) {
            if (mounted) {
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

  @override
  void dispose() {
    super.dispose();
  }
}
