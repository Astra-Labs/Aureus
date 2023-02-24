part of AureusTestingApp;

Image initializationDemoImage() {
  if (palette.brightness() == Brightness.light) {
    return Image(
      image: AssetImage('assets/Landing-Example-Light-Mode.png'),
      semanticLabel:
          'A code editor that shows how to write a landing page using Aureus.',
    );
  } else if (palette.brightness() == Brightness.dark) {
    return Image(
        image: AssetImage('assets/Landing-Example-Dark-Mode.png'),
        semanticLabel:
            'A code editor that shows how to write a landing page using Aureus.');
  }
  throw ('Unexpected platform brightness issue. Please check the implementation.');
}

Image demoCreationImage() {
  if (palette.brightness() == Brightness.light) {
    return Image(
      image: AssetImage('assets/Light-Mode-Demo.png'),
      semanticLabel:
          'A phone and tablet side by side showing a landing page from Aureus.',
    );
  } else if (palette.brightness() == Brightness.dark) {
    return Image(
      image: AssetImage('assets/Dark-Mode-Demo.png'),
      semanticLabel:
          'A phone and tablet side by side showing a landing page from Aureus.',
    );
  }
  throw ('Unexpected platform brightness issue. Please check the implementation.');
}

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
      HeadingTwoText("I'm ${resourceValues.name}", decorationPriority.standard),
      SizedBox(height: 4.0),
      HeadingOneText(resourceValues.mission, decorationPriority.standard)
    ]);

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

    List<TabObject> unsanitizedTabs = [
      TabObject.forIconTabbing(
          tabIcon: Assets.alertmessage,
          tabPriority: decorationPriority.standard,
          onTabSelection: () => {_onItemTapped(0)},
          accessibilityHint: 'Safety'),
      TabObject.forIconTabbing(
          tabIcon: Assets.people,
          tabPriority: decorationPriority.standard,
          onTabSelection: () => {_onItemTapped(1)},
          accessibilityHint: 'Accessibility'),
      TabObject.forIconTabbing(
          tabIcon: Assets.partnership,
          tabPriority: decorationPriority.standard,
          onTabSelection: () => {_onItemTapped(2)},
          accessibilityHint: 'Our future')
    ];

    List<TabObject> tabItems = [];

    unsanitizedTabs.forEach((element) {
      tabItems.add(TabObject.forIconTabbing(
          tabIcon: element.tabIcon,
          tabPriority: unsanitizedTabs.indexOf(element) == _selectedIndex
              ? decorationPriority.important
              : decorationPriority.standard,
          onTabSelection: element.onTabSelection,
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
                          decorationVariant: decorationPriority.inactive)
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
                              IconButtonElement(
                                  decorationVariant: (_selectedIndex == 0)
                                      ? decorationPriority.inactive
                                      : decorationPriority.important,
                                  buttonIcon: Assets.back,
                                  buttonHint: 'Previous Item',
                                  buttonAction: () =>
                                      {_onItemTapped(_selectedIndex -= 1)},
                                  buttonPriority: buttonSize.secondary),
                              IconButtonElement(
                                  decorationVariant: (_selectedIndex >
                                          (boxInformation.length - 2))
                                      ? decorationPriority.inactive
                                      : decorationPriority.important,
                                  buttonIcon: Assets.next,
                                  buttonHint: 'Next Item',
                                  buttonAction: () =>
                                      {_onItemTapped(_selectedIndex += 1)},
                                  buttonPriority: buttonSize.secondary)
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

class footerCTA extends StatefulWidget {
  @override
  _footerCTAState createState() => _footerCTAState();
}

class _footerCTAState extends State<footerCTA> {
  Future<void> launchInBrowser(String url) async {
    // ignore: deprecated_member_use
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
    )) {
      throw 'Could not launch $url';
    }
  }

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
              'Aureus is currently in beta.', decorationPriority.standard),
          SizedBox(height: 20.0),
          BodyOneText("Someone needs to put content here.",
              decorationPriority.standard),
          SizedBox(height: 20.0),
          SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(2, screenSize),
            child: FloatingContainerElement(
              child: Container(
                  decoration: LayerBackingDecoration(
                          decorationVariant: decorationPriority.standard)
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
                              buttonTitle: 'Explore Aureus.',
                              buttonHint:
                                  "Opens the exploration view for Aureus.",
                              buttonAction: () => {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              ExplorationView(),
                                        ))
                                  }),
                          Spacer(),
                          StandardButtonElement(
                              decorationVariant: decorationPriority.standard,
                              buttonHint: "Shows you our Gen 2.0 plan",
                              buttonTitle: 'Learn about our Gen 2.0 resources.',
                              buttonAction: () => {
                                    launchInBrowser(
                                        'https://www.withastra.org/writing/enter-gen-20')
                                  }),
                          Spacer(),
                          StandardButtonElement(
                              decorationVariant: decorationPriority.standard,
                              buttonTitle: 'Open Aureus Github repo.',
                              buttonHint:
                                  "Opens the Github Repository for Aureus",
                              buttonAction: () => {
                                    launchInBrowser(
                                        'https://github.com/Astra-Labs/Aureus')
                                  }),
                          Spacer(),
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
      showQuickActionBar: false,
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
      showQuickActionBar: false,
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
                    footerCTA(),
                    SizedBox(height: 30.0)
                  ]),
            ),
          ]),
    );
  }
}
