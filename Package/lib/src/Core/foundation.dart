import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Foundation}

final titleCase = TitleCase();
final coloration = Coloration();
final size = Sizing();
final accessibility = Accessibility();
late AureusResource packageVariables;
final resourceValues = AureusValues();

/// A custom wrapper of a material app that allows Aureus to handle custom accessibility,
/// safety, privacy, and accessibility changes. This also simplifies a lot of the information
/// that goes into our templates, and allows you to basically set these variables and
/// develop incredibly quickly.

class AureusResource extends StatefulWidget {
  /// The branding information (style, color, etc) for your resource.
  final AureusBranding resourceBranding;

  /// The information (developers, name, privacy policy) for your resource.
  final AureusInformation resourceInformation;

  /// The widgets used for specific items (splash screen, home page) for your resource.
  final AureusNavigationTree resourceNavigation;

  const AureusResource(
      {required this.resourceBranding,
      required this.resourceInformation,
      required this.resourceNavigation});

  @override
  _AureusResourceState createState() => _AureusResourceState();
}

class _AureusResourceState extends State<AureusResource> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: widget.resourceNavigation.splashScreen,
      title: widget.resourceInformation.name,
    );
  }
}

/*--------- AUREUS BRANDING ----------*/
/// Where you set your font, light mode, and dark mode stylization.

class AureusBranding {
  /// The name of the Google Font family your resource uses.
  String fontFamily = '';

  /// An instance of AureusStylization for your resources' light mode colors & graphics.
  AureusStylization lightModeStyle;

  /// An instance of AureusStylization for your resources' dark mode colors & graphics.
  AureusStylization darkModeStyle;

  AureusBranding(
      {required this.fontFamily,
      required this.lightModeStyle,
      required this.darkModeStyle});
}

/*--------- AUREUS STYLIZATION ----------*/
/// A class to hold custom branding and colors for the UI items generated
/// by Aureus. Each 'mode' has a different stylization, so you'll create
/// one for light mode and one for dark mode.
/* ----------------------------------------- */
class AureusStylization {
  /// A gradient that has colors for high contrast against your current mode. (e.g: A light gradient for dark mode, a dark gradient for light mode.).
  final Gradient contrastGradient;

  /// An accent color that matches your product color for that specific mode. A light color for dark mode, a dark color for light mode.
  Color accentColor;

  /// An image to appear in the background of important (primary) screens.
  Image? primaryImage = Image.network('');

  /// An image to appear in the background of secondary (the rest / general) screens.
  Image? secondaryImage = Image.network('');

  /// An a version of your logo that works on the given mode for this stylization.
  Image? logo = Image.network('');

  AureusStylization(
      {required this.contrastGradient,
      required this.accentColor,
      required this.primaryImage,
      required this.secondaryImage,
      required this.logo});
}

/*--------- AUREUS INFORMATION ----------*/
/// This is the information that Aureus pulls to fill in vital information in
/// the templates we provide. Be sure to fill ALL of it out before you start
/// developing.

class AureusInformation {
  /// The name of your resource.
  final String name;

  /// What your resource does. Give a 1-2 sentence pitch.
  final String mission;

  /// The safety object that determines how a user can change your resource to better fit their own situation.
  final Safety safetySettings;

  /// The name of you or the organization that runs the application.
  final String developerName;

  /// The contact email for the maintainer of this resource.
  final String developerEmail;

  /// The URL that users should go if they need something.
  final String userSupportURL;

  /// The data permissions that you want from a user in onboarding.
  final List<DataPermissionObject> requestedDataPermissions;

  /// The terms of service for using your resource
  final String termsOfService;

  /// A privacy policy that determines how you handle the users' data and information.
  final String privacyPolicy;

  const AureusInformation(
      {required this.name,
      required this.mission,
      required this.safetySettings,
      required this.developerName,
      required this.developerEmail,
      required this.userSupportURL,
      required this.requestedDataPermissions,
      required this.termsOfService,
      required this.privacyPolicy})
      : assert(name != "" &&
            mission != "" &&
            developerName != "" &&
            developerEmail != "" &&
            userSupportURL != "");
}

