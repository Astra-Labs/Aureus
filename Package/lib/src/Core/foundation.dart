import 'package:aureus/aureus.dart';

final titleCase = TitleCase();
final coloration = Coloration();
final size = Sizing();
final accessibility = Accessibility();
late AureusResource packageVariables;
final resourceValues = AureusValues();

/*--------- AUREUS APP ----------*/
/*

A custom wrapper of a material app that allows Aureus to handle custom accessibility, 
safety, privacy, and accessibility changes. This also simplifies a lot of the information
that goes into our templates, and allows you to basically set these variables and 
develop incredibly quickly. 

*/

class AureusResource extends StatefulWidget {
  final AureusBranding resourceBranding;
  // The branding information (style, color, etc) for your resource.
  // ------------------------------

  final AureusInformation resourceInformation;
  // The information (developers, name, privacy policy) for your resource.
  // ------------------------------

  final AureusNavigationTree resourceNavigation;
  // The widgets used for specific items (splash screen, home page) for your resource.
  // ------------------------------

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
/*

Where you set your font, light mode, and dark mode stylization. 

*/

class AureusBranding {
  String fontFamily = '';
  // The name of the Google Font family your resource uses.
  // ------------------------------
  AureusStylization lightModeStyle;
  // An instance of AureusStylization for your resources' light mode colors & graphics.
  // ------------------------------
  AureusStylization darkModeStyle;
  // An instance of AureusStylization for your resources' dark mode colors & graphics.
  // ------------------------------

  AureusBranding(
      {required this.fontFamily,
      required this.lightModeStyle,
      required this.darkModeStyle});
}

/*--------- AUREUS STYLIZATION ----------*/
// The class that changes our colorization library
/* ----------------------------------------- */
class AureusStylization {
  final Gradient contrastGradient;
  // A gradient that has colors for high contrast against your current mode. (e.g: A light gradient for dark mode, a dark gradient for light mode.).
  // ------------------------------
  Color accentColor;
  // An accent color that matches your product color for that specific mode. A light color for dark mode, a dark color for light mode.
  // ------------------------------
  Image? primaryImage = Image.network('');
  // An image to appear in the background of important (primary) screens.
  // ------------------------------
  Image? secondaryImage = Image.network('');
  // An image to appear in the background of secondary (the rest / general) screens.
  // ------------------------------
  Image? logo = Image.network('');
  // An a version of your logo that works on the given mode for this stylization.
  // ------------------------------

  AureusStylization(
      {required this.contrastGradient,
      required this.accentColor,
      required this.primaryImage,
      required this.secondaryImage,
      required this.logo});
}

/*--------- AUREUS INFORMATION ----------*/
// This is the information that Aureus pulls to fill in vital information in
// the templates we provide. Be sure to fill ALL of it out before you start
// developing.
/* ----------------------------------------- */

class AureusInformation {
  final String name;
  // The name of your resource.
  // ------------------------------
  final String mission;
  // What your resource does. Give a 1-2 sentence pitch.
  // ------------------------------
  final Safety safetySettings;
  // The safety object that determines how a user can change your resource to better fit their own situation.
  // ------------------------------
  final String developerName;
  // The name of you or the organization that maintains this.
  // ------------------------------
  final String developerEmail;
  // The contact email for the maintainer of this resource.
  // ------------------------------
  final String userSupportURL;
  // The URL that users should go if they need something.
  // ------------------------------
  final List<DataPermissionObject> requestedDataPermissions;
  // The data permissions that you want from a user in onboarding.
  // ------------------------------
  final String termsOfService;
  // The terms of service for using your resource
  // ------------------------------
  final String privacyPolicy;
  // A privacy policy that determines how you handle the users' data and information.
  // ------------------------------

  const AureusInformation(
      {required this.name,
      required this.mission,
      required this.safetySettings,
      required this.developerName,
      required this.developerEmail,
      required this.userSupportURL,
      required this.requestedDataPermissions,
      required this.termsOfService,
      required this.privacyPolicy});
}

/*--------- AUREUS NAVIGATION ----------*/
// A navigation tree that holds all of the values about what widgets
// to call in different templates. When Aureus uses a template screen for you,
// the entry and exit points from specific templates will come from this navigation tree.
/* ----------------------------------------- */
class AureusNavigationTree {
  final Widget splashScreen;
  //A splash screen with what users first see.
  // ------------------------------
  final Widget homeScreen;
  //The entry point into your software.
  // ------------------------------
  final Widget signUp;
  //A sign up screen
  // ------------------------------
  final Widget signIn;
  //A sign in screen.
  // ------------------------------
  final Widget settings;
  //Where your settings are.
  // ------------------------------
  final Widget onboardingLanding;
  //Where your users land for onboarding. (For use in OnboardingLandingView)
  // ------------------------------
  final Widget onboardingInformation;
  //The entry point into your software. (For use in OnboardingLandingView,)
  // ------------------------------
  final Widget onboardingDemo;
  // The entry point into your software. (For use in OnboardingLandingView)
  // ------------------------------
  final Widget termsOfService;
  // A view that holds your terms of service. This goes in your settings page.
  // ------------------------------
  final Widget privacyPolicy;
  // A view that holds your privacy policy. This goes in your settings page.
  // ------------------------------
  final Widget helpCenter;
  // A templated help center that addresses common questions / concerns from users.
  // ------------------------------
  final Widget contactSupport;
  // A 'contact us' page or form (if you have programmed one).
  // If this is blank, Aureus will default to sending people to your support email.
  // ------------------------------

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
// A helper class that creates flattened variables to access all of the
// information gathered from AureusResource without making the code unbearable
// to read.
/* ----------------------------------------- */
class AureusValues {
  // Flattened versions of the main variables that make the
  // main part of the resource tree.
  var branding = packageVariables.resourceBranding;
  var information = packageVariables.resourceInformation;
  var navigation = packageVariables.resourceNavigation;
  // ------------------------------

  // Flattened branding values
  var font = packageVariables.resourceBranding.fontFamily;
  var lightMode = packageVariables.resourceBranding.lightModeStyle;
  var darkMode = packageVariables.resourceBranding.darkModeStyle;
  // ------------------------------

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
  // ------------------------------

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
  // ------------------------------

}
