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
  'Splash Screen': SplashScreenView(
    onLaunch: () => {
      Navigator.push(context, MaterialPageRoute(builder: builder))
    },
  ),
  'Two Factor Authentication': TFAVerificationView(
      userPhoneNumber: 555555555,
      issueVerificationCode: () => {print('verification code issued!')},
      onUserSubmission: () => {print('user submitted code!')}),
  'Onboarding Demo View': OnboardingDemoView(toolItems: []),
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
  ], exitPoint: ,),
  'Sign In View': SignInView(
      onSignIn: fillerAction,
      onSignup: fillerAction,
      onResetInformation: fillerAction),
  'Tool Detail View': demoTool.navigationContainer.details,
  'Tool Next Steps View': demoTool.navigationContainer.nextSteps,
  'Tool Summary View': demoTool.navigationContainer.summary!
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
