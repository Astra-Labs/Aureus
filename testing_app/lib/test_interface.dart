import 'package:aureus/aureus.dart';
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
  'Alert Controller': alertController,
  'Content Warning': ContentWarningComponent(
      warningDescription:
          'This article contains mentions of sexual assult and depictions of trauma.',
      onContinue: () => {print('Yee  haw')}),
  'Cookie Banner': CookieBannerComponent(
      cookieMessage:
          'We show cookies to improve your experience. Please enable cookies. owo.',
      onCookieAccept: () => {print('cookies enabled uwu!')},
      onCookieDeny: () => {print('cookies disabled owo!')}),
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

/*Map<String, Widget> aureusToolTemplates = { 
  "" : , 

}*/

/*  ELEMENTS  */

class AureusElementsView extends StatefulWidget {
  const AureusElementsView();

  @override
  _AureusElementsViewState createState() => _AureusElementsViewState();
}

class _AureusElementsViewState extends State<AureusElementsView> {
  @override
  Widget build(BuildContext context) {
    var component = IteratingComponent(
        itemTitles: aureusElements.keys.toList(),
        itemWidgets: aureusElements.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Elements', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
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
    var component = IteratingComponent(
        itemTitles: aureusComponents.keys.toList(),
        itemWidgets: aureusComponents.values.toList());

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          HeadingOneText('Components', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          component
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}

/*  TOOLS  */

var testingTool = CoreTool(
    toolName: "Test Tool",
    toolDescription:
        "This is a tool meant to show you all of the card options available in Aureus, and to give you a code example of what building and implementing a tool looks like.",
    toolDetails: {
      "Android": Assets.android,
      "iOS": Assets.apple,
      "Web": Assets.window,
    },
    toolIcon: Assets.medicine,
    entryPoint: OnboardingLandingView(),
    toolCards: [
      DatePickerInputToolTemplate(
          templatePrompt: "I'm the DatePickerInputToolTemplate.",
          badgeIcon: Assets.add),
      DualColumnInputToolTemplate(
          prompt1: "Prompt 1",
          prompt2: "Prompt 2",
          templatePrompt: "I'm the DualColumnInputToolTemplate.",
          badgeIcon: Assets.add),
      PromptListUserInputToolTemplate(
          templatePrompt: "I'm the PromptListUserInputToolTemplate.",
          badgeIcon: Assets.add),
      SingleInputToolTemplate(
          templatePrompt: "I'm the SingleInputToolTemplate.",
          badgeIcon: Assets.add),
      SingleSliderToolTemplate(
          templatePrompt: "I'm the SingleSliderToolTemplate.",
          badgeIcon: Assets.add),
      TimePickerInputToolTemplate(
          templatePrompt: "I'm the TimePickerInputToolTemplate.",
          badgeIcon: Assets.add),
      TriInputToolTemplate(
          textPrompt1: "text prompt 1",
          textPrompt2: "text prompt 2",
          textPrompt3: "text prompt 3",
          templatePrompt: "I'm the TriInputToolTemplate.",
          badgeIcon: Assets.add),
      AdaptiveInputSelectionToolTemplate(),
      AdaptiveInputToolTemplate(
          templatePrompt: "I'm the AdaptiveInputToolTemplate.",
          badgeIcon: Assets.add),
      CameraInputToolTemplate(
          templatePrompt: "I'm the CameraInputToolTemplate.",
          badgeIcon: Assets.add),
      ColorSpectrumInputToolTemplate(
          templatePrompt: "I'm the ColorSpectrumInputToolTemplate.",
          badgeIcon: Assets.add),
      MicrophoneInputToolTemplate(
          templatePrompt: "I'm the MicrophoneInputToolTemplate.",
          badgeIcon: Assets.add),
      SensoryMapToolTemplate(
          templatePrompt: "I'm the SensoryMapToolTemplate.",
          badgeIcon: Assets.add),
      SketchToolTemplate(
          templatePrompt: "I'm the SketchToolTemplate.", badgeIcon: Assets.add),
      TimerToolTemplate(
          allotment: Duration(seconds: 10),
          onFinish: () => {
                notificationMaster.sendAlertNotificationRequest(
                    "Timer finished!", Assets.apple)
              },
          templatePrompt: "I'm the TimerToolTemplate.",
          badgeIcon: Assets.add),
      VideoInputToolTemplate(
          templatePrompt: "I'm the VideoInputToolTemplate.",
          badgeIcon: Assets.add),
      GridCardSelectToolTemplate(
          templatePrompt: "I'm the .",
          badgeIcon: Assets.add,
          cardItems: ["Card 1", "Card 2", "Card 3"]),
      ListViewButtonSelectToolTemplate(
          listItems: {
            "I'll show you a notification.": () => {
                  notificationMaster.sendAlertNotificationRequest(
                      "Notification sent!", Assets.camera)
                },
            "I'll bring up an alert controller.": () => {
                  notificationMaster.sendAlertControllerRequest(
                      AlertControllerObject.singleAction(
                          onCancellation: () {
                            notificationMaster.resetRequests();
                          },
                          alertTitle: "Alert Controller!",
                          alertBody: "Hi!",
                          alertIcon: Assets.android,
                          actions: [
                        AlertControllerAction(
                            actionName: "Dismiss",
                            actionSeverity:
                                AlertControllerActionSeverity.standard,
                            onSelection: () => {})
                      ]))
                }
          },
          templatePrompt: "I'm the ListViewButtonSelectToolTemplate.",
          badgeIcon: Assets.add),
      ListViewPickerSelectToolTemplate(
          pickerOptions: [
            "List Item 1",
            "List Item 2",
            "List Item 3",
            "List Item 4"
          ],
          templatePrompt: "I'm the ListViewPickerSelectToolTemplate.",
          badgeIcon: Assets.add),
      YesNoButtonSelectToolTemplate(
          templatePrompt: "I'm the YesNoButtonSelectToolTemplate.",
          badgeIcon: Assets.add)
    ],
    nextSteps: {
      "Show an action bar": () => {},
      "Send a notification": () => {
            notificationMaster.sendAlertNotificationRequest(
                "Notification sent!", Assets.camera)
          },
    });

class AureusToolsView extends StatefulWidget {
  const AureusToolsView();

  @override
  _AureusToolsViewState createState() => _AureusToolsViewState();
}

class _AureusToolsViewState extends State<AureusToolsView> {
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
            gridSize: Size(size.layoutItemWidth(1, screenSize),
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
          HeadingOneText('Tools', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          Center(
            child: SizedBox(
              height: size.layoutItemHeight(1, screenSize),
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
            gridSize: Size(size.layoutItemWidth(1, screenSize),
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
          HeadingOneText('Views', decorationPriority.standard),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          Center(
            child: SizedBox(
              height: size.layoutItemHeight(1, screenSize),
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
