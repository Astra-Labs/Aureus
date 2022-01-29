import 'package:aureus/aureus.dart';
import 'package:test_app/main.dart';
import 'package:test_app/iterating_view.dart';
import 'package:test_app/text_items.dart';
import 'interface_items.dart';
import 'view_items.dart';

Map<String, Widget> aureusElements = {
  'Typography': textTestListView,
  'Tab Subheader': tabSubheader,
  'Divider': divider,
  'Slider': slider,
  'Timer': timer,
  'Standard Text Field': singleInput,
  'Labeled Input Text Field': multiInput,
  'Full Width Button': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardFullWidthButton,
        SizedBox(height: 10),
        importantFullWidthButton,
        SizedBox(height: 10),
        inactiveFullWidthButton
      ]),
  'Primary Icon Buttons': Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardPrimaryIconButton,
        SizedBox(height: 10),
        importantPrimaryIconButton,
        SizedBox(height: 10),
        inactivePrimaryIconButton
      ]),
  'Secondary Icon Buttons': Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardSecondaryIconButton,
        SizedBox(height: 10),
        importantSecondaryIconButton,
        SizedBox(height: 10),
        inactiveSecondaryIconButton
      ]),
  'Smol Buttons': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardSmolButton,
        SizedBox(height: 10),
        importantSmolButton,
        SizedBox(height: 10),
        inactiveSmolButton
      ]),
  'Standard Buttons': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        standardStandardButton,
        SizedBox(height: 10),
        importantStandardButton,
        SizedBox(height: 10),
        inactiveStandardButton
      ]),
};

Map<String, Widget> aureusComponents = {
  'Exit Bar': ExitBarComponent(),
  'Message Bubbles': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        senderMessageBubble,
        SizedBox(height: 20),
        receiverMessageBubble
      ]),
  'Notifications': Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [unreadNotification, SizedBox(height: 10), readNotification]),
  'Empty Item Placeholder': blankScreen,
  'Standard Card': testStandardCard,
  'Standard Icon Card': testStandardIconCard,
  'Detail Card': testDetailCard,
  'Detail Icon Card': testDetailIconCard,
  'Detail Carousel Card': testDetailCarouselCard,
  'Complex Card': testComplexCard,
  'Complex Icon Card': testComplexIconCard,
  'Category Card': testCategoryCard,
  'Detail Carousel': testDetailCarousel
};

Map<String, Widget> aureusViews = {
  'Two Factor Authentication': TFAVerificationView(
      userPhoneNumber: 555555555,
      issueVerificationCode: () => {print('verification code issued!')},
      onUserSubmission: () => {print('user submitted code!')}),
  'Onboarding Demo View': OnboardingDemoView(
      toolItems: [demoTool1, demoTool2, demoTool3, demoTool4],
      exitPoint: OnboardingLandingView()),
  'Onboarding Information View': OnboardingInformationView(
    onboardingDetails: [onboardingInfo1, onboardingInfo2, onboardingInfo3],
  ),
  'Onboarding Landing View': OnboardingLandingView(),
  'Data Opt-in View': DataOptInView(permissionItems: dataPermissions),
  'Help Center View': HelpCenterView(helpCenter: helpCenterTest),
  'Safety Plan Opt In View': SafetyPlanOptInView(),
  'Safety Plan Options View': SafetyPlanOptionsView(),
  'Safety Plan Functionality View':
      SafetyPlanFunctionalityView(userSelectedOptions: [
    SafetyPlanOptions.deviceSandbox,
    SafetyPlanOptions.disableScreenshots,
    SafetyPlanOptions.disableNotifications,
  ]),
  'Sign In View': SignInView(
      onSignIn: fillerAction,
      onSignup: fillerAction,
      onResetInformation: fillerAction),
};

class AureusLandingPage extends StatefulWidget {
  final Image lightModeLandscapeBacking;
  final Image darkModeLandscapeBacking;
  final Image lightModeUIOverlay;
  final Image darkModeUIOverlay;
  final List<StandardIconButtonElement> actionButtons;

  const AureusLandingPage(
      {required this.lightModeLandscapeBacking,
      required this.darkModeLandscapeBacking,
      required this.lightModeUIOverlay,
      required this.darkModeUIOverlay,
      required this.actionButtons});

  @override
  _AureusLandingPageState createState() => _AureusLandingPageState();
}

