import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- ICON TABBING BAR COMPONENT ----------*/
/// A group of icon buttons on a card that acts as a tabbing bar to change data

class IconTabbingBarComponent extends StatefulWidget {
  /// A list of controller tab objects that make up the tabbing bar
  final List<TabObject> tabItems;

  const IconTabbingBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

  @override
  _IconTabbingBarComponentState createState() =>
      _IconTabbingBarComponentState();
}

class _IconTabbingBarComponentState extends State<IconTabbingBarComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //keeps track of every active / inactive item

    List<Widget> tabItems = [];

    for (var element in widget.tabItems) {
      var currentIndex = widget.tabItems.indexOf(element);

      var tabItem = Padding(
        padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
        child: IconButtonElement(
          buttonAction: () =>
              {element.onTabSelection(), _onItemTapped(currentIndex)},
          decorationVariant: currentIndex == _selectedIndex
              ? decorationPriority.important
              : decorationPriority.standard,
          buttonHint: element.accessibilityHint,
          buttonIcon: element.tabIcon,
          buttonPriority: buttonSize.secondary,
        ),
      );

      tabItems.add(tabItem);
    }

    var screenSize = size.logicalScreenSize();

    var iconTabbingBarContent = SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: tabItems));

    var iconTabbingBarContainer = FloatingContainerElement(
        child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(6, screenSize),
            child: Container(
                padding: const EdgeInsets.all(8),
                decoration: LayerBackingDecoration(
                        decorationVariant: decorationPriority.inactive)
                    .buildBacking(),
                child: iconTabbingBarContent)));

    return iconTabbingBarContainer;
  }
}
