import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lptc_app/views/BryterFlow.dart';
import 'package:lptc_app/views/Forum.dart';
import 'package:lptc_app/views/MenuCard.dart';
import 'package:lptc_app/views/WIPPage.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      setState(() {
        _currentIndex = _tabController.index;
      });
    });
  }

  void changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
    _tabController.animateTo(_currentIndex);
  }

  List<Widget> getTabs(BuildContext context) {
    return [
      Column(children: [
        MenuCard(
            widget: BryterFlow("Disrepair",
                "https://academy.bryter.io/s/1OyfLnK5Qym6pfs5h1kcGA/covenant-to-repair"),
            title: 'Disrepair',
            subTitle:
                'Is something broken or dangerous in your accommodation?',
            icon: Icon(Icons.build, size: 32.0)),
        MenuCard(
            widget: BryterFlow("Evictions",
                "https://academy.bryter.io/s/XqgcJ9GmTE2j6aksee-d4g/rentevictions"),
            title: 'Evictions',
            subTitle:
                'Are you worried about or have been threatened with eviction?',
            icon: Icon(Icons.exit_to_app, size: 32.0)),
        MenuCard(
            widget: WIPPage("Unauthorised access"),
            title: 'Unauthorised access',
            subTitle: 'Is your landlord entering the property without notice?',
            icon: Icon(Icons.pan_tool_outlined, size: 32.0)),
        MenuCard(
            widget: WIPPage("Deposits"),
            title: 'Deposits',
            subTitle: 'Is your deposit being withheld by your landlord?',
            icon: Icon(Icons.monetization_on_outlined, size: 32.0))
      ]),
      Forum()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("handyhousing",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold))),
        body: kIsWeb
            ? IndexedStack(
                index: _currentIndex,
                children: getTabs(context),
              )
            : TabBarView(
                controller: _tabController, children: getTabs(context)),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: changeTab,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.alt_route_rounded), label: "Workflows"),
            BottomNavigationBarItem(
                icon: Icon(Icons.question_answer), label: "Forum"),
          ],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
