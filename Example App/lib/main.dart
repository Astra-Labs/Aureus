import 'testingAppLibrary.dart';

void main() {
  var resourceBranding = AureusBranding(
      fontFamily: 'Exo',
      lightModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [
            palette.black(),
            Colors.black87,
          ]),
          accentColor: palette.black(),
          primaryImage: Image(image: AssetImage('assets/Light-Fluid.png')),
          secondaryImage: Image(image: AssetImage('assets/Light-Blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Light Mode.png'))),
      darkModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [
            Color.fromRGBO(211, 209, 223, 1.0),
            palette.white(),
          ]),
          accentColor: palette.white(),
          primaryImage: Image(image: AssetImage('assets/Dark-Fluid.png')),
          secondaryImage: Image(image: AssetImage('assets/Dark-Blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Dark Mode.png'))));

  var quickActionItems2 = [
    TabObject.forTextTabbing(
        onTabSelection: () => {
              notificationMaster.sendAlertNotificationRequest(
                  "Item 1 pressed on action bar.", Icons.ac_unit)
            },
        tabTitle: "Item 1",
        accessibilityHint: "Opens Item 1"),
    TabObject.forTextTabbing(
        tabTitle: "Item 2",
        onTabSelection: () => {
              notificationMaster.sendAlertNotificationRequest(
                  "Item 2 pressed on action bar.", Icons.ac_unit)
            },
        accessibilityHint: "Opens Item 2"),
    TabObject.forTextTabbing(
        tabTitle: "Item 3",
        onTabSelection: () => {
              notificationMaster.sendAlertNotificationRequest(
                  "Item 3 pressed on action bar.", Icons.ac_unit)
            },
        accessibilityHint: "Opens Item 3"),
  ];

  var resourceInformation = AureusInformation(
      name: 'Aureus',
      mission:
          "An open-source design system library for user safety critical applications.",
      safetySettings: Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          isActionBarDevEnabled: true,
          quickActionItems: quickActionItems2,
          eligiblePlanOptions: []),
      developerName: 'Astra Laboratories',
      developerEmail: 'hello@withastra.com',
      userSupportURL: 'https://www.withastra.org/',
      requestedDataPermissions: [],
      termsOfService: 'termsOfService',
      privacyPolicy: 'privacyPolicy');

  var resourceNavigation = AureusNavigationTree(
      splashScreen: SplashScreenView(onLaunch: () => {}),
      homeScreen: GenerationLandingPage(),
      settings: SettingsView(
        settingSections: [
          SettingSection(
            sectionTitle: "Section 1",
            sectionItems: [
              SettingItem.standardButton(
                  standardButton: StandardButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonTitle: "Open accessibility page",
                      buttonHint: "This button opens an accessibility page.",
                      buttonAction: () => {})),
              SettingItem.standardIconButton(
                  standardIconButton: StandardIconButtonElement(
                      decorationVariant: decorationPriority.standard,
                      buttonTitle: "Open accessibility page",
                      buttonIcon: Assets.alertmessage,
                      buttonHint: "This button opens an accessibility page.",
                      buttonAction: () => {})),
            ],
          ),
          SettingSection(
            sectionTitle: "Section 2",
            sectionItems: [
              SettingItem.standardSwitchCard(
                  standardSwitchCard: StandardSwitchCardElement(
                      cardLabel: "Switch Card",
                      onEnable: () => {
                            notificationMaster.sendAlertNotificationRequest(
                              "Switch card enabled.",
                              Assets.alertmessage,
                            )
                          },
                      onDisable: () => {
                            notificationMaster.sendAlertNotificationRequest(
                              "Switch card disabled.",
                              Assets.alertmessage,
                            )
                          })),
              SettingItem.standardSwitchCard(
                  standardSwitchCard: StandardSwitchCardElement(
                      cardLabel: "Switch Card",
                      onEnable: () => {
                            notificationMaster.sendAlertNotificationRequest(
                              "Switch card enabled.",
                              Assets.alertmessage,
                            )
                          },
                      onDisable: () => {
                            notificationMaster.sendAlertNotificationRequest(
                              "Switch card disabled.",
                              Assets.alertmessage,
                            )
                          })),
            ],
          ),
        ],
      ),
      onboardingLanding: OnboardingLandingView(),
      onboardingDemo: OnboardingDemoView(
        toolItems: [],
      ),
      onboardingInformation: OnboardingInformationView(onboardingDetails: [
        onboardingInfo1,
        onboardingInfo2,
        onboardingInfo3
      ]),
      termsOfService: ArticleViewElement(
          title: "Terms of Service", subheader: "subheader", body: "body"),
      privacyPolicy: ArticleViewElement(
          title: "Privacy Policy", subheader: "subheader", body: "body"),
      signIn: SignInView(
        onSignIn: () => {},
        onSignup: () => {},
        onResetInformation: () => {},
        usernameTextController: textEditor,
        passwordTextController: textEditor,
      ),
      signUp: OnboardingLandingView(),
      helpCenter: HelpCenterView(helpCenter: helpCenterTest),
      contactSupport: HelpCenterView(helpCenter: helpCenterTest));

  packageVariables = AureusResource(
      resourceBranding: resourceBranding,
      resourceInformation: resourceInformation,
      resourceNavigation: resourceNavigation);

  runApp(AureusTestApp());
}

