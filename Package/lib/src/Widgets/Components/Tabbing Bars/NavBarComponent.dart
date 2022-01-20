import 'dart:html';

import 'package:aureus/aureus.dart';
import 'package:flutter/rendering.dart';

//A scaffold that acts as a standardized tab bar
//Doc Link:

class NavBarComponent extends StatefulWidget {
  //tab items input will be checked to be icon only
  final List<TabObject> tabItems;

  const NavBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

  @override
  _NavBarComponentState createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  Widget tabChild = Container(color: Colors.white);

  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> tabbingArray = [];

    widget.tabItems.forEach((element) {
      //checks to see if current index matches index of tab item. if yes, it's enabled.
      decorationPriority tabPriority = coloration.itemPriority(
          _selectedIndex == widget.tabItems.indexOf(element) ? true : false);

      var tabItem = BottomNavigationBarItem(
        icon: Icon(element.tabIcon,
            color: coloration.decorationColor(decorationVariant: tabPriority)),
        tooltip: element.accessibilityHint,
      );

      tabbingArray.add(tabItem);
    });

    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: carbon(),
        items: tabbingArray,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
