part of aureus_safety_plan;

/*--------- ENUMS ----------

 An enum that determines if account creation is linked to the software. 

- If an account is not needed to access functionality within your app, use singleUse. 
- If an account IS needed, use reccuringUse. 

*/

enum SafetyPlanFrequency {
  singleUse, // software is used once, but doesn't have an account linked to it or isn't intended for long term visits.
  recurringUse // user has account with software, and is required to register to use.
}

// -----------------------------------------------------------------------------------------
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
