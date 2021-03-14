import 'package:flutter/material.dart';
import 'package:lptc_app/app/webviewer/WebViewer.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileWebViewer extends StatefulWidget implements WebViewerImpl {
  final String url;
  MobileWebViewer(this.url);

  @override
  State<StatefulWidget> createState() => _MobileWebViewerState();

}

class _MobileWebViewerState extends State<MobileWebViewer> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
      WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (finish) {
        setState(() {
          isLoading = false;
        });
      },
    ),
    isLoading ? Center( child: CircularProgressIndicator(),)
    : Stack(),]);
  }

}

WebViewerImpl getWebViewerImpl(String url) => new MobileWebViewer(url);