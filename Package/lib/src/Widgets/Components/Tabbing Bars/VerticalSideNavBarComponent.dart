import 'package:aureus/aureus.dart';

class VerticalSideNavBarComponent extends StatefulWidget {
  //tab items input will be checked to be icon only
  final List<ControllerTabObject> tabItems;

  const VerticalSideNavBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

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
        label: BodyOneText(currentTab.tabTitle, decorationPriority.standard),
      ));
    }

    return Scaffold(
      body: Row(
        children: <Widget>[
          FloatingContainerElement(
            child: NavigationRail(
              backgroundColor: coloration.contrastColor().withOpacity(0.10),
              selectedIndex: _selectedIndex,
              groupAlignment: 0.0,
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: coloration.resourceLogo(),
                ),
              ),
              labelType: NavigationRailLabelType.none,
              destinations: railItems,
            ),
          ),
          // This is the main content.
          Expanded(
            child: widgetItems[_selectedIndex],
          )
        ],
      ),
    );
  }
}
