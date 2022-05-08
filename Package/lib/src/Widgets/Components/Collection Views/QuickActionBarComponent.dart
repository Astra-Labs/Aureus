import 'package:aureus/aureus.dart';

// A group of smol buttons that acts as a tabbing bar to change data
// It can be shrunk, and moved around through a ContainerView.

class QuickActionBarComponent extends StatefulWidget {
  final List<TabObject> tabItems;

  const QuickActionBarComponent({Key? key, required this.tabItems})
      : super(key: key);

  @override
  _QuickActionBarComponentState createState() =>
      _QuickActionBarComponentState();
}

class _QuickActionBarComponentState extends State<QuickActionBarComponent> {
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onItemTapped() {
    setState(() {
      if (isExpanded == false) {
        isExpanded = true;
      } else if (isExpanded == true) {
        isExpanded = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    List<String> tabItemNames = [];
    List<VoidCallback> tabItemActions = [];

    for (var element in widget.tabItems) {
      tabItemNames.add(element.tabTitle);
      tabItemActions.add(element.onTabSelection);
    }

    var minimizedButton = SecondaryIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonIcon: isExpanded ? Assets.expand : Assets.no,
        buttonHint: "buttonHint",
        buttonAction: _onItemTapped);

    var expandedBar = FloatingContainerElement(
      child: Container(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(5, screenSize),
        decoration: CardBackingDecoration(priority: decorationPriority.standard)
            .buildBacking(),
        padding: const EdgeInsets.all(20.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SmolTextTabbingBarComponent(
                  itemTitles: tabItemNames, itemActions: tabItemActions),
              const Spacer(),
              minimizedButton
            ]),
      ),
    );

    return Container(
      child: isExpanded == true ? expandedBar : minimizedButton,
    );
  }
}
