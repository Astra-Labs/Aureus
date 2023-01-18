part of AureusTestingApp;

Map<String, Widget> aureusViews = {
  "Passcode": PasscodeView(
      onCorrectPasscode: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Passcode correct!", Assets.lock)
          },
      passcode: [1, 2, 3, 4]),
  "Settings": SettingsView(),
  "Checkbox Article View": CheckboxArticleView(
      articleTitle: "Lorem",
      articleSubheader: "Ipsum loremt",
      articleBody:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      checkboxDescription: "sed do eiusmod",
      onFinish: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Article agreed to!", Assets.yes)
          }),
  'Splash Screen': SplashScreenView(
    onLaunch: () => {},
  ),
  'Two Factor Authentication': TFAVerificationView(
    userPhoneNumber: 555555555,
    issueVerificationCode: () => {print('verification code issued!')},
    onUserSubmission: () => {print('user submitted code!')},
    textEditingController: textEditor,
  ),
  'Onboarding Demo View': OnboardingDemoView(toolItems: []),
  'Onboarding Information View': OnboardingInformationView(
    onboardingDetails: [onboardingInfo1, onboardingInfo2, onboardingInfo3],
  ),
  'Onboarding Landing View': OnboardingLandingView(),
  'Data Opt-in View': DataOptInView(onFinish: () {}),
  'Help Center View': HelpCenterView(helpCenter: helpCenterTest),
  'Safety Plan Opt In View': SafetyPlanOptInView(exitPoint: AureusViewsView()),
  'Safety Plan Options View':
      SafetyPlanOptionsView(exitPoint: AureusViewsView()),
  'Safety Plan Functionality View':
      SafetyPlanFunctionalityView(userSelectedOptions: [
    SafetyPlanOptions.deviceSandbox,
    SafetyPlanOptions.disableScreenshots,
    SafetyPlanOptions.disableNotifications,
  ], exitPoint: AureusViewsView()),
  'Sign In View': SignInView(
    onSignIn: fillerAction,
    onSignup: fillerAction,
    onResetInformation: fillerAction,
    usernameTextController: textEditor,
    passwordTextController: textEditor,
  ),
};

/* VIEWS */

/* Test Builder */
ContainerWrapperElement landing1 = ContainerWrapperElement(
    containerVariant: wrapperVariants.stackScroll, children: [testingCards]);

ContainerWrapperElement landing2 = ContainerWrapperElement(
    containerVariant: wrapperVariants.fullScreen,
    children: [
      NotificationComponent(
          notificationSubCategory: 'Hi!',
          notificationReceived: DateTime.now(),
          notificationHeader: 'Kill me now.',
          notificationBody: 'Let me out of this codebase cursed body.',
          hasNotificationBeenRead: true),
      NotificationComponent(
          notificationSubCategory: 'SCREM',
          notificationReceived: DateTime.now(),
          notificationHeader: 'If there is a god.',
          notificationBody: 'he is not on my side..',
          hasNotificationBeenRead: false),
      NotificationComponent(
          notificationSubCategory: 'pls',
          notificationReceived: DateTime.now(),
          notificationHeader: 'salt chip.',
          notificationBody:
              'salt ,, vinegar chip ,, provide ,, provide me salt ',
          hasNotificationBeenRead: false)
    ]);

var standardContainerView = ContainerView(
    decorationVariant: decorationPriority.standard, builder: landing1);

var importantContainerView = ContainerView(
    decorationVariant: decorationPriority.important, builder: landing1);

TabObject tab1 = TabObject.forIconTabbing(
    tabIcon: fillerIcon1,
    tabPriority: decorationPriority.standard,
    onTabSelection: () => {},
    accessibilityHint: 'Lavender');

TabObject tab2 = TabObject.forIconTabbing(
    tabIcon: fillerIcon2,
    tabPriority: decorationPriority.standard,
    onTabSelection: () => {},
    accessibilityHint: 'Melt');

TabObject tab3 = TabObject.forIconTabbing(
    tabIcon: fillerIcon3,
    tabPriority: decorationPriority.standard,
    onTabSelection: () => {},
    accessibilityHint: 'Ice');

TabObject tab4 = TabObject.forIconTabbing(
    tabIcon: fillerIcon4,
    tabPriority: decorationPriority.standard,
    onTabSelection: () => {},
    accessibilityHint: 'Steel');
