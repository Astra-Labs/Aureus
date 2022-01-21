import 'package:aureus/aureus.dart';

//
//Doc Link:

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

    widget.onboardingDetails.forEach((element) {
      tabItems.add(TabObject.forIconTabbing(
          tabIcon: element.detailCategoryIcon,
          tabPriority: decorationPriority.standard,
          accessibilityHint: element.detailTitle));
    });

    var currentItem = widget.onboardingDetails[_selectedIndex];

    Widget iconTabBar = IconTabbingBarComponent(tabItems: tabItems);

    Widget informationCard = SizedBox(
        width: size.layoutItemWidth(1, size.logicalScreenSize),
        height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.7,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration:
              CardBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    constraints: BoxConstraints(
                        minHeight:
                            size.layoutItemHeight(3, size.logicalScreenSize)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: universalBorder(),
                        image: DecorationImage(
                          image: currentItem.detailImage.image,
                          fit: BoxFit.cover,
                        ))),
                Spacer(),
                TagOneText(
                    currentItem.detailTitle, decorationPriority.standard),
                BodyOneText(
                    currentItem.detailBody, decorationPriority.standard),
                Spacer(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    PrimaryIconButtonElement(
                        decorationVariant: (_selectedIndex == 0 &&
                                _selectedIndex <
                                    widget.onboardingDetails.length)
                            ? decorationPriority.inactive
                            : decorationPriority.important,
                        buttonIcon: Icons.skip_next_outlined,
                        buttonTooltip: 'Previous Item',
                        buttonAction: () =>
                            {_onItemTapped(_selectedIndex -= 1)}),
                    PrimaryIconButtonElement(
                        decorationVariant: decorationPriority.important,
                        buttonIcon: Icons.next_plan_outlined,
                        buttonTooltip: 'Next Item',
                        buttonAction: () =>
                            {_onItemTapped(_selectedIndex += 1)})
                  ],
                )
              ]),
        ));

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        HeadingOneText(
            "Meet ${apiVariables.prodName}.", decorationPriority.standard),
        iconTabBar,
        informationCard
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}