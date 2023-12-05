part of AureusTestingApp;

var views = exampleAppViews();

Map<String, List<viewMetaData>> aureusViewsCategory = {
  "Onboarding": [
    viewMetaData(
      viewTitle: "Onboarding Landing",
      view: views.onboardingLandingView,
    ),
    viewMetaData(
        viewTitle: "Onboarding Information",
        view: views.onboardingInformationView),
    viewMetaData(
      viewTitle: "Onboarding Demo",
      view: views.onboardingDemoView,
    ),
    viewMetaData(
      viewTitle: "Onboarding Simp Ask",
      view: views.simpShareView,
    ),
  ],
  "Landing": [
    viewMetaData(
      viewTitle: "Sign In",
      view: views.signInView,
    ),
    viewMetaData(
      viewTitle: "Splash Screen",
      view: views.splashScreenView,
    ),
    viewMetaData(
      viewTitle: "Landing Page",
      view: views.onboardingLandingView,
    ),
  ],
  "Safety Plan": [
    viewMetaData(
      viewTitle: "Safety Plan Opt In",
      view: views.safetyPlanOptInView,
    ),
    viewMetaData(
      viewTitle: "Safety Plan Options",
      view: views.safetyPlanOptionsView,
    ),
    viewMetaData(
      viewTitle: "Safety Plan Audit",
      view: views.safetyPlanAuditView,
    ),
    viewMetaData(
      viewTitle: "Safety Plan Functionality",
      view: views.safetyPlanFunctionalityView,
    ),
    viewMetaData(
      viewTitle: "Safety Plan Settings",
      view: views.safetyPlanSettingsView,
    ),
  ],
  "Utilities": [
    viewMetaData(
      viewTitle: "Two Factor Authentication",
      view: views.tfaVerificationView,
    ),
    viewMetaData(
      viewTitle: "Settings",
      view: views.settingsView,
    ),
    viewMetaData(
      viewTitle: "Passcode",
      view: views.passwordView,
    ),
    viewMetaData(
      viewTitle: "Data Consent Opt-in",
      view: views.dataConsentView,
    ),
  ],
  "Info Hierarchy": [
    viewMetaData(
      viewTitle: "Checkbox Article View",
      view: views.checkboxArticleView,
    ),
    viewMetaData(
      viewTitle: "Help Center",
      view: views.helpCenterView,
    ),
  ],
  /*"Misc": [
    viewMetaData(
        viewTitle: "Poetry Gradient View", view: views.poetryGradientView),
  ]*/
};

class viewMetaData {
  final String viewTitle;
  final Widget view;

  const viewMetaData({required this.viewTitle, required this.view});
}

class exampleAppViews {
  // ONBOARDING --------------------------------

  var onboardingLandingView = OnboardingLandingView(
    actionButtons: [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Hi!",
          buttonIcon: Icons.abc,
          buttonHint: "Yoot.",
          buttonAction: () => {}),
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Yo!",
          buttonIcon: Icons.abc,
          buttonHint: "Yeet.",
          buttonAction: () => {}),
    ],
  );
  var onboardingDemoView = OnboardingDemoView(toolItems: []);
  var onboardingInformationView = OnboardingInformationView(
    onboardingDetails: [onboardingInfo1, onboardingInfo2, onboardingInfo3],
  );

  // LANDING --------------------------------
  var signInView = SignInView(
    onSignIn: fillerAction,
    onSignup: fillerAction,
    onResetInformation: fillerAction,
    usernameTextController: textEditor,
    passwordTextController: textEditor,
  );

  var splashScreenView = SplashScreenView(
    onLaunch: () => {},
  );

  // SAFETY PLAN --------------------------------

  var safetyPlanOptInView =
      SafetyPlanOptInView(exitPoint: AureusComponentsView());

  var safetyPlanOptionsView =
      SafetyPlanOptionsView(exitPoint: AureusComponentsView());

  var safetyPlanFunctionalityView =
      SafetyPlanFunctionalityView(userSelectedOptions: [
    SafetyPlanOptions.disableScreenshots,
    SafetyPlanOptions.disableNotifications,
  ], exitPoint: AureusComponentsView());

  var safetyPlanAuditView = SafetyPlanLogInAuditView();

  var safetyPlanSettingsView = SafetyPlanSettingsView();

  // UTILITIES --------------------------------

  var tfaVerificationView = TFAVerificationView(
    userPhoneNumber: [5, 5, 5, 5, 5, 5, 5, 5, 5],
    issueVerificationCode: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Issed a verification code ;-)", Icons.ac_unit)
    },
    onUserSubmission: () => {
      notificationMaster.sendAlertNotificationRequest(
          "User submitted the code.", Icons.ac_unit)
    },
    textEditingController: textEditor,
  );

  var settingsView = SettingsView(
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
  );

  var passwordView = PasscodeView(
      onCorrectPasscode: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Passcode correct!", Assets.lock)
          },
      passcode: [1, 2, 3, 4]);

  var dataConsentView = DataOptInView(onFinish: () {});

  // INFO HIERARCHY --------------------------------

  var checkboxArticleView = CheckboxArticleView(
    articleTitle: "Lorem",
    articleSubheader: "Ipsum loremt",
    articleBody:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    checkboxDescription: "sed do eiusmod",
    onFinish: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Article agreed to!", Assets.yes)
    },
  );

  var helpCenterView = HelpCenterView(helpCenter: helpCenterTest);

  // MISC --------------------------------

  var poetryGradientView = PoetryGradientView(poetryArray: [
    "",
    "",
    "",
    "",
  ]);

  var simpShareView = OnboardingSimpSharingView(
    simpMessage: "Hi, will you simp for us by sharing this online?",
    onSimpAgree: () => {
      notificationMaster.sendAlertNotificationRequest(
          'Thank you for agreeing!', Assets.back),
    },
    onSimpDeny: () => {
      notificationMaster.sendAlertNotificationRequest(
          'Why didnt u agree :-(', Assets.back),
    },
  );
}

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
