import 'package:aureus/aureus.dart';

/*--------- IMPORTANT ----------*/

/* 

Tampering with the implementation of the Safety Plan, or harvesting the 
information for marketing or data collection purposes is against the terms 
of the Aureus license, and can result in having your license revoked. 

*/

/*--------- ENUMS ----------*/

// ---------------------------------------------

/* An enum that determines if account creation is linked to the software. 

- If an account is not needed to access functionality within your app, use singleUse. 
- If an account IS needed, use reccuringUse. 

*/
enum SafetyPlanFrequency {
  singleUse, //software is used once, but doesn't have an account linked to it or isn't intended for long term visits. (e.g: Zenith)
  recurringUse //user has account with software, and is required to register to use.
}

// ---------------------------------------------
/* 

An enum that holds the current safety plan options a user can choose. 

*/

enum SafetyPlanOptions {
  disableNotifications, //doesn't allow app to send notifications
  disableBiometrics, //disables biometrics as a log-in method
  enable2FA, //enables 2FA with a passcode
  onlyNeccessaryEmails, //opts out of emails unrelated to urgent account information
  localDataStorage, //aims to store data locally instead of on a server
  failedPasscodeDataDeletion, //deletes user data after 10 failed passcode attempts
  exitBar, //shows a permanent exit bar on the screen that shuts down when pressed
  disableScreenshots, //stops screen recordings and screenshots
  deviceSandbox, //stops the resources from using other features on the device that can be logged (e.g: opening a browser or sending a message)
  logFailedAttempts //keeps track of all of the failed log in attempts for the user to review.
}

// ---------------------------------------------

/*--------- SAFETY ----------*/

// A class that contains data regarding how to handle creating a
// safety plan for the user.

class Safety {
  /* 
  
  A map that contains Safety Plan options that ALL software can complete.
  If you pass an empty list to productEligiblePlanOptions, basePlanOptions
  will be used to create a safety plan for the user. 
  
  */
  static Map<SafetyPlanOptions, bool> basePlanOptions = {
    SafetyPlanOptions.deviceSandbox: true,
    SafetyPlanOptions.exitBar: true,
    SafetyPlanOptions.disableScreenshots: true
  };

  /* 
  
  A map that contains product specific Safety Plan options aside from the base options
  This is where YOU pass to Aureus what options you can adopt. Please ensure
  ALL ELIGIBLE plan options are choosen when passed to apiVariables in initialization. 
  
  */
  final List<SafetyPlanOptions> eligiblePlanOptions;
  final SafetyPlanFrequency frequencyUsage;

  const Safety(
      {required this.frequencyUsage, required this.eligiblePlanOptions});

  // Takes a list of fallbacks (options that a specific piece of code violates,
  // and the desired fallback to complete instead)
  VoidCallback actionSafetyCheck(
      List<SafetyPlanFallback> fallbackItems, VoidCallback primaryItem) {
    VoidCallback executableCode;

    var errorController = AlertControllerObject.singleAction(
        onCancellation: () => {},
        alertTitle: "",
        alertBody: "",
        alertIcon: Icons.alternate_email_outlined,
        actions: [
          AlertControllerAction(
              actionName: "",
              actionSeverity: AlertControllerActionSeverity.standard,
              onSelection: () => {})
        ]);

    fallbackItems.forEach((element) {
      var optionEnabled = _SafetyPlan().readSafetyOption(element.safetyOption);

      if (optionEnabled == true) {
        if (element.fallbackOption == SafetyFallBackOptions.alternateCode) {
          executableCode = element.fallbackCode!;
        } else if (element.fallbackOption ==
            SafetyFallBackOptions.errorController) {
          executableCode = () =>
              {CenteredAlertControllerComponent(alertData: errorController)};
        }
      }
    });

    return () => {};
  }
}

/*--------- SAFETY PLAN ----------*/
/*

To reduce risk of abuse, all Safety Plan settings are handled directly by Aureus, 
and not passed to the developer. 

Aureus sets a safety plan through the 3 associated screens: 
- SafetyPlanOptInView
- SafetyPlanConfirmationView
- SafetyPlanFunctionalityView

After that, you interact with the Safety Plan by writing 

*/

class _SafetyPlan {
  Map<SafetyPlanOptions, bool> get readSettings {
    // pull settings from local storage here
    return {
      SafetyPlanOptions.onlyNeccessaryEmails: false,
      SafetyPlanOptions.disableNotifications: false,
      SafetyPlanOptions.disableBiometrics: false,
      SafetyPlanOptions.enable2FA: false,
      SafetyPlanOptions.localDataStorage: false,
      SafetyPlanOptions.failedPasscodeDataDeletion: false,
      SafetyPlanOptions.exitBar: false,
      SafetyPlanOptions.disableScreenshots: false,
      SafetyPlanOptions.deviceSandbox: false,
      SafetyPlanOptions.logFailedAttempts: false
    };
  }

  //write settings directly to local storage
  set writeSettings(Map<SafetyPlanOptions, bool> newSettings) {
    writeSettings = newSettings;
  }

  bool readSafetyOption(SafetyPlanOptions option) {
    return readSettings[option]!;
  }
}

enum SafetyFallBackOptions { errorController, alternateCode }

class SafetyPlanFallback {
  final SafetyPlanOptions safetyOption;
  final SafetyFallBackOptions fallbackOption;
  final VoidCallback? fallbackCode;

  const SafetyPlanFallback(this.safetyOption, this.fallbackOption,
      [this.fallbackCode])
      : assert(fallbackOption == SafetyFallBackOptions.alternateCode ||
            fallbackOption == SafetyFallBackOptions.errorController);
}

class SafetyPlanObject {
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}
