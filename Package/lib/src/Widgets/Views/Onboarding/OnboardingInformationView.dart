import 'package:aureus/aureus.dart';

class OnboardingInformationView extends StatefulWidget {
  final List<OnboardingDetail> onboardingDetails;

  const OnboardingInformationView({required this.onboardingDetails});

  @override
  _OnboardingInformationViewState createState() =>
      _OnboardingInformationViewState();
}

class _OnboardingInformationViewState extends State<OnboardingInformationView> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<TabObject> tabItems = [];

    var screenSize = size.logicalScreenSize();

    widget.onboardingDetails.forEach((element) {
      tabItems.add(TabObject.forIconTabbing(
          tabIcon: element.detailCategoryIcon,
          tabPriority:
              widget.onboardingDetails.indexOf(element) == _selectedIndex
                  ? decorationPriority.important
                  : decorationPriority.standard,
          onTabSelection: () =>
              {_onItemTapped(widget.onboardingDetails.indexOf(element))},
          accessibilityHint: element.detailTitle));
    });

    var currentItem = widget.onboardingDetails[_selectedIndex];

    Widget iconTabBar = IconTabbingBarComponent(tabItems: tabItems);

    Widget mobileInformationCard = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              constraints: BoxConstraints(
                  minHeight: size.layoutItemHeight(2, screenSize)),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: universalBorder(),
                  image: DecorationImage(
                    image: currentItem.detailImage.image,
                    fit: BoxFit.cover,
                  ))),
          Spacer(),
          TagOneText(currentItem.detailTitle, decorationPriority.standard),
          BodyOneText(currentItem.detailBody, decorationPriority.standard),
          Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              PrimaryIconButtonElement(
                  decorationVariant: (_selectedIndex == 0)
                      ? decorationPriority.inactive
                      : decorationPriority.important,
                  buttonIcon: Assets.back,
                  buttonTooltip: 'Previous Item',
                  buttonAction: () => {_onItemTapped(_selectedIndex -= 1)}),
              PrimaryIconButtonElement(
                  decorationVariant:
                      (_selectedIndex > (widget.onboardingDetails.length - 2))
                          ? decorationPriority.inactive
                          : decorationPriority.important,
                  buttonIcon: Assets.next,
                  buttonTooltip: 'Next Item',
                  buttonAction: () => {_onItemTapped(_selectedIndex += 1)})
            ],
          )
        ]);

    Widget webInformationCard = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                constraints: BoxConstraints(
                    minHeight: size.layoutItemHeight(3, screenSize),
                    minWidth: size.layoutItemWidth(2, screenSize)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: universalBorder(),
                    image: DecorationImage(
                      image: currentItem.detailImage.image,
                      fit: BoxFit.cover,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              constraints: BoxConstraints(
                  minHeight: size.layoutItemHeight(3, screenSize),
                  maxWidth: size.layoutItemWidth(2, screenSize) * 0.8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacer(),
                  Flexible(
                      child: TagOneText(currentItem.detailTitle,
                          decorationPriority.standard)),
                  Flexible(
                    child: BodyOneText(
                        currentItem.detailBody, decorationPriority.standard),
                  ),
                  Spacer(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      PrimaryIconButtonElement(
                          decorationVariant: (_selectedIndex == 0)
                              ? decorationPriority.inactive
                              : decorationPriority.important,
                          buttonIcon: Assets.back,
                          buttonTooltip: 'Previous Item',
                          buttonAction: () =>
                              {_onItemTapped(_selectedIndex -= 1)}),
                      PrimaryIconButtonElement(
                          decorationVariant: (_selectedIndex >
                                  (widget.onboardingDetails.length - 2))
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
          )
        ]);

    Widget informationCard = SizedBox(
      width: size.layoutItemWidth(1, screenSize),
      height: size.layoutItemHeight(1, screenSize) * 0.7,
      child: FloatingContainerElement(
          child: Container(
              padding:
                  EdgeInsets.all(size.widthOf(weight: sizingWeight.w0) / 2),
              decoration:
                  CardBackingDecoration(priority: decorationPriority.inactive)
                      .buildBacking(),
              child: size.isDesktopDisplay()
                  ? mobileInformationCard
                  : webInformationCard)),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        Align(
            alignment: Alignment.topRight,
            child: SecondaryIconButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonIcon: Assets.no,
                buttonTooltip: 'Return to onboarding landing',
                buttonAction: () => {Navigator.pop(context)})),
        HeadingOneText(
            "Meet ${resourceValues.name}.", decorationPriority.standard),
        iconTabBar,
        informationCard,
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
