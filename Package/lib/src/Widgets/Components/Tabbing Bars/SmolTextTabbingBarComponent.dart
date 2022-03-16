import 'package:aureus/aureus.dart';

//A group of smol buttons that acts as a tabbing bar to change data

class SmolTextTabbingBarComponent extends StatefulWidget {
  final List<TabObject> tabObjects;

  const SmolTextTabbingBarComponent({required this.tabObjects})
      : assert(tabObjects.length >= 2);

  @override
  _SmolTextTabbingBarComponentState createState() =>
      _SmolTextTabbingBarComponentState();
}

class _SmolTextTabbingBarComponentState
    extends State<SmolTextTabbingBarComponent> {
  // TO-DO: figure out why dart is throwing a proble below, and saying selected index isn't used. -Amanda S
  // ignore: unused_field
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    List<TabObject> tabItems = [];
    List<Widget> tabButtons = [];

    for (var element in widget.tabObjects) {
      var currentIndex = tabItems.indexOf(element);

      tabButtons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmolButtonElement(
            decorationVariant: element.tabPriority!,
            buttonTitle: element.tabTitle,
            buttonHint: 'Changes selected tab to ${element.tabTitle}',
            buttonAction: () =>
                {element.onTabSelection, _onItemTapped(currentIndex)}),
      ));
    }

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          FloatingContainerElement(
              child: SizedBox(
                  width: size.layoutItemWidth(1, screenSize),
                  height: size.layoutItemHeight(6, screenSize),
                  child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: LayerBackingDecoration(
                              priority: decorationPriority.inactive)
                          .buildBacking(),
                      child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: tabButtons)))))
        ]);
  }
}
