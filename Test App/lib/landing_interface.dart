import 'package:aureus/aureus.dart';
import 'package:test_app/main.dart';
import 'package:test_app/test_interface.dart';

Image initializationDemoImage() {
  if (brightness() == Brightness.light) {
    return Image(
      image: AssetImage('assets/Landing-Example-Light-Mode.png'),
      semanticLabel:
          'A code editor that shows how to write a landing page using Aureus.',
    );
  } else if (brightness() == Brightness.dark) {
    return Image(
        image: AssetImage('assets/Landing-Example-Dark-Mode.png'),
        semanticLabel:
            'A code editor that shows how to write a landing page using Aureus.');
  }
  throw ('Unexpected platform brightness issue. Please check the implementation.');
}

Image demoCreationImage() {
  if (brightness() == Brightness.light) {
    return Image(
      image: AssetImage('assets/Light-Mode-Demo.png'),
      semanticLabel:
          'A phone and tablet side by side showing a landing page from Aureus.',
    );
  } else if (brightness() == Brightness.dark) {
    return Image(
      image: AssetImage('assets/Dark-Mode-Demo.png'),
      semanticLabel:
          'A phone and tablet side by side showing a landing page from Aureus.',
    );
  }
  throw ('Unexpected platform brightness issue. Please check the implementation.');
}

List<TabObject> unsanitizedTabs = [
  TabObject.forIconTabbing(
      tabIcon: Assets.alertmessage,
      tabPriority: decorationPriority.standard,
      accessibilityHint: 'Safety'),
  TabObject.forIconTabbing(
      tabIcon: Assets.people,
      tabPriority: decorationPriority.standard,
      accessibilityHint: 'Accessibility'),
  TabObject.forIconTabbing(
      tabIcon: Assets.partnership,
      tabPriority: decorationPriority.standard,
      accessibilityHint: 'Our future')
];

Map<String, String> boxInformation = {
  "Safety at scale.":
      "Aureus has the first known risk-mitigation functionality for users in dangerous situations. \n\nThe functionality enables the user to take control over what software is allowed to do, to ensure it doesn't escalate voilatile situations.",
  "Accessibility in every area.":
      "Access must go beyond usability for people with disabilities, and include access for different financial, family, and cultural situations. \n\nAureus works to achieve accessibility across every area we can, to truly create software that reaches everyone.",
  "A vision of the future.":
      "Starting now, Aureus will encompasses all Astra resources. \n\nAt launch, Aureus will be available to license to non-profit organizations and sofware to enable better accessibility of ethical design tools and software development within the industry."
};

Column informationHiearchy = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      HeadingTwoText(
          "I'm ${packageVariables.prodName}", decorationPriority.standard),
      SizedBox(height: 4.0),
      HeadingOneText(
          packageVariables.missionTagline, decorationPriority.standard)
    ]);

/* ------------------------------------------------------------------------------------------------------------ */

class mobileLandingPageDemo extends StatefulWidget {
  @override
  _mobileLandingPageDemoState createState() => _mobileLandingPageDemoState();
}

class _mobileLandingPageDemoState extends State<mobileLandingPageDemo> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();

    return SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(1, screenSize) * 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            HeadingOneText(
                'Focus on helping, not coding.', decorationPriority.standard),
            SizedBox(height: 10.0),
            BodyOneText(
                "Aureus enables designing, and developing software for urgent situations in a matter of days/weeks, not months/years.",
                decorationPriority.standard),
            SizedBox(height: 40.0),
            Container(
                constraints: BoxConstraints(
                    minWidth: size.layoutItemWidth(1, screenSize),
                    maxWidth: size.layoutItemWidth(1, screenSize)),
                child: demoCreationImage()),
            SizedBox(height: 40.0),
            Container(
                constraints: BoxConstraints(
                    minWidth: size.layoutItemWidth(1, screenSize),
                    maxWidth: size.layoutItemWidth(1, screenSize)),
                child: initializationDemoImage()),
            Spacer(),
            DividerElement()
          ],
        ));
  }
}

class webLandingPageDemo extends StatefulWidget {
  @override
  _webLandingPageDemoState createState() => _webLandingPageDemoState();
}

