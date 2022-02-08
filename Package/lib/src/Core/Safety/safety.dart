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

/* 

A class that metadata about what the different options mean. 

*/

class SafetyOptionDetails {
  final String name;
  final String description;
  final IconData icon;
  final String functionalityChange;

  const SafetyOptionDetails(
      {required this.name,
      required this.description,
      required this.icon,
      required this.functionalityChange});
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
  ALL ELIGIBLE plan options are choosen when passed to packageVariables in initialization. 
  
  */
  final List<SafetyPlanOptions> eligiblePlanOptions;
  final SafetyPlanFrequency frequencyUsage;

  const Safety(
      {required this.frequencyUsage, required this.eligiblePlanOptions});

  SafetyOptionDetails retrieveDetails(SafetyPlanOptions option) {
    switch (option) {
      case SafetyPlanOptions.onlyNeccessaryEmails:
        return onlyNeccessaryEmailsDetails();

      case SafetyPlanOptions.disableNotifications:
        return disableNotificationsDetails();

      case SafetyPlanOptions.disableBiometrics:
        return disableBiometricsDetails();

      case SafetyPlanOptions.enable2FA:
        return enable2FADetails();

      case SafetyPlanOptions.localDataStorage:
        return localDataStorageDetails();

      case SafetyPlanOptions.failedPasscodeDataDeletion:
        return failedPasscodeDataDeletionDetails();

      case SafetyPlanOptions.exitBar:
        return exitBarDetails();

      case SafetyPlanOptions.disableScreenshots:
        return disableScreenshotsDetails();

      case SafetyPlanOptions.deviceSandbox:
        return deviceSandboxDetails();

      case SafetyPlanOptions.logFailedAttempts:
        return logFailedAttemptsDetails();
    }
  }

  SafetyOptionDetails onlyNeccessaryEmailsDetails() {
    return SafetyOptionDetails(
        name: 'Only receieve neccessary emails.',
        description:
            'Opts you out of any emails outside of required account functionality emails.',
        icon: Assets.mail,
        functionalityChange:
            'You will not be sent any emails outside of required account functionality.');
  }

  SafetyOptionDetails disableNotificationsDetails() {
    return SafetyOptionDetails(
        name: 'Disable notifications.',
        description:
            'Stops us from sending you push notifications that may show up on your phone / browser screen.',
        icon: Assets.paperplane,
        functionalityChange:
            'You will not receive push notifications from ${resourceValues.name}');
  }

  SafetyOptionDetails disableBiometricsDetails() {
    return SafetyOptionDetails(
        name: 'Disable biometrics.',
        description:
            'Turns off the ability to access or make changes to your account with biometric (TouchID / FaceID) authentication.',
        icon: Assets.person,
        functionalityChange:
            "You won't be able to use your face or fingerprints to perform actions on ${resourceValues.name}");
  }

  SafetyOptionDetails enable2FADetails() {
    return SafetyOptionDetails(
        name: 'Enable Two Factor Authentication.',
        description:
            "Asks you for a secondary passcode to finish signing in. You'll set this passcode later on.",
        icon: Assets.stop,
        functionalityChange:
            'You will not be able to access ${resourceValues.name} without a secondary passcode.');
  }

  SafetyOptionDetails localDataStorageDetails() {
    return SafetyOptionDetails(
        name: 'Request local data storage.',
        description:
            'Keeps your data off of the cloud by encrypting it locally on your local device, instead of using a database and servers.',
        icon: Assets.pencil,
        functionalityChange:
            'This will stop you from having access to data back-ups and cloud access. You will only be able to access information from the device it was originally stored on.');
  }

  SafetyOptionDetails failedPasscodeDataDeletionDetails() {
    return SafetyOptionDetails(
        name: 'Delete data after failed log-in attempts.',
        description:
            'Automatically deletes all usuable data on ${resourceValues.name} if you enter your password or code incorrectly more than 10 times.',
        icon: Assets.alert,
        functionalityChange:
            'You will not be able to retrieve any account data after it has been deleted. To continue using ${resourceValues.name}, you will need to re-set up an account from scratch.');
  }

  SafetyOptionDetails exitBarDetails() {
    return SafetyOptionDetails(
        name: 'Show an emergency exit bar.',
        description:
            'Has an exit bar that allows you to quickly leave ${resourceValues.name} on every screen.',
        icon: Assets.expand,
        functionalityChange:
            'You will see an exit bar on every screen you access.');
  }

  SafetyOptionDetails disableScreenshotsDetails() {
    return SafetyOptionDetails(
        name: 'Disable screenshots.',
        description: 'Screenshots / screen recordings will be blocked.',
        icon: Assets.lock,
        functionalityChange:
            'You will not be able to take screenshots or screen recordings inside of ${resourceValues.name}');
  }

  SafetyOptionDetails deviceSandboxDetails() {
    return SafetyOptionDetails(
        name: 'Sandbox your device.',
        description:
            'Disables ${resourceValues.name} from doing anything outside of its container. This disables opening links, exporting items, sending messages, sending data to a server, and more.',
        icon: Assets.link,
        functionalityChange:
            'You will not be able to complete any functionality that requires ${resourceValues.name} to use a 3rd party service. This will completely block it from having contact with the rest of your device.');
  }

  SafetyOptionDetails logFailedAttemptsDetails() {
    return SafetyOptionDetails(
        name: 'Track failed log-in attempts.',
        description: 'Keeps a log of failed attempts to access your account.',
        icon: Assets.alertmessage,
        functionalityChange:
            'You will have a log available in settings of failed log-in attempts.');
  }

  // Takes a list of fallbacks (options that a specific piece of code violates,
  // and the desired fallback to complete instead)
  VoidCallback actionSafetyCheck(BuildContext actionContext,
      List<SafetyPlanFallback> fallbackItems, VoidCallback primaryItem) {
    VoidCallback executableCode = () => {};

    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();

    Widget alertControllerModal = SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: FloatingContainerElement(
          child: Center(
              child: CenteredAlertControllerComponent(
                  alertData: AlertControllerObject.singleAction(
                      onCancellation: () => {Navigator.pop(actionContext)},
                      alertTitle: "Error!",
                      alertBody:
                          "You requested an action that was disabled by your Safety Plan settings.",
                      alertIcon: Icons.alternate_email_outlined,
                      actions: [
            AlertControllerAction(
                actionName: "Okay.",
                actionSeverity: AlertControllerActionSeverity.standard,
                onSelection: () => {Navigator.pop(actionContext)})
          ])))),
    );

    fallbackItems.forEach((element) {
      var optionEnabled = _SafetyPlan().readSafetyOption(element.safetyOption);

      if (optionEnabled == true) {
        if (element.fallbackOption == SafetyFallBackOptions.alternateCode) {
          executableCode = element.fallbackCode!;
        } else if (element.fallbackOption ==
            SafetyFallBackOptions.errorController) {
          executableCode = () => {
                Navigator.push(
                    actionContext,
                    MaterialPageRoute(
                      builder: (context) => alertControllerModal,
                    ))
              };
        }
      }
    });

    return executableCode;
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
