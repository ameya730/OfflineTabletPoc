import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InAppWebViewPage extends StatefulWidget {
  const InAppWebViewPage({Key? key}) : super(key: key);

  @override
  State<InAppWebViewPage> createState() => _InAppWebViewPageState();
}

class _InAppWebViewPageState extends State<InAppWebViewPage> {
  final options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      mediaPlaybackRequiresUserGesture: false,
      javaScriptEnabled: true,
      allowFileAccessFromFileURLs: true,
      javaScriptCanOpenWindowsAutomatically: true,
      preferredContentMode: UserPreferredContentMode.MOBILE,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InAppWebView(
          initialOptions: options,
          initialUrlRequest: URLRequest(
              url: Uri.parse(
                  "https://lms.schoolnetindia.com/Login/MainLoginSL?uname=U2FsdGVkX1/e2bPFHAFHmGmn7xieu5sO6zUYpi3Sc9A=&utype=student&mob=1234567891")),
        ),
      ),
    );
  }
}