class _webLandingPageDemoState extends State<webLandingPageDemo> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();

    return SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(1, screenSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            HeadingOneText(
                'Focus on helping, not coding.', decorationPriority.standard),
            SizedBox(height: 10.0),
            BodyOneText(
                "Built in Flutter - Aureus enables designing, and developing software for urgent situations in a matter of days/weeks, not months/years.",
                decorationPriority.standard),
            Spacer(),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      constraints: BoxConstraints(
                          minWidth: size.layoutItemWidth(2, screenSize),
                          maxWidth: size.layoutItemWidth(2, screenSize)),
                      child: demoCreationImage()),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Container(
                      constraints: BoxConstraints(
                          minWidth: size.layoutItemWidth(2, screenSize),
                          maxWidth: size.layoutItemWidth(2, screenSize)),
                      child: initializationDemoImage()),
                ),
              ],
            ),
            Spacer(),
            DividerElement()
          ],
        ));
  }
}

class landingHeader extends StatefulWidget {
  @override
  _landingHeaderState createState() => _landingHeaderState();
}

class _landingHeaderState extends State<landingHeader> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();

    List<TabObject> tabItems = [];

    unsanitizedTabs.forEach((element) {
      tabItems.add(TabObject.forIconTabbing(
          tabIcon: element.tabIcon,
          tabPriority: unsanitizedTabs.indexOf(element) == _selectedIndex
              ? decorationPriority.important
              : decorationPriority.standard,
          accessibilityHint: element.accessibilityHint));
    });

    var currentItem = boxInformation.entries.elementAt(_selectedIndex);
    Widget iconTabBar = IconTabbingBarComponent(tabItems: tabItems);

    return SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(1, screenSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            iconTabBar,
            SizedBox(height: 10.0),
            SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(1, screenSize) * 0.60,
              child: FloatingContainerElement(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Spacer(),
                          HeadingThreeText(
                              currentItem.key, decorationPriority.standard),
                          SizedBox(height: 10),
                          BodyOneText(
                              currentItem.value, decorationPriority.standard),
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
                                  decorationVariant: (_selectedIndex >
                                          (boxInformation.length - 2))
                                      ? decorationPriority.inactive
                                      : decorationPriority.important,
                                  buttonIcon: Assets.next,
                                  buttonTooltip: 'Next Item',
                                  buttonAction: () =>
                                      {_onItemTapped(_selectedIndex += 1)})
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            Spacer(),
          ],
        ));
  }
}

class breakoutArea extends StatefulWidget {
  @override
  _breakoutAreaState createState() => _breakoutAreaState();
}

class _breakoutAreaState extends State<breakoutArea> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();

    var featureCard1 = InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AureusElementsView(),
                  ))
            },
        child: CategoryIconDetailCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: 'Elements',
            cardBody:
                "Buttons, dividers, labels that make up the first layer of building blocks for a view.",
            cardIcon: Assets.link));

    var featureCard2 = InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AureusComponentsView(),
                  ))
            },
        child: CategoryIconDetailCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: 'Components',
            cardBody:
                "Emergency exit bars, alert controllers, notifications, message bubbles, and other major building blocks,",
            cardIcon: Assets.expand));

    var featureCard3 = InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AureusViewsView(),
                  ))
            },
        child: CategoryIconDetailCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: 'Views',
            cardBody:
                "Re-usable views for data consent, safety, onboarding, customer service and more.",
            cardIcon: Assets.window));

    List<Widget> cardItems = [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: featureCard1,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: featureCard2,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: featureCard3,
      )
    ];

    return SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(1, screenSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            DividerElement(),
            Spacer(),
            TabSubheaderElement(title: 'What Aureus is made of.'),
            SizedBox(height: 20.0),
            SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(1, screenSize) * 0.6,
              child: FloatingContainerElement(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: LayerBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: cardItems)),
                ),
              ),
            ),
            Spacer(),
            DividerElement()
          ],
        ));
  }
}

class footerCTA extends StatefulWidget {
  @override
  _footerCTAState createState() => _footerCTAState();
}

class _footerCTAState extends State<footerCTA> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();

    return SizedBox(
      width: size.layoutItemWidth(1, screenSize),
      height: size.layoutItemHeight(1, screenSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Spacer(),
          HeadingOneText(
              'Aureus is currently in beta at Astra Labs, and not available for external use.',
              decorationPriority.standard),
          SizedBox(height: 20.0),
          BodyOneText(
              "Check back for more details about non-profit licensing in Fall 2022",
              decorationPriority.standard),
          SizedBox(height: 20.0),
          SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize) * 0.4,
            child: FloatingContainerElement(
              child: Container(
                  decoration: LayerBackingDecoration(
                          priority: decorationPriority.standard)
                      .buildBacking(),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Spacer(),
                          StandardButtonElement(
                              decorationVariant: decorationPriority.important,
                              buttonTitle: 'Open Github repo.',
                              buttonAction: () => {
                                    launchInBrowser(
                                        'https://github.com/Astra-Labs/Aureus')
                                  }),
                          SizedBox(height: 30.0),
                          StandardButtonElement(
                              decorationVariant: decorationPriority.standard,
                              buttonTitle: 'our Gen 2.0 resources.',
                              buttonAction: () => {
                                    launchInBrowser(
                                        'https://www.withastra.org/writing/enter-gen-20')
                                  }),
                          Spacer()
                        ]),
                  )),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}

