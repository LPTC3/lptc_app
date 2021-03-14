import 'package:flutter/material.dart';
import 'package:lptc_app/app/webviewer/WebViewerImplStub.dart'
  if(dart.library.io) 'package:lptc_app/app/webviewer/MobileWebViewer.dart'
  if(dart.library.html) 'package:lptc_app/app/webviewer/WebWebViewer.dart';

class WebViewer extends StatefulWidget {

  final String url;
  WebViewer(this.url);

  @override
  State<StatefulWidget> createState() => _WebViewerState();
  
}

class _WebViewerState extends State<WebViewer> {
  @override
  Widget build(BuildContext context) {
    return WebViewerImpl(widget.url);
  }
}

abstract class WebViewerImpl extends StatefulWidget {
  factory WebViewerImpl(String url) => getWebViewerImpl(url);
}