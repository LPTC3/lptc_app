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
    _tabController = TabController(vsync: this, length: 3);
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
                "https://academy.bryter.io/s/EiRs5yKLQoOKsm1CoewcMQ/covenant-to-repair"),
            title: 'Disrepair',
            subTitle:
                'Is something broken or dangerous in your accommodation?',
            icon: Icon(Icons.build, size: 32.0)),
        MenuCard(
            widget: BryterFlow("Evictions",
                "https://academy.bryter.io/s/q4biZZJqStetvhbLvDMTfQ/rentevictions"),
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
      Column(children: [
        Card(child: ListTile(title:Text("Disrepair Outputs", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),))),
        MenuCard(
            widget: WIPPage("Notice of disrepair"),
            title: 'Notice of disrepair',
            subTitle: 'This is a template for a formal notice of disrepair that you should send to your landlord. This may constitute valuable ‘proof’ that your landlord was aware of the disrepair. ',
            icon: Icon(Icons.assignment, size: 32.0)),
        MenuCard(
            widget: BryterFlow("Council Inspection Request",
                "https://academy.bryter.io/s/I5KNsaHfRAa-ewinh9gCpQ/disrepair---council-inspection"),
            title: 'Council Inspection Request',
            subTitle:
            'This is a template for a request for a health inspection under the Housing Health and Safety Rating System (HHSRH) by your local council. ',
            icon: Icon(Icons.search_off, size: 32.0)),
        MenuCard(
            widget: WIPPage("Letter of claim"),
            title: 'Letter of claim',
            subTitle: 'The Pre-Action Protocol for Housing Condition Claims requires that you send your landlord a letter of claim, which lays out the disrepair and notified the landlord about the claim. ',
            icon: Icon(Icons.email_outlined, size: 32.0)),
        Card(child: ListTile(title:Text("Eviction Outputs", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),))),
        Card(child: ListTile(title:Text("Unauthorised Access Outputs", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),))),
        Card(child: ListTile(title:Text("Deposits Outputs", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),))),
      ],),
      Forum()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("handyhousing",
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold, fontSize: 25))),
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
                icon: Icon(Icons.connect_without_contact_outlined), label: "Outputs"),
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
