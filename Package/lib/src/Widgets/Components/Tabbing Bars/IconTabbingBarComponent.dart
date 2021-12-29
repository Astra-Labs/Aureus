import 'package:aureus/aureus.dart';

//A group of icon buttons on a card that acts as a tabbing bar to change data
//Doc Link:

class IconTabbingBarComponent extends StatefulWidget {
  final List<TabObject> tabObjects;

  const IconTabbingBarComponent({required this.tabObjects})
      : assert(tabObjects.length >= 2);

  @override
  _IconTabbingBarComponentState createState() =>
      _IconTabbingBarComponentState();
}

class _IconTabbingBarComponentState extends State<IconTabbingBarComponent> {
  Map<int, bool> tabActives = {};

  @override
  Widget build(BuildContext context) {
    //keeps track of every active / inactive item
    ListView tabItems = ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: widget.tabObjects.length,
      itemBuilder: (BuildContext context, int index) {
        bool isItemActive = tabActives[index]!;

        decorationPriority tabPriority() {
          if (isItemActive == true) {
            return decorationPriority.important;
          } else if (isItemActive == false) {
            return decorationPriority.standard;
          }
          return decorationPriority.inactive;
        }

        return Padding(
          padding: EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 0.0),
          child: SecondaryIconButtonElement(
              buttonAction: () => {
                    if (tabPriority() != decorationPriority.inactive)
                      {widget.tabObjects[index].onTabSelection}
                  },
              decorationVariant: tabPriority(),
              buttonTooltip: widget.tabObjects[index].accessibilityHint,
              buttonIcon: widget.tabObjects[index].tabIcon),
        );
      },
    );

    return Container(
        padding: EdgeInsets.all(8),
        decoration:
            LayerBackingDecoration(priority: decorationPriority.inactive)
                .buildBacking(),
        child: SizedBox(height: 40.0, child: tabItems));
  }
}
