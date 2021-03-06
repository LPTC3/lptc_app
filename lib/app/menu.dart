import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lptc_app/views/BryterFlow.dart';

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
      Column( children :[
      ListTile(
        title: Text("Disrepair"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BryterFlow("Disrepair",
                      "https://academy.bryter.io/s/1OyfLnK5Qym6pfs5h1kcGA/covenant-to-repair")));
        },
      ),
      ListTile(
        title: Text("Evictions"),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BryterFlow("Evictions",
                      "https://academy.bryter.io/s/XqgcJ9GmTE2j6aksee-d4g/rentevictions")));
        },
      )
    ]), Container()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Student Workflows")),
        body: kIsWeb ?
        IndexedStack(
                index: _currentIndex,
                children: getTabs(context),
              ) :
        TabBarView(
            controller: _tabController,
            children: getTabs(context)
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey.shade600,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: changeTab,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.alt_route_rounded), label: "Workflows"),
            BottomNavigationBarItem(icon: Icon(Icons.question_answer), label: "Forum"),
          ],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