/*--------- AUREUS NAVIGATION ----------*/
/// A navigation tree that holds all of the values about what widgets
/// to call in different templates. When Aureus uses a template screen for you,
/// the entry and exit points from specific templates will come from this navigation tree.

class AureusNavigationTree {
  /// A splash screen with what users first see.
  final Widget splashScreen;

  /// The entry point into your software.
  final Widget homeScreen;

  /// A sign up screen
  final Widget signUp;

  /// A sign in screen.
  final Widget signIn;

  /// Where your settings are.
  final Widget settings;

  /// Where your users land for onboarding. (For use in [OnboardingLandingView])
  final Widget onboardingLanding;

  /// The entry point into your software. (For use in [OnboardingLandingView])
  final Widget onboardingInformation;

  ///  The entry point into your software. (For use in [OnboardingLandingView])
  final Widget onboardingDemo;

  ///  A view that holds your terms of service. This goes in your settings page.
  final Widget termsOfService;

  ///  A view that holds your privacy policy. This goes in your settings page.
  final Widget privacyPolicy;

  /// A templated help center that addresses common questions / concerns from users.
  final Widget helpCenter;

  ///  A 'contact us' page or form (if you have programmed one).
  ///  If this is blank, Aureus will default to sending people to your support email.
  final Widget contactSupport;

  const AureusNavigationTree(
      {required this.splashScreen,
      required this.homeScreen,
      required this.settings,
      required this.onboardingLanding,
      required this.onboardingDemo,
      required this.onboardingInformation,
      required this.termsOfService,
      required this.privacyPolicy,
      required this.signIn,
      required this.signUp,
      required this.helpCenter,
      required this.contactSupport});
}

/*--------- AUREUS VALUE MAP ----------*/
/// A helper class that creates flattened variables to access all of the
/// information gathered from AureusResource without making the code unbearable
/// to read.
///
class AureusValues {
  var branding = packageVariables.resourceBranding;
  var information = packageVariables.resourceInformation;
  var navigation = packageVariables.resourceNavigation;

  // Flattened branding values
  var font = packageVariables.resourceBranding.fontFamily;
  var lightMode = packageVariables.resourceBranding.lightModeStyle;
  var darkMode = packageVariables.resourceBranding.darkModeStyle;

  // Flattened information values
  var name = packageVariables.resourceInformation.name;
  var mission = packageVariables.resourceInformation.mission;
  var safetySettings = packageVariables.resourceInformation.safetySettings;
  var developerName = packageVariables.resourceInformation.developerName;
  var developerEmail = packageVariables.resourceInformation.developerEmail;
  var userSupport = packageVariables.resourceInformation.userSupportURL;
  var dataPermissions =
      packageVariables.resourceInformation.requestedDataPermissions;
  var tos = packageVariables.resourceInformation.termsOfService;
  var privacy = packageVariables.resourceInformation.privacyPolicy;

  // Flattened navigation values
  var splash = packageVariables.resourceNavigation.splashScreen;
  var home = packageVariables.resourceNavigation.homeScreen;
  var signUp = packageVariables.resourceNavigation.signUp;
  var signIn = packageVariables.resourceNavigation.signIn;
  var settings = packageVariables.resourceNavigation.settings;
  var onboarding = packageVariables.resourceNavigation.onboardingLanding;
  var onboardingInfo =
      packageVariables.resourceNavigation.onboardingInformation;
  var onboardingDemo = packageVariables.resourceNavigation.onboardingDemo;
  var termsOfService = packageVariables.resourceNavigation.termsOfService;
  var privacyPolicy = packageVariables.resourceNavigation.privacyPolicy;
  var help = packageVariables.resourceNavigation.helpCenter;
  var support = packageVariables.resourceNavigation.contactSupport;
}
