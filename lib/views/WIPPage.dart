import 'package:flutter/material.dart';

class WIPPage extends StatelessWidget {
  final String wipSection;

  WIPPage([this.wipSection = ""]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("WIP")),
        body: Center(
            child:
              Text(wipSection != ""
                  ? "$wipSection is coming soon..."
                  : "Coming Soon...")
            ));
  }
}
