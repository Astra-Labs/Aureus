import 'package:aureus/aureus.dart';

//A group of icon buttons on a card that acts as a tabbing bar to change data
//Doc Link:

class IconTabbingBarComponent extends StatefulWidget {
  final List<TabObject> tabItems;

  const IconTabbingBarComponent({required this.tabItems})
      : assert(tabItems.length >= 2);

  @override
  _IconTabbingBarComponentState createState() =>
      _IconTabbingBarComponentState();
}

class _IconTabbingBarComponentState extends State<IconTabbingBarComponent> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //keeps track of every active / inactive item

    List<Widget> tabItems = [];

    widget.tabItems.forEach((element) {
      //checks to see if current index matches index of tab item. if yes, it's enabled.
      decorationPriority tabPriority = coloration.itemPriority(
          _selectedIndex == widget.tabItems.indexOf(element) ? true : false);

      var tabItem = Padding(
        padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
        child: SecondaryIconButtonElement(
            buttonAction: () => {},
            decorationVariant: tabPriority,
            buttonTooltip: element.accessibilityHint,
            buttonIcon: element.tabIcon),
      );

      tabItems.add(tabItem);
    });

    return FloatingContainerElement(
      child: SizedBox(
          width: size.layoutItemWidth(1, size.logicalScreenSize),
          height: size.layoutItemHeight(6, size.logicalScreenSize),
          child: Container(
              padding: EdgeInsets.all(8),
              decoration:
                  LayerBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: tabItems)))),
    );
  }
}
