import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- QUICK ACTION BAR ----------*/
/// A group of [SmolButtonElement] that acts as a tabbing bar to do actions
/// This is used in the Safety Functionality to allow people to quickly go
/// to speciality tools from any page in an Aureus Resource.
/// You can control which views show a Quick Action Bar (if your safety
/// settings enable it) within the [ContainerView] initializer parameters.

class QuickActionBarComponent extends StatefulWidget {
  /// A list of tab items to be shown in the Quick Action bar.
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

    var minimizedButton = IconButtonElement(
      decorationVariant: decorationPriority.standard,
      buttonIcon: isExpanded ? Assets.no : Assets.expand,
      buttonHint: "buttonHint",
      buttonAction: _onItemTapped,
      buttonPriority: buttonSize.secondary,
    );

    var expandedBar = FloatingContainerElement(
      child: Container(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(5, screenSize),
        decoration: CardBackingDecoration(priority: decorationPriority.standard)
            .buildBacking(),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TagTwoText("Quick Actions", decorationPriority.standard),
            const SizedBox(height: 5.0),
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SmolTextTabbingBarComponent(
                      itemTitles: tabItemNames, itemActions: tabItemActions),
                  const Spacer(),
                  minimizedButton
                ]),
          ],
        ),
      ),
    );

    return Container(
      child: isExpanded == true ? expandedBar : minimizedButton,
    );
  }
}
