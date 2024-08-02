import 'package:fitbe/app/common_widgets/pouring_hour_glass_refined.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CommonWebViewWidget extends StatefulWidget {
  final String webViewUrl;
  final String? webViewBackUrl;
  final Function(int progress)? onProgress;
  final Function(String url)? onPageStarted;
  final Function(String url)? onPageFinished;
  final Function(HttpResponseError error)? onHttpError;
  final Function(WebResourceError error)? onWebResourceError;

  const CommonWebViewWidget(
      {super.key,
      required this.webViewUrl,
      this.webViewBackUrl,
      this.onProgress,
      this.onPageStarted,
      this.onPageFinished,
      this.onHttpError,
      this.onWebResourceError});

  @override
  State<CommonWebViewWidget> createState() => _CommonWebViewWidgetState();
}

class _CommonWebViewWidgetState extends State<CommonWebViewWidget> {
  late String token;
  late WebViewController? controller;

  @override
  void initState() {
    initialiseWebViewController();
    super.initState();
  }

  bool loadSTa = true;
  initialiseWebViewController() {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: widget.onProgress ??
              (int progress) {
                debugPrint("Page loaded $progress%");
              },
          onPageStarted: widget.onPageStarted ??
              (String url) {
                debugPrint(">>>>>>>>>>>>>>>>>>>onPageStarted$url");
              },
          onPageFinished: widget.onPageFinished ??
              (String url) {
                debugPrint(">>>>>>>>>>>>>>>>>>>onPageFinished$url");
                // debugPrint(url);
              },
          onHttpError: widget.onHttpError ?? (HttpResponseError error) {},
          onWebResourceError: widget.onWebResourceError ?? (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            debugPrint(">>>>>>>>>>>>>>>>>>>onPageFinished${request.url}");
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
          // requestFunction();
          Uri.parse(widget.webViewUrl));
    Future.delayed(const Duration(seconds: 3), () {
      loadSTa = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (!loadSTa && controller != null)
            ? WebViewWidget(controller: controller!)
            : Center(
                child: SpinKitPouringHourGlassRefined(
                  color: Theme.of(context).primaryColor,size: 150,
                ),
              ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
