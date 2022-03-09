import 'package:aureus/aureus.dart';
import 'package:test_app/interface_items.dart';
import 'package:test_app/test_interface.dart';
import 'package:test_app/view_items.dart';
import 'package:url_launcher/url_launcher.dart';
import 'landing_interface.dart';

void main() {
  var resourceBranding = AureusBranding(
      fontFamily: 'Exo',
      lightModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [carbon(), black()]),
          accentColor: lavender(),
          primaryImage: Image(image: AssetImage('assets/Light-Fluid.png')),
          secondaryImage: Image(image: AssetImage('assets/Light-Blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Light Mode.png'))),
      darkModeStyle: AureusStylization(
          contrastGradient: LinearGradient(colors: [melt(), frost()]),
          accentColor: lavender(),
          primaryImage: Image(image: AssetImage('assets/Dark-Fluid.png')),
          secondaryImage: Image(image: AssetImage('assets/Dark-Blur.png')),
          logo: Image(image: AssetImage('assets/Icon - Dark Mode.png'))));

  var resourceInformation = AureusInformation(
      name: 'Aureus',
      mission:
          "An open-source design system for software focused on safety, privacy, and accessibility.",
      safetySettings: Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          eligiblePlanOptions: []),
      developerName: 'Astra Laboratories',
      developerEmail: 'hello@withastra.com',
      userSupportURL: 'https://www.withastra.org/',
      requestedDataPermissions: [],
      termsOfService: 'termsOfService',
      privacyPolicy: 'privacyPolicy');

  var resourceNavigation = AureusNavigationTree(
      SplashScreenView(onLaunch: () => {}),
      landing1,
      SettingsView(),
      OnboardingLandingView(),
      OnboardingDemoView(toolItems: [], exitPoint: OnboardingLandingView()),
      OnboardingInformationView(
        onboardingDetails: [onboardingInfo1, onboardingInfo2, onboardingInfo3],
      ),
      landing1,
      landing1,
      HelpCenterView(helpCenter: helpCenterTest),
      landing1);

  packageVariables = AureusResource(
      resourceBranding: resourceBranding,
      resourceInformation: resourceInformation,
      resourceNavigation: resourceNavigation);

  runApp(AureusTestApp());
}

class TestingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var loadingCircle = LoadingCircleElement();

    var containerViewHolder = ContainerWrapperElement(
        children: [loadingCircle],
        containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: containerViewHolder);
  }
}

Future<void> launchInBrowser(String url) async {
  if (!await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
  )) {
    throw 'Could not launch $url';
  }
}

class AureusTestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = lavender();

    if (brightness() == Brightness.dark) {
      backgroundColor = black();
      precacheImage(AssetImage('assets/Dark-Fluid.png'), context);
      precacheImage(AssetImage('assets/Dark-Blur.png'), context);
      precacheImage(AssetImage('assets/Icon - Dark Mode.png'), context);
      precacheImage(AssetImage('assets/Dark Mode - Preview.png'), context);
      precacheImage(AssetImage('assets/Dark-Mode-Demo.png'), context);
      precacheImage(AssetImage('assets/Import-Sample-Dark-Mode.png'), context);
      precacheImage(
          AssetImage('assets/Landing-Example-Dark-Mode.png'), context);
    } else if (brightness() == Brightness.light) {
      backgroundColor = white();

      precacheImage(AssetImage('assets/Light-Fluid.png'), context);
      precacheImage(AssetImage('assets/Light-Blur.png'), context);
      precacheImage(AssetImage('assets/Icon - Light Mode.png'), context);
      precacheImage(AssetImage('assets/Light Mode - Preview.png'), context);
      precacheImage(AssetImage('assets/Light-Mode-Demo.png'), context);
      precacheImage(AssetImage('assets/Import-Sample-Light-Mode.png'), context);
      precacheImage(
          AssetImage('assets/Landing-Example-Light-Mode.png'), context);
    }

    return MaterialApp(
        home: ToolCardTesting(),
        theme: new ThemeData(scaffoldBackgroundColor: backgroundColor));
  }
}

class ToolCardTesting extends StatefulWidget {
  const ToolCardTesting();
  @override
  _ToolCardTestingState createState() => _ToolCardTestingState();
}

