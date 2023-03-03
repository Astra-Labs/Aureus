import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- VERTICAL SIDE NAV BAR ----------*/
/// A vertical navigation bar, meant to be used on tablet / web displays.
/// If you use this, and have a [ContainerView] as a subchild, make sure to set
/// [ContainerView.managesNotifications] as false.

class VerticalSideNavBarComponent extends StatefulWidget {
  /// A list of controller tab objects that make up the NavBarComponent
  final List<ControllerTabObject> tabItems;

  /// Whether this NavBar should be responsible for displaying notifications.
  /// Unless you have a greater parent widget, this should be YES.
  final bool shouldManageNotifications;

  /// An alternate color to set as the background
  final Color? altColor;

  const VerticalSideNavBarComponent({
    required this.tabItems,
    this.shouldManageNotifications = true,
    this.altColor,
  }) : assert(tabItems.length >= 2);

  @override
  _VerticalSideNavBarComponentState createState() =>
      _VerticalSideNavBarComponentState();
}

class _VerticalSideNavBarComponentState
    extends State<VerticalSideNavBarComponent> {
  int _selectedIndex = 0;

  List<Widget> widgetItems = [];

  @override
  void initState() {
    for (var element in widget.tabItems) {
      widgetItems.add(element.tabController);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NavigationRailDestination> railItems = [];

    for (var element in widgetItems) {
      var currentIndex = widgetItems.indexOf(element);
      var currentTab = widget.tabItems[currentIndex];

      railItems.add(NavigationRailDestination(
        icon: Icon(currentTab.tabIcon, color: coloration.inactiveColor()),
        selectedIcon: Icon(currentTab.tabIcon, color: coloration.accentColor()),
        label: TagOneText(currentTab.tabTitle, decorationPriority.standard),
      ));
    }

    var navigationRail = NavigationRail(
      backgroundColor:
          widget.altColor ?? coloration.contrastColor().withOpacity(0.15),
      selectedIndex: _selectedIndex,
      groupAlignment: 0.0,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          width: 65,
          height: 65,
          child: coloration.resourceLogo(),
        ),
      ),
      labelType: NavigationRailLabelType.all,
      destinations: railItems,
    );

    var navigationRailScaffold = Scaffold(
      body: Row(
        children: <Widget>[
          navigationRail,
          // This is the main content.
          Expanded(
            child: widgetItems[_selectedIndex],
          )
        ],
      ),
    );

    return widget.shouldManageNotifications == true
        ? NotificationOverlayView(child: navigationRailScaffold)
        : navigationRailScaffold;
  }
}