class _AureusLandingPageState extends State<AureusLandingPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Image landingUIOverlayImage() {
    if (brightness() == Brightness.light) {
      return widget.lightModeUIOverlay;
    } else if (brightness() == Brightness.dark) {
      return widget.darkModeUIOverlay;
    }
    throw ('Unexpected platform brightness issue. Please check the implementation.');
  }

  Image landscapeBackgroundImage() {
    if (brightness() == Brightness.light) {
      return widget.lightModeLandscapeBacking;
    } else if (brightness() == Brightness.dark) {
      return widget.darkModeLandscapeBacking;
    }
    throw ('Unexpected platform brightness issue. Please check the implementation.');
  }

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
        "Access goes beyond usability for people with disabilities, and must work to include diverse financial, family, and cultural situations. \n\nAureus strives to achieve accessibility across every area we can, ensuring it can truly create software that reaches everyone.",
    "A vision of the future.":
        "Moving forward, Aureus will encompasses all Astra resources. \n\nAt launch, Aureus will be available to license to non-profit organizations and sofware to enable better accessibility of ethical design tools and software development within the industry."
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

  @override
  Widget build(BuildContext context) {
    Size screenSize = size.logicalScreenSize();
    double screenWidth = size.logicalWidth();
    double screenHeight = size.logicalHeight();

    Column buttonItems = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: widget.actionButtons,
    );

    Widget mobileLandingPageDemo() {
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

    Widget webLandingPageDemo() {
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

    Widget landingHeader() {
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

    Widget breakoutArea() {
      var featureCard1 = InkWell(
          onTap: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusElementsView(),
                    ),
                    (route) => false)
              },
          child: CategoryIconDetailCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Elements',
              cardBody:
                  "Buttons, dividers, labels that make up the first layer of building blocks for a view.",
              cardIcon: Assets.link));

      var featureCard2 = InkWell(
          onTap: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusComponentsView(),
                    ),
                    (route) => false)
              },
          child: CategoryIconDetailCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Components',
              cardBody:
                  "Emergency exit bars, alert controllers, notifications, message bubbles, and other major building blocks,",
              cardIcon: Assets.expand));

      var featureCard3 = InkWell(
          onTap: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusViewsView(),
                    ),
                    (route) => false)
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

    Widget footerCTA() {
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

    var mobileView = ContainerWrapperElement(
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
                  image: landscapeBackgroundImage().image,
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
                      padding:
                          EdgeInsets.all(size.widthOf(weight: sizingWeight.w1)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: size.heightOf(weight: sizingWeight.w1)),
                            informationHiearchy,
                            SizedBox(
                                height: size.heightOf(weight: sizingWeight.w0)),
                            landingUIOverlayImage(),
                            SizedBox(
                                height: size.heightOf(weight: sizingWeight.w0)),
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
        ]);

    var webView = ContainerWrapperElement(
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
                    image: landscapeBackgroundImage().image,
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
                        child: landingUIOverlayImage()),
                    SizedBox(
                        width: screenWidth / 3.5,
                        height:
                            screenHeight * (0.10 * widget.actionButtons.length),
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
        ]);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: size.isDesktopDisplay() ? mobileView : webView,
      takesFullWidth: true,
    );
  }
}

/*  ELEMENTS  */

class AureusElementsView extends StatefulWidget {
  const AureusElementsView();

  @override
  _AureusElementsViewState createState() => _AureusElementsViewState();
}

class _AureusElementsViewState extends State<AureusElementsView> {
  @override
  Widget build(BuildContext context) {
    List<String> testDescriptions = [];

    aureusElements.keys.forEach((element) {
      testDescriptions.add('Yee the haw');
    });

    var component = IteratingComponent(
        itemTitles: aureusElements.keys.toList(),
        itemWidgets: aureusElements.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          DividingHeaderElement(
              headerText: 'Elements',
              subheaderText:
                  "Singular 'base' widgets that can stand alone, or create components."),
          component
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}

/*  COMPONENTS  */

class AureusComponentsView extends StatefulWidget {
  const AureusComponentsView();

  @override
  _AureusComponentsViewState createState() => _AureusComponentsViewState();
}

class _AureusComponentsViewState extends State<AureusComponentsView> {
  @override
  Widget build(BuildContext context) {
    List<String> testDescriptions = [];

    aureusComponents.keys.forEach((element) {
      testDescriptions.add('Yee the haw');
    });

    var component = IteratingComponent(
        itemTitles: aureusComponents.keys.toList(),
        itemWidgets: aureusComponents.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          DividingHeaderElement(
              headerText: 'Components',
              subheaderText:
                  "Fleshed out items that are actionable parts of the UI."),
          component
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}

/*  VIEWS  */

class AureusViewsView extends StatefulWidget {
  const AureusViewsView();

  @override
  _AureusViewsViewState createState() => _AureusViewsViewState();
}

class _AureusViewsViewState extends State<AureusViewsView> {
  List<Widget> viewGridCards = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    setState(() {
      viewGridCards.clear();

      aureusViews.forEach((key, value) {
        viewGridCards.add(InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => value,
                ))
          },
          child: GridCardElement(
            decorationVariant: decorationPriority.standard,
            cardLabel: key,
            gridSize: Size(size.layoutItemWidth(1, screenSize) * 0.7,
                size.layoutItemHeight(1, screenSize)),
          ),
        ));
      });
    });

    Wrap viewsCardList = Wrap(
      alignment: WrapAlignment.start,
      runAlignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 15,
      children: viewGridCards,
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          DividingHeaderElement(
              headerText: 'Views',
              subheaderText:
                  "Views are templates that we re-use a lot throughout our resources. Interactions are disabled on these views, and are just for testing purposes."),
          Center(
            child: SizedBox(
              height: size.layoutItemHeight(1, screenSize) * 0.7,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: viewsCardList,
              ),
            ),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
