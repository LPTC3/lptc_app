import 'package:flutter/material.dart';
import 'package:lptc_app/app/webviewer/WebViewer.dart';

class BryterFlow extends StatelessWidget {

  final String name;
  final String bryterUrl;

  BryterFlow(this.name, this.bryterUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(name)),
        body: WebViewer(bryterUrl));
  }

}