class AureusTestApp extends StatelessWidget {
  void precacheImages(List<String> assets, BuildContext context) {
    assets.forEach((elementName) {
      precacheImage(AssetImage(elementName), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    var darkImageCache = [
      "assets/Dark-Fluid.png",
      "assets/Dark-Blur.png",
      "assets/Icon - Dark Mode.png",
      "assets/Dark Mode - Preview.png",
      "assets/Dark-Mode-Demo.png",
      "assets/Import-Sample-Dark-Mode.png",
      "assets/Landing-Example-Dark-Mode.png",
    ];

    var lightImageCache = [
      "assets/Light-Fluid.png",
      "assets/Light-Blur.png",
      "assets/Icon - Light Mode.png",
      "assets/Light Mode - Preview.png",
      "assets/Light-Mode-Demo.png",
      "assets/Import-Sample-Light-Mode.png",
      "assets/Landing-Example-Light-Mode.png",
    ];

    precacheImages(
        palette.brightness() == Brightness.light
            ? lightImageCache
            : darkImageCache,
        context);

    return MaterialApp(
        home: LandingPage(),
        theme: new ThemeData(scaffoldBackgroundColor: coloration.sameColor()));
  }
}

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.
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
    List<StandardIconButtonElement> buttonItems = [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: 'Explore Aureus.',
          buttonHint: "Opens the exploration view for Aureus.",
          buttonIcon: Assets.expand,
          buttonAction: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ExplorationView(),
                    ))
              }),
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonHint: "Opens Astra's Github Repository for Aureus",
          buttonTitle: "Find on Github.",
          buttonIcon: Assets.window,
          buttonAction: () =>
              {launchInBrowser('https://github.com/Astra-Labs/Aureus')}),
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonHint: "Download on pub.dev",
          buttonTitle: "Download on pub.dev",
          buttonIcon: Assets.window,
          buttonAction: () =>
              {launchInBrowser('https://pub.dev/packages/aureus/install')}),
    ];

    return LandingPageView(
      lightModeLandscapeBacking: Image.network(
          'https://images.unsplash.com/photo-1526934709557-35f3777499c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'),
      darkModeLandscapeBacking: Image.network(
          'https://images.unsplash.com/photo-1567971952425-873b4b46e01f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1674&q=80'),
      lightModeUIOverlay:
          Image(image: AssetImage('assets/Light Mode - Preview.png')),
      darkModeUIOverlay:
          Image(image: AssetImage('assets/Dark Mode - Preview.png')),
      actionButtons: buttonItems,
      onGiveFeedback: () => {
        launchInBrowser('https://github.com/Astra-Labs/Aureus/issues'),
      },
    );
  }
}
