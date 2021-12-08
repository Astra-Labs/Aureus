import 'package:aureus/aureus.dart';

/*--------- IMPORTANT ----------

This functionality holds data about the safety of vulnerable populations. Tampering with the implementation of the Safety Plan, or harvesting the information for marketing or data collection purposes is against the terms of the Aureus license, and can result in having your license revoked, and is grounds for legal action. 

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

class Safety {
  final bool isSafetyPlanEnabled;
  final Map<SafetyPlanOptions, bool> eligiblePlanOptions;

  const Safety(
      {required this.isSafetyPlanEnabled, required this.eligiblePlanOptions});

  //A method for implementation of a safety plan check to check and run code that may interfere with an SP option. If the option is true, then the fallback code is completed.

  Future<void> safetyPlanHandling(
      {check: SafetyPlanCheck, execute: VoidCallback}) {
    //checks to see if a Safety Plan option is enabled, and runs the primary or fallback code depending on if option is enabled or not.
  }
}
