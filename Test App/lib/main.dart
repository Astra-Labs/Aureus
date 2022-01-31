import 'package:aureus/aureus.dart';
import 'package:test_app/test_interface.dart';
import 'package:url_launcher/url_launcher.dart';
import 'landing_interface.dart';

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
