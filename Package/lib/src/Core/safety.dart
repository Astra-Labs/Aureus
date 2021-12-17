import 'package:aureus/aureus.dart';

/*--------- IMPORTANT ----------

This functionality holds data about the safety of vulnerable populations. Tampering with the implementation of the Safety Plan, or harvesting the information for marketing or data collection purposes is against the terms of the Aureus license, and can result in having your license revoked, and is grounds for legal action. 

*/

enum SafetyProductOptions {
  singleUse, //software is used once, but doesn't have an account linked to it or isn't intended for long term visits. (e.g: Zenith)
  recurringUse //user has account with software, and is required to register to use.
}

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

class Safety {
  // a map that contains Safety Plan options that ALL software can complete.
  static Map<SafetyPlanOptions, bool> basePlanOptions = {
    SafetyPlanOptions.deviceSandbox: true,
    SafetyPlanOptions.exitBar: true,
    SafetyPlanOptions.disableScreenshots: true
  };

  //a map that contains product specific Safety Plan options aside from the base options
  final List<SafetyPlanOptions> productEligiblePlanOptions;
  final SafetyProductOptions frequencyUsage;

  const Safety(
      {required this.frequencyUsage, required this.productEligiblePlanOptions});

  //If software is single use, settings are created automatically to show exit bar.
}
