import 'dart:html';
import 'package:lptc_app/app/webviewer/WebViewer.dart';
import 'package:lptc_app/app/webviewer/dart_ui/dart_ui.dart' as ui;

import 'package:flutter/material.dart';

class WebWebViewer extends StatelessWidget implements WebViewerImpl {

  final String url;
  WebWebViewer(this.url);

  @override
  Widget build(BuildContext context) {
    ui.platformViewRegistry.registerViewFactory(
        'hello-world-html',
            (int viewId) => IFrameElement()
          ..width = '640'
          ..height = '360'
          ..src = this.url
          ..style.border = 'none');
    return HtmlElementView(viewType: 'hello-world-html');
  }

}
WebViewerImpl getWebViewerImpl(String url) => new WebWebViewer(url);