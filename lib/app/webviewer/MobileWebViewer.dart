import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lptc_app/app/webviewer/WebViewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileWebViewer extends StatelessWidget implements WebViewerImpl {

  final String url;
  MobileWebViewer(this.url);

  void initState() {
    // Enable hybrid composition.

  }

  @override
  Widget build(BuildContext context) {
    print("hello");
    //if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    return WebView(initialUrl: url, javascriptMode: JavascriptMode.unrestricted);
  }

}

WebViewerImpl getWebViewerImpl(String url) => new MobileWebViewer(url);