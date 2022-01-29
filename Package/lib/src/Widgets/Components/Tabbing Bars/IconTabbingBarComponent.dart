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
  @override
  Widget build(BuildContext context) {
    //keeps track of every active / inactive item

    List<Widget> tabItems = [];

    widget.tabItems.forEach((element) {
      var tabItem = Padding(
        padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
        child: SecondaryIconButtonElement(
            buttonAction: () => {},
            decorationVariant: element.tabPriority,
            buttonTooltip: element.accessibilityHint,
            buttonIcon: element.tabIcon),
      );

      tabItems.add(tabItem);
    });

    var screenSize = size.logicalScreenSize();

    return FloatingContainerElement(
      child: SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: size.layoutItemHeight(6, screenSize),
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
