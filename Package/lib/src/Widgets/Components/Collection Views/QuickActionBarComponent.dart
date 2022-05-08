import 'package:aureus/aureus.dart';

// A group of smol buttons that acts as a tabbing bar to change data
// It can be shrunk, and moved around through a ContainerView.

class QuickActionBarComponent extends StatefulWidget {
  final List<TabObject> tabItems;

  const QuickActionBarComponent({required this.tabItems});

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

    var tabItemNames = [];
    var tabItemActions = [];

    var minimizedButton = SecondaryIconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonIcon: isExpanded ? Assets.expand : Assets.no,
        buttonHint: "buttonHint",
        buttonAction: _onItemTapped);

    var expandedBar = FloatingContainerElement(
      child: Container(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        decoration: CardBackingDecoration(priority: decorationPriority.standard)
            .buildBacking(),
        child: Row(
          children: [
            const SmolTextTabbingBarComponent(itemTitles: [], itemActions: []),
            const SizedBox(width: 10.0),
            minimizedButton
          ],
        ),
      ),
    );

    return isExpanded == true ? expandedBar : minimizedButton;
  }
}