class webLandingView extends StatefulWidget {
  final Image landscapeBacking;
  final Image uiOverlay;
  final List<StandardIconButtonElement> actionButtons;

  const webLandingView(
      {required this.landscapeBacking,
      required this.uiOverlay,
      required this.actionButtons});
  @override
  _webLandingViewState createState() => _webLandingViewState();
}

class _webLandingViewState extends State<webLandingView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = size.logicalWidth();
    double screenHeight = size.logicalHeight();

    Column buttonItems = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: widget.actionButtons,
    );

    return ContainerView(
      takesFullWidth: true,
      decorationVariant: decorationPriority.important,
      builder: ContainerWrapperElement(
          containerVariant: wrapperVariants.stackScroll,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  constraints: BoxConstraints(
                      minHeight: screenHeight,
                      maxHeight: screenHeight,
                      minWidth: screenWidth,
                      maxWidth: screenWidth),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.landscapeBacking.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                          width: screenWidth / 3.5,
                          height: screenHeight * 0.5,
                          child: Center(child: informationHiearchy)),
                      SizedBox(
                          width: screenWidth / 3.5,
                          height: screenHeight * 0.88,
                          child: widget.uiOverlay),
                      SizedBox(
                          width: screenWidth / 3.5,
                          height: screenHeight *
                              (0.10 * widget.actionButtons.length),
                          child: buttonItems),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(height: 60.0),
                      webLandingPageDemo(),
                      SizedBox(height: 60.0),
                      landingHeader(),
                      SizedBox(height: 60.0),
                      breakoutArea(),
                      SizedBox(height: 60.0),
                      footerCTA(),
                      SizedBox(height: 60.0)
                    ],
                  ),
                )
              ],
            ),
          ]),
    );
  }
}

class mobileLandingView extends StatefulWidget {
  final Image landscapeBacking;
  final Image uiOverlay;
  final List<StandardIconButtonElement> actionButtons;

  const mobileLandingView(
      {required this.landscapeBacking,
      required this.uiOverlay,
      required this.actionButtons});
  @override
  _mobileLandingViewState createState() => _mobileLandingViewState();
}

class _mobileLandingViewState extends State<mobileLandingView> {
  @override
  Widget build(BuildContext context) {
    Column buttonItems = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: widget.actionButtons,
    );

    double screenWidth = size.logicalWidth();
    double screenHeight = size.logicalHeight();

    return ContainerView(
      takesFullWidth: true,
      decorationVariant: decorationPriority.important,
      builder: ContainerWrapperElement(
          containerVariant: wrapperVariants.stackScroll,
          children: [
            Container(
                constraints: BoxConstraints(
                    minHeight: screenHeight * 1.5,
                    maxHeight: screenHeight * 1.5,
                    minWidth: screenWidth,
                    maxWidth: screenWidth),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.landscapeBacking.image,
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      child: Padding(
                        padding: EdgeInsets.all(
                            size.widthOf(weight: sizingWeight.w1)),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height:
                                      size.heightOf(weight: sizingWeight.w1)),
                              informationHiearchy,
                              SizedBox(
                                  height:
                                      size.heightOf(weight: sizingWeight.w0)),
                              widget.uiOverlay,
                              SizedBox(
                                  height:
                                      size.heightOf(weight: sizingWeight.w0)),
                              SizedBox(
                                  height: screenHeight *
                                      (0.15 * widget.actionButtons.length),
                                  child: buttonItems),
                              SizedBox(height: 10.0),
                            ]),
                      ),
                    ),
                  ],
                )),
            Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 30.0),
                    mobileLandingPageDemo(),
                    SizedBox(height: 30.0),
                    landingHeader(),
                    SizedBox(height: 30.0),
                    breakoutArea(),
                    SizedBox(height: 30.0),
                    footerCTA(),
                    SizedBox(height: 30.0)
                  ]),
            ),
          ]),
    );
  }
}
