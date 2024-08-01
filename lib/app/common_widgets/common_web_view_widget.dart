import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
