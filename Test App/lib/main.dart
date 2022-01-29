import 'package:aureus/aureus.dart';
import 'package:test_app/test_interface.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  packageVariables = Aureus(
      missionTagline:
          "An open-source design system for software focused on safety, privacy, and accessibility.",
      prodColor: Color.fromRGBO(255, 255, 255, 1.0),
      prodName: 'Aureus',
      safetyObject: Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          eligiblePlanOptions: []),
      darkFluidImage: Image(image: AssetImage('assets/Dark-Fluid.png')),
      lightFluidImage: Image(image: AssetImage('assets/Light-Fluid.png')),
      darkBlurImage: Image(image: AssetImage('assets/Dark-Blur.png')),
      lightBlurImage: Image(image: AssetImage('assets/Light-Blur.png')),
      lightLogo: Image(image: AssetImage('assets/Icon - Dark Mode.png')),
      darkLogo: Image(image: AssetImage('assets/Icon - Light Mode.png')));

  runApp(AureusTestApp());
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
    } else if (brightness() == Brightness.light) {
      backgroundColor = white();
    }

    return MaterialApp(
        home: LandingPage(),
        theme: new ThemeData(scaffoldBackgroundColor: backgroundColor));
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

    return Scaffold(
      body: AureusLandingPage(
          lightModeLandscapeBacking: Image.network(
              'https://images.unsplash.com/photo-1526934709557-35f3777499c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'),
          darkModeLandscapeBacking: Image.network(
              'https://images.unsplash.com/photo-1475274047050-1d0c0975c63e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2072&q=80'),
          lightModeUIOverlay:
              Image(image: AssetImage('assets/Light Mode - Preview.png')),
          darkModeUIOverlay:
              Image(image: AssetImage('assets/Dark Mode - Preview.png')),
          actionButtons: buttonItems),
    );
  }
}
