import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Widget widget;
  final String title;
  final String subTitle;
  final Icon icon;

  MenuCard({this.widget, this.title, this.subTitle, this.icon});

  @override
  Widget build(BuildContext context) {

    return Card(
        child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => widget));
                },
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: ListTile(
                  leading: this.icon,
                  title: Text(this.title),
                  subtitle: this.subTitle != null ? Text(this.subTitle) : Text(""),
                ))));
  }
}
