import 'package:aureus/aureus.dart';
import 'package:test_app/text_items.dart';
import 'interface_items.dart';
import 'view_items.dart';

Map<String, Widget> aureusElements = {
  'Typography': textTestListView,
  'Tab Subheader': tabSubheader,
  'Divider': divider,
  'Slider': slider,
  'Timer': timer,
  'Single Input': singleInput,
  'Multiple Input': multiInput,
  'Standard Full Width Button': standardFullWidthButton,
  'Important Full Width Button': importantFullWidthButton,
  'Inactive Full Width Button': inactiveFullWidthButton,
  'Standard Primary Icon Button': standardPrimaryIconButton,
  'Important Primary Icon Button': importantPrimaryIconButton,
  'Inactive Primary Icon Button': inactivePrimaryIconButton,
  'Standard Secondary Icon Button': standardSecondaryIconButton,
  'Important Secondary Icon Button': importantSecondaryIconButton,
  'Inactive Secondary Icon Button': inactiveSecondaryIconButton,
  'Standard Smol Button': standardSmolButton,
  'Important Smol Button': importantSmolButton,
  'Inactive Smol Button': inactiveSmolButton,
  'Standard Standard Button': standardStandardButton,
  'Important Standard Button': importantStandardButton,
  'Inactive Standard Button': inactiveStandardButton,
};

Map<String, Widget> aureusComponents = {
  'Receiver Message Bubble': receiverMessageBubble,
  'Sender Message Bubble': senderMessageBubble,
  'Unread Notification': unreadNotification,
  'Read Notification': readNotification,
  'Search Bar': searchBar,
  'Send Field': sendField,
  'Blank Screen': blankScreen,
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
  'Safety Plan Confirmation View': SafetyPlanConfirmationView(),
  'Safety Plan Functionality View':
      SafetyPlanFunctionalityView(userSelectedOptions: [
    SafetyPlanOptions.deviceSandbox,
    SafetyPlanOptions.disableScreenshots,
    SafetyPlanOptions.disableNotifications,
    SafetyPlanOptions.failedPasscodeDataDeletion
  ]),
  'Sign In View': SignInView(
      onSignIn: fillerAction,
      onSignup: fillerAction,
      onResetInformation: fillerAction),
};

/*  FOUNDATION  */

class AureusLandingPage extends StatefulWidget {
  const AureusLandingPage();

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

