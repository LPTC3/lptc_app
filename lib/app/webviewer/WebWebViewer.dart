import 'dart:html';
import 'package:lptc_app/app/webviewer/WebViewer.dart';
import 'package:lptc_app/app/webviewer/dart_ui/dart_ui.dart' as ui;

import 'package:flutter/material.dart';

class WebWebViewer extends StatefulWidget implements WebViewerImpl {

  final String url;
  WebWebViewer(this.url);

  @override
  State<StatefulWidget> createState() => _WebWebViewerState();
}

class _WebWebViewerState extends State<WebWebViewer> {

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory('hello-world-html',
            (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = widget.url
          ..style.border = 'none'
              //..onLoad.listen((event) => setState(() {
              //  isLoading = false;
              //}))
    );
    return HtmlElementView(viewType: 'hello-world-html');
    return Stack(
        children: <Widget>[HtmlElementView(viewType: 'hello-world-html'),
    isLoading ? Center( child: CircularProgressIndicator(),)
    : Stack(),]);
  }

}
WebViewerImpl getWebViewerImpl(String url) => new WebWebViewer(url);