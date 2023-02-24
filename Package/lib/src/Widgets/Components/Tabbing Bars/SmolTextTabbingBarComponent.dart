import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- SMOL TEXT TABBING BAR owo ----------*/
/// A group of smol buttons that acts as a tabbing bar to change data

class SmolTextTabbingBarComponent extends StatefulWidget {
  /// A list of strings that describe the title of the tab item.
  final List<String> itemTitles;

  /// A list of VoidCallbacks that provide actions to the [itemTitles].
  /// Make sure the VoidCallback has the same index as the title, e.g:
  /// itemTitles: ["Text Ryan", "Call Amanda", "Facetime Fouzan"],
  /// [textRyan(), callAmanda(), facetimeFouzan()]
  final List<VoidCallback> itemActions;

  const SmolTextTabbingBarComponent(
      {required this.itemTitles, required this.itemActions});

  @override
  _SmolTextTabbingBarComponentState createState() =>
      _SmolTextTabbingBarComponentState();
}

class _SmolTextTabbingBarComponentState
    extends State<SmolTextTabbingBarComponent> {
  int _selectedIndex = 0;

  @override
  void initState() {
    _onItemTapped(0);
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TabObject> tabItems = [];
    List<Widget> tabButtons = [];

    for (var element in widget.itemTitles) {
      var currentIndex = widget.itemTitles.indexOf(element);
      var currentAction = widget.itemActions[currentIndex];

      tabItems.add(TabObject.forTextTabbing(
        tabTitle: element,
        onTabSelection: () => {currentAction(), _onItemTapped(currentIndex)},
        accessibilityHint: 'Selects $element as new tab.',
        tabPriority: currentIndex == _selectedIndex
            ? decorationPriority.important
            : decorationPriority.standard,
      ));
    }

    for (var element in tabItems) {
      tabButtons.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 10.0, 15.0, 10.0),
        child: SmolButtonElement(
            decorationVariant: element.tabPriority!,
            buttonTitle: element.tabTitle,
            buttonHint: 'Changes selected tab to ${element.tabTitle}.',
            buttonAction: () => {element.onTabSelection()}),
      ));
    }

    var smolTextContent = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: tabButtons);

    var smolTextContainer = Column(
      children: [
        const SizedBox(height: 10),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal, child: smolTextContent),
        const SizedBox(height: 15),
      ],
    );

    return smolTextContainer;
  }
}