class _ToolCardTestingState extends State<ToolCardTesting> {
  @override
  Widget build(BuildContext context) {
    var activeBase = BaseCardToolTemplate(
        isActive: true,
        cardIcon: Assets.babycarriage,
        toolPrompt: 'Active Base Card',
        toolChildren: [
          IconBadge(
              badgeIcon: Assets.alertmessage,
              badgePriority: decorationPriority.important)
        ]);

    var inactiveBase = BaseCardToolTemplate(
        isActive: false,
        cardIcon: Assets.babycarriage,
        toolPrompt: 'Inactive Base Card',
        toolChildren: [
          IconBadge(
              badgeIcon: Assets.alertmessage,
              badgePriority: decorationPriority.important),
        ]);

    var yesNoTool = YesNoButtonSelectToolTemplate();
    var yesNoActive = yesNoTool.returnActiveToolCard();
    var yesNoInactive = yesNoTool.returnTemplateSummary();

    var singleInputTool = SingleInputToolTemplate();
    var singleInputActive = singleInputTool.returnActiveToolCard();
    var singleInputInactive = singleInputTool.returnTemplateSummary();

    var dualColumnTool =
        DualColumnInputToolTemplate(prompt1: 'Pros', prompt2: 'Cons');
    var dualColumnInputActive = dualColumnTool.returnActiveToolCard();
    var dualColumnInputInactive = dualColumnTool.returnTemplateSummary();

    var triInputTool = TriInputToolTemplate(
        textPrompt1: 'Idea #1', textPrompt2: 'Idea #2', textPrompt3: 'Idea #3');
    var triInputActive = triInputTool.returnActiveToolCard();
    var triInputInactive = triInputTool.returnTemplateSummary();

    var sliderTool = SingleSliderToolTemplate();
    var sliderActive = sliderTool.returnActiveToolCard();
    var sliderInactive = sliderTool.returnTemplateSummary();

    var listPickerTool = ListViewPickerSelectToolTemplate(pickerOptions: [
      'Iced Caramel Macchiato',
      'Iced Vanilla Latte',
      'Iced Mint Mocha',
      'Iced Chai Tea',
      'Iced Matcha Green Tea'
    ]);
    var listPickerActive = listPickerTool.returnActiveToolCard();
    var listPickerInactive = listPickerTool.returnTemplateSummary();

    var listButtonPicker = ListViewButtonSelectToolTemplate(listItems: {
      'Print hi': () => {print('hi')},
      'Print hey': () => {print('hey')},
      'Print why': () => {print('why')},
      'Print money': () => {print('money')},
    });
    var listButtonPickerActive = listButtonPicker.returnActiveToolCard();
    var listButtonPickerInactive = listButtonPicker.returnTemplateSummary();

    var wrapper = ContainerWrapperElement(
        children: [listButtonPickerActive, listButtonPickerInactive],
        containerVariant: wrapperVariants.stackScroll);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: wrapper);
  }
}

class LandingPage extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    List<StandardIconButtonElement> buttonItems = [
      StandardIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonTitle: "Find on Github.",
          buttonIcon: Assets.window,
          buttonAction: () =>
              {launchInBrowser('https://github.com/Astra-Labs/Aureus')}),
    ];

    Image landingUIOverlayImage() {
      if (brightness() == Brightness.light) {
        return Image(image: AssetImage('assets/Light Mode - Preview.png'));
      } else if (brightness() == Brightness.dark) {
        return Image(image: AssetImage('assets/Dark Mode - Preview.png'));
      }
      throw ('Unexpected platform brightness issue. Please check the implementation.');
    }

    Image landscapeBackgroundImage() {
      if (brightness() == Brightness.light) {
        return Image.network(
            'https://images.unsplash.com/photo-1526934709557-35f3777499c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80');
      } else if (brightness() == Brightness.dark) {
        return Image.network(
            'https://images.unsplash.com/photo-1520034475321-cbe63696469a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80');
      }
      throw ('Unexpected platform brightness issue. Please check the implementation.');
    }

    return Scaffold(
        body: size.isDesktopDisplay()
            ? mobileLandingView(
                landscapeBacking: landscapeBackgroundImage(),
                uiOverlay: landingUIOverlayImage(),
                actionButtons: buttonItems)
            : webLandingView(
                landscapeBacking: landscapeBackgroundImage(),
                uiOverlay: landingUIOverlayImage(),
                actionButtons: buttonItems));
  }
}
