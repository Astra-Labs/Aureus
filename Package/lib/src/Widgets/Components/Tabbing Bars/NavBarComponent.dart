import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- NAV BAR COMPONENT ----------*/
/// A horizontal, icon only, navigation bar.

class NavBarComponent extends StatefulWidget {
  /// A list of controller tab objects that make up the NavBarComponent
  final List<ControllerTabObject> tabItems;

  const NavBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

  @override
  _NavBarComponentState createState() => _NavBarComponentState();
}

class _NavBarComponentState extends State<NavBarComponent> {
  Widget tabChild = Container(color: Colors.white);

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> tabbingArray = [];
    var screenSize = size.logicalScreenSize();

    for (var element in widget.tabItems) {
      //checks to see if current index matches index of tab item. if yes, it's enabled.

      var tabItem = BottomNavigationBarItem(
        icon: Icon(element.tabIcon, size: size.responsiveSize(38.0)),
        label: element.accessibilityHint,
        tooltip: element.accessibilityHint,
        backgroundColor: Colors.transparent,
      );

      tabbingArray.add(tabItem);
      _pages.add(element.tabController);
    }

    var navigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: coloration.contrastColor(),
      unselectedItemColor: coloration.inactiveColor(),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      items: tabbingArray,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );

    var navBarComponent = Positioned(
      bottom: 25,
      child: ClipRRect(
        child: FloatingContainerElement(
            child: Container(
                constraints: BoxConstraints(
                    maxWidth: size.layoutItemWidth(1, screenSize)),
                decoration: CardBackingDecoration(
                        decorationVariant: decorationPriority.inactive)
                    .buildBacking()
                    .copyWith(borderRadius: BorderRadius.circular(60)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 5),
                    navigationBar,
                  ],
                ))),
      ),
    );

    var navBarContainer = Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: coloration.primaryImage().image,
            fit: BoxFit.cover,
          ),
        ));

    var navBarScaffold = Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            navBarContainer,
            Center(
              child: _pages.elementAt(_selectedIndex),
            ),
            navBarComponent,
          ],
        ),
      ),
    );

    return navBarScaffold;
  }
}
