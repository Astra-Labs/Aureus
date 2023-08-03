import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/*--------- ITERATING TABBING COMPONENT ----------*/
/// An icon tabbing bar and accompanying card that acts as an onboarding walkthrough

class IteratingTabbingComponent extends StatefulWidget {
  /// A list of strings that describe the title of the tab item.
  final List<String> itemTitles;

  /// A list of Widgets that have a parent tab item to the [itemTitles].
  /// Make sure the Widgets have the same index as the title, e.g:
  /// itemTitles: ["Text Ryan", "Call Amanda", "Facetime Fouzan"],
  /// [textRyanView(), callAmandaView(), facetimeFouzanView()]
  final List<Widget> itemWidgets;

  const IteratingTabbingComponent(
      {required this.itemTitles, required this.itemWidgets});

  @override
  _IteratingTabbingComponentState createState() =>
      _IteratingTabbingComponentState();
}

class _IteratingTabbingComponentState extends State<IteratingTabbingComponent> {
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

    var screenSize = MediaQuery.of(context).size;

    for (var element in widget.itemTitles) {
      var currentIndex = widget.itemTitles.indexOf(element);

      tabItems.add(TabObject.forTextTabbing(
        tabTitle: element,
        onTabSelection: () => {_onItemTapped(currentIndex)},
        accessibilityHint: 'Selects $element as new tab.',
        tabPriority: currentIndex == _selectedIndex
            ? decorationPriority.important
            : decorationPriority.standard,
      ));
    }

    var currentTitle = widget.itemTitles[_selectedIndex];
    var currentWidget = widget.itemWidgets[_selectedIndex];

    for (var element in tabItems) {
      var currentIndex = tabItems.indexOf(element);

      tabButtons.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmolButtonElement(
            decorationVariant: element.tabPriority!,
            buttonTitle: element.tabTitle,
            buttonHint: 'Changes selected tab to ${element.tabTitle}.',
            buttonAction: () => {_onItemTapped(currentIndex)}),
      ));
    }

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
                  const Spacer(),
                  currentWidget,
                  const Spacer(),
                ],
              )),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.layoutItemHeight(5, screenSize),
              width: size.layoutItemWidth(1, screenSize),
              child: FloatingContainerElement(
                child: Container(
                  decoration: CardBackingDecoration(
                          decorationVariant: decorationPriority.inactive)
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
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            IconButtonElement(
                              decorationVariant: (_selectedIndex == 0)
                                  ? decorationPriority.inactive
                                  : decorationPriority.important,
                              buttonIcon: Assets.back,
                              buttonHint:
                                  'Changes selection to previous tab item.',
                              buttonAction: () =>
                                  {_onItemTapped(_selectedIndex -= 1)},
                              buttonPriority: buttonSize.secondary,
                            ),
                            IconButtonElement(
                              decorationVariant:
                                  (_selectedIndex > (tabItems.length - 2))
                                      ? decorationPriority.inactive
                                      : decorationPriority.important,
                              buttonIcon: Assets.next,
                              buttonHint: 'Changes selection to next tab item.',
                              buttonAction: () =>
                                  {_onItemTapped(_selectedIndex += 1)},
                              buttonPriority: buttonSize.secondary,
                            )
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
                  const Spacer(),
                  currentWidget,
                  const Spacer(),
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
                decoration: CardBackingDecoration(
                        decorationVariant: decorationPriority.inactive)
                    .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      Flexible(
                          child: TagOneText(
                              currentTitle, decorationPriority.standard)),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButtonElement(
                            decorationVariant: (_selectedIndex == 0)
                                ? decorationPriority.inactive
                                : decorationPriority.important,
                            buttonIcon: Assets.back,
                            buttonHint: 'Previous Item',
                            buttonAction: () =>
                                {_onItemTapped(_selectedIndex -= 1)},
                            buttonPriority: buttonSize.secondary,
                          ),
                          IconButtonElement(
                            decorationVariant:
                                (_selectedIndex > (tabItems.length - 2))
                                    ? decorationPriority.inactive
                                    : decorationPriority.important,
                            buttonIcon: Assets.next,
                            buttonHint: 'Next Item',
                            buttonAction: () =>
                                {_onItemTapped(_selectedIndex += 1)},
                            buttonPriority: buttonSize.secondary,
                          )
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
              padding: const EdgeInsets.all(8.0),
              decoration: CardBackingDecoration(
                      decorationVariant: decorationPriority.inactive)
                  .buildBacking(),
              child: size.isDesktopDisplay(MediaQuery.of(context).size)
                  ? mobileInformationCard
                  : webInformationCard)),
    );

    var iteratingTabbingBar = FloatingContainerElement(
        child: Container(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(6, screenSize),
            padding: const EdgeInsets.all(8),
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.inactive)
                .buildBacking(),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: tabButtons))));

    var iteratingTabbingInformation = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: informationCard,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [iteratingTabbingBar, iteratingTabbingInformation],
    );
  }
}