  @override
  Widget build(BuildContext context) {
    Widget landingHeader() {
      var scalingTab = TabObject.forIconTabbing(
          tabIcon: Assets.add,
          tabPriority: decorationPriority.standard,
          accessibilityHint: 'Scalability');

      var safetyTab = TabObject.forIconTabbing(
          tabIcon: Assets.add,
          tabPriority: decorationPriority.standard,
          accessibilityHint: 'Safety');

      var privacyTab = TabObject.forIconTabbing(
          tabIcon: Assets.add,
          tabPriority: decorationPriority.standard,
          accessibilityHint: 'Privacy');

      var accessibilityTab = TabObject.forIconTabbing(
          tabIcon: Assets.add,
          tabPriority: decorationPriority.standard,
          accessibilityHint: 'Accessibility');

      var futureTab = TabObject.forIconTabbing(
          tabIcon: Assets.add,
          tabPriority: decorationPriority.standard,
          accessibilityHint: 'Our future');

      List<TabObject> unsanitizedTabs = [
        scalingTab,
        safetyTab,
        privacyTab,
        accessibilityTab,
        futureTab
      ];

      List<TabObject> tabItems = [];

      Map<String, String> boxInformation = {
        "Scalability.": "",
        "Safety.": "",
        "Privacy.": "",
        "Accessibility.": "",
        "Vision of the future.": ""
      };

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
          width: size.layoutItemWidth(1, size.logicalScreenSize),
          height: size.layoutItemHeight(1, size.logicalScreenSize),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  Container(
                      height: 65.0,
                      width: 65.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: coloration.resourceLogo().image,
                        fit: BoxFit.cover,
                      ))),
                  SizedBox(height: 15.0),
                  HeadingTwoText("Meet Aureus.", decorationPriority.standard),
                  Spacer(),
                ],
              ),
              SizedBox(
                width: size.layoutItemWidth(1, size.logicalScreenSize) * 0.60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Spacer(),
                    iconTabBar,
                    SizedBox(height: 10.0),
                    SizedBox(
                      width: size.layoutItemWidth(1, size.logicalScreenSize) *
                          0.60,
                      height: size.layoutItemHeight(1, size.logicalScreenSize) *
                          0.75,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: CardBackingDecoration(
                                priority: decorationPriority.standard)
                            .buildBacking(),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Spacer(),
                                TagOneText(currentItem.key,
                                    decorationPriority.standard),
                                BodyOneText(currentItem.value,
                                    decorationPriority.standard),
                                Spacer(),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SecondaryIconButtonElement(
                                        decorationVariant: (_selectedIndex == 0)
                                            ? decorationPriority.inactive
                                            : decorationPriority.important,
                                        buttonIcon: Assets.back,
                                        buttonTooltip: 'Previous Item',
                                        buttonAction: () => {
                                              _onItemTapped(_selectedIndex -= 1)
                                            }),
                                    SecondaryIconButtonElement(
                                        decorationVariant: (_selectedIndex >
                                                (boxInformation.length - 2))
                                            ? decorationPriority.inactive
                                            : decorationPriority.important,
                                        buttonIcon: Assets.next,
                                        buttonTooltip: 'Next Item',
                                        buttonAction: () => {
                                              _onItemTapped(_selectedIndex += 1)
                                            })
                                  ],
                                )
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ));
    }

    Widget featureDescription() {
      var featureCard1 = CategoryIconDetailCardElement(
          decorationVariant: decorationPriority.standard,
          cardLabel: 'Safety Plan',
          cardBody:
              "A built-in safety functionality that modifies software functionality based on users' safety needs.",
          cardIcon: Assets.add);

      var featureCard2 = CategoryIconDetailCardElement(
          decorationVariant: decorationPriority.standard,
          cardLabel: 'Responsiveness',
          cardBody:
              "Dynamically resizing text, layout, colors, and software variables to align with our product principles.",
          cardIcon: Assets.add);

      var featureCard3 = CategoryIconDetailCardElement(
          decorationVariant: decorationPriority.standard,
          cardLabel: 'Access',
          cardBody:
              "Built for use on iOS, Android, and beyond - Aureus enables access to develop software undefined by platform.",
          cardIcon: Assets.add);

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
        width: size.layoutItemWidth(1, size.logicalScreenSize),
        height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            DividerElement(),
            Spacer(),
            TabSubheaderElement(title: 'What Aureus enables.'),
            Spacer(),
            SizedBox(
              width: size.layoutItemWidth(1, size.logicalScreenSize),
              height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.5,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.min,
                      children: cardItems)),
            )
          ],
        ),
      );
    }

    Widget breakoutArea() {
      var featureCard1 = InkWell(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusFoundationView(),
                    ))
              },
          child: DetailBadgeCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Foundation',
              cardBody:
                  "The global variables that make up the basis of Aureus.",
              cardIcon: Assets.add));

      var featureCard2 = InkWell(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusElementsView(),
                    ))
              },
          child: DetailBadgeCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Elements',
              cardBody: "The first layer of building blocks for the UI items.",
              cardIcon: Assets.add));

      var featureCard3 = InkWell(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusComponentsView(),
                    ))
              },
          child: DetailBadgeCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Components',
              cardBody: "UI Components that make up parts of a view.",
              cardIcon: Assets.add));

      var featureCard4 = InkWell(
          onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AureusViewsView(),
                    ))
              },
          child: DetailBadgeCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: 'Views',
              cardBody:
                  "Re-usable view templates for data consent, safety, onboarding, and more. ",
              cardIcon: Assets.add));

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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: featureCard4,
        )
      ];

      return SizedBox(
          width: size.layoutItemWidth(1, size.logicalScreenSize),
          height: size.layoutItemHeight(1, size.logicalScreenSize) * 1,
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
                width: size.layoutItemWidth(1, size.logicalScreenSize),
                height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.8,
                child: FloatingContainerElement(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    decoration: LayerBackingDecoration(
                            priority: decorationPriority.inactive)
                        .buildBacking(),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            children: cardItems)),
                  ),
                ),
              )
            ],
          ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          landingHeader(),
          featureDescription(),
          breakoutArea(),
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}

class AureusFoundationView extends StatefulWidget {
  const AureusFoundationView();

  @override
  _AureusFoundationViewState createState() => _AureusFoundationViewState();
}

class _AureusFoundationViewState extends State<AureusFoundationView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          DividingHeaderElement(
              headerText: "Foundation",
              subheaderText:
                  'Foundation is the colors, text styles, accessibility & safety functionality, and everything in between that makes up the basis of Aureus.')
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
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
    ListView elementsList = ListView.builder(
        physics: ClampingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
        shrinkWrap: true,
        itemCount: aureusElements.entries.length,
        itemBuilder: (BuildContext context, int index) {
          var itemName = aureusElements.keys.elementAt(index);
          var itemWidget = aureusElements.values.elementAt(index);

          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                  child: BodyOneText(itemName, decorationPriority.standard),
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: CardBackingDecoration(
                            priority: decorationPriority.inactive)
                        .buildBacking(),
                    child: itemWidget)
              ]);
        });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          DividingHeaderElement(
              headerText: 'Elements',
              subheaderText:
                  "Singular 'base' widgets that can stand alone, or create components. These are the first layer of building blocks for the UI items."),
          elementsList
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
    ListView componentsList = ListView.builder(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      itemCount: aureusComponents.entries.length,
      itemBuilder: (BuildContext context, int index) {
        var itemName = aureusComponents.keys.elementAt(index);
        var itemWidget = aureusComponents.values.elementAt(index);

        return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 20.0),
                child: BodyOneText(itemName, decorationPriority.standard),
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: itemWidget)
            ]);
      },
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          DividingHeaderElement(
              headerText: 'Components',
              subheaderText:
                  "Singular 'base' widgets that can stand alone, or create components. These are the first layer of building blocks for a view."),
          componentsList
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
            gridSize: Size(size.layoutItemWidth(1, size.logicalScreenSize),
                size.layoutItemHeight(1, size.logicalScreenSize)),
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
          SizedBox(
            height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.7,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: viewsCardList,
            ),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
