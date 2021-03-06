import 'package:flutter/material.dart';
import 'package:lptc_app/app/webviewer/WebViewerImplStub.dart'
  if(dart.library.io) 'package:lptc_app/app/webviewer/MobileWebViewer.dart'
  if(dart.library.html) 'package:lptc_app/app/webviewer/WebWebViewer.dart';

class WebViewer extends StatelessWidget {

  final String url;
  WebViewer(this.url);

  @override
  Widget build(BuildContext context) {
    return WebViewerImpl(url);
  }
  
}

abstract class WebViewerImpl extends StatelessWidget {
  factory WebViewerImpl(String url) => getWebViewerImpl(url);
}