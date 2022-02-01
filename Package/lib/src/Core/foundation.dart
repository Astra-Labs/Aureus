import 'package:aureus/aureus.dart';
import 'package:flutter/scheduler.dart';

final titleCase = TitleCase();
final coloration = Coloration();
final size = Sizing();
late Aureus packageVariables;

// Returns the given 'mode' (light or dark) for the device that Aureus is running on.
Brightness brightness() {
  return SchedulerBinding.instance!.window.platformBrightness;
}

/* ------------------ GLOBAL VARIABLES -------------------- */

/* 

The Aureus class contains custom variables that are used throughout the rest of the 
UI items to customize them to the given project. It's initalized with fallback variables
if the developer forgets to implement. 

This is also where you set the Safety Object that governs what settings your users choose
for their safety plan (if they opt in). 

*/

class Aureus {
  Color prodColor = lavender();
  String prodName = 'Aureus';
  String missionTagline = 'Lorem ipsum dolor sit amet';
  Safety safetyObject = Safety(
      frequencyUsage: SafetyPlanFrequency.singleUse, eligiblePlanOptions: []);
  Image? darkFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Fluid%20-%20Portrait.png?raw=true');
  Image? lightFluidImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Fluid%20-%20Portrait.png?raw=true');
  Image? darkBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Blur%20-%20Portrait.png?raw=true');
  Image? lightBlurImage = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Blur%20-%20Portrait.png?raw=true');
  Image? lightLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Dark%20Mode.png?raw=true');
  Image? darkLogo = Image.network(
      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Icon%20-%20Light%20Mode.png?raw=true');

  Aureus(
      {required this.prodColor,
      required this.prodName,
      required this.missionTagline,
      required this.safetyObject,
      this.darkFluidImage,
      this.lightFluidImage,
      this.darkBlurImage,
      this.lightBlurImage,
      this.lightLogo,
      this.darkLogo});
}

class AureusBranding {
  String fontFamily = '';
  // The name of your app.
  // ------------------------------
  AureusStylization lightModeStyle;
  // The name of your app.
  // ------------------------------
  AureusStylization darkModeStyle;
  // The name of your app.
  // ------------------------------

  AureusBranding(
      {required this.fontFamily,
      required this.lightModeStyle,
      required this.darkModeStyle});
}

class AureusStylization {
  final Gradient contrastGradient;
  // The name of your app.
  // ------------------------------
  Color accentColor;
  // The name of your app.
  // ------------------------------
  Image? lightFluidImage = Image.network('');
  // The name of your app.
  // ------------------------------
  Image? lightBlurImage = Image.network('');
  // The name of your app.
  // ------------------------------
  Image? lightLogo = Image.network('');
  // The name of your app.
  // ------------------------------

  AureusStylization(
      {required this.contrastGradient, required this.accentColor});
}

// This is the information that Aureus pulls to fill in vital information in
// the templates we provide. Be sure to fill ALL of it out before you start
// developing.

class AureusInformation {
  // ------------------------------
  final String appName;
  // The name of your app.
  // ------------------------------
  final String appMission;
  // What your app does. Give a 1-2 sentence pitch.
  // ------------------------------
  final Safety appSafetySettings;
  // The safety object that determines how a user can change your app to better fit their own situation.
  // ------------------------------
  final String developerName;
  // The name of you or the organization that maintains this.
  // ------------------------------
  final String developerEmail;
  // The contact email for the maintainer of this app.
  // ------------------------------
  final String userSupportURL;
  // The URL that users should go if they need something.
  // ------------------------------
  final List<DataConsent> requestedDataPermissions;
  // The data permissions that you want from a user in onboarding.
  // ------------------------------
  final String termsOfService;
  // The terms of service for using your app
  // ------------------------------
  final String privacyPolicy;
  // A privacy policy that determines how you handle the users' data and information.
  // ------------------------------

  const AureusInformation(
      {required this.appName,
      required this.appMission,
      required this.appSafetySettings,
      required this.developerName,
      required this.developerEmail,
      required this.userSupportURL,
      required this.requestedDataPermissions,
      required this.termsOfService,
      required this.privacyPolicy});
}

class AureusApp extends MaterialApp {
  AureusApp() : super();
}

// A navigation tree that holds all of the values about what widgets
// to call in different templates. When Aureus uses a template screen for you,
// the entry and exit points from specific templates will come from this navigation tree.
class AureusNavigationTree {
  Widget splashScreen;
  //A splash screen with what users first see.
  // ------------------------------
  Widget homeScreen;
  //The entry point into your software.
  // ------------------------------
  Widget? signUp;
  //The entry point into your software.
  // ------------------------------
  Widget? signIn;
  //The entry point into your software.
  // ------------------------------
  Widget? onboardingDataCollection;
  //The entry point into your software.
  // ------------------------------
  Widget? appSettings;
  //The entry point into your software.
  // ------------------------------
  Widget? onboardingLanding;
  //The entry point into your software.
  // ------------------------------
  Widget? onboardingInformation;
  //The entry point into your software.
  // ------------------------------
  Widget? onboardingDemo;
  // The entry point into your software.
  // ------------------------------
  Widget termsOfService;
  // A view that holds your terms of service. This goes in your settings page.
  // ------------------------------
  Widget privacyPolicy;
  // A view that holds your privacy policy. This goes in your settings page.
  // ------------------------------
  Widget? helpCenter;
  // A templated help center that addresses common questions / concerns from users.
  // ------------------------------
  Widget contactSupport;
  // A 'contact us' page or form (if you have programmed one).
  // If this is blank, Aureus will default to sending people to your support email.
  // ------------------------------

  AureusNavigationTree(
      this.splashScreen,
      this.homeScreen,
      this.appSettings,
      this.onboardingLanding,
      this.onboardingDemo,
      this.onboardingInformation,
      this.termsOfService,
      this.privacyPolicy,
      this.helpCenter,
      this.contactSupport);
}
