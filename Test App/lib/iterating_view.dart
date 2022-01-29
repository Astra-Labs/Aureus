import 'package:aureus/aureus.dart';

class IteratingComponent extends StatefulWidget {
  final List<String> itemTitles;
  final List<Widget> itemWidgets;

  const IteratingComponent(
      {required this.itemTitles, required this.itemWidgets});

  @override
  _IteratingComponentState createState() => _IteratingComponentState();
}

class _IteratingComponentState extends State<IteratingComponent> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TabObject> tabItems = [];
    List<Widget> tabButtons = [];

    var screenSize = size.logicalScreenSize();

    widget.itemTitles.forEach((element) {
      var currentIndex = widget.itemTitles.indexOf(element);

      tabItems.add(TabObject.forTextTabbing(
          tabTitle: element,
          tabPriority: currentIndex == _selectedIndex
              ? decorationPriority.important
              : decorationPriority.standard,
          accessibilityHint: element));
    });

    var currentTitle = widget.itemTitles[_selectedIndex];
    var currentWidget = widget.itemWidgets[_selectedIndex];

    tabItems.forEach((element) {
      var currentIndex = tabItems.indexOf(element);

      tabButtons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmolButtonElement(
            decorationVariant: element.tabPriority,
            buttonTitle: element.tabTitle,
            buttonAction: () => {_onItemTapped(currentIndex)}),
      ));
    });

    Widget mobileInformationCard = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(4, screenSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  currentWidget,
                  Spacer(),
                ],
              )),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.layoutItemHeight(5, screenSize),
              width: size.layoutItemWidth(1, screenSize),
              child: FloatingContainerElement(
                child: Container(
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: TagOneText(
                                currentTitle, decorationPriority.standard)),
                        Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SecondaryIconButtonElement(
                                decorationVariant: (_selectedIndex == 0)
                                    ? decorationPriority.inactive
                                    : decorationPriority.important,
                                buttonIcon: Assets.back,
                                buttonTooltip: 'Previous Item',
                                buttonAction: () =>
                                    {_onItemTapped(_selectedIndex -= 1)}),
                            SecondaryIconButtonElement(
                                decorationVariant:
                                    (_selectedIndex > (tabItems.length - 2))
                                        ? decorationPriority.inactive
                                        : decorationPriority.important,
                                buttonIcon: Assets.next,
                                buttonTooltip: 'Next Item',
                                buttonAction: () =>
                                    {_onItemTapped(_selectedIndex += 1)})
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ]);

    Widget webInformationCard = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: size.layoutItemWidth(1, screenSize) * 0.6,
              height: size.layoutItemHeight(2, screenSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  currentWidget,
                  Spacer(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingContainerElement(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: size.layoutItemHeight(3, screenSize),
                    maxWidth: size.layoutItemWidth(3, screenSize) * 1.2),
                decoration:
                    CardBackingDecoration(priority: decorationPriority.inactive)
                        .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Spacer(),
                      Flexible(
                          child: TagOneText(
                              currentTitle, decorationPriority.standard)),
                      Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          SecondaryIconButtonElement(
                              decorationVariant: (_selectedIndex == 0)
                                  ? decorationPriority.inactive
                                  : decorationPriority.important,
                              buttonIcon: Assets.back,
                              buttonTooltip: 'Previous Item',
                              buttonAction: () =>
                                  {_onItemTapped(_selectedIndex -= 1)}),
                          SecondaryIconButtonElement(
                              decorationVariant:
                                  (_selectedIndex > (tabItems.length - 2))
                                      ? decorationPriority.inactive
                                      : decorationPriority.important,
                              buttonIcon: Assets.next,
                              buttonTooltip: 'Next Item',
                              buttonAction: () =>
                                  {_onItemTapped(_selectedIndex += 1)})
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]);

    Widget informationCard = SizedBox(
      width: size.layoutItemWidth(1, screenSize),
      height: size.layoutItemHeight(1, screenSize) * 0.6,
      child: FloatingContainerElement(
          child: Container(
              padding: EdgeInsets.all(8.0),
              decoration:
                  CardBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              child: size.isDesktopDisplay()
                  ? mobileInformationCard
                  : webInformationCard)),
    );

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
                    padding: EdgeInsets.all(8),
                    decoration: LayerBackingDecoration(
                            priority: decorationPriority.inactive)
                        .buildBacking(),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: tabButtons))))),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
          child: informationCard,
        )
      ],
    );
  }
}
