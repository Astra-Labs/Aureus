part of aureus_safety_plan;

/// {@category Safety}

/// An enum that determines if account creation is linked to the software.
///
/// - If an account is not needed to access functionality within your app, use singleUse.
/// - If an account IS needed, use reccuringUse.
///

enum SafetyPlanFrequency {
  /// software is used once, but doesn't have an account linked to it or isn't intended for long term visits.
  singleUse,

  /// user has account with software, and is required to register to use.
  recurringUse
}

/// An enum that holds the current safety plan options a user can choose.

enum SafetyPlanOptions {
  /// doesn't allow app to send notifications
  disableNotifications,

  /// disables biometrics as a log-in method
  disableBiometrics,

  /// enables 2FA with a passcode
  enable2FA,

  /// opts out of emails unrelated to urgent account information
  onlyNeccessaryEmails,

  /// aims to store data locally instead of on a server
  localDataStorage,

  /// deletes user data after 10 failed passcode attempts
  failedPasscodeDataDeletion,

  /// shows a permanent exit bar on the screen that shuts down when pressed
  exitBar,

  /// stops screen recordings and screenshots
  disableScreenshots,

  /// keeps track of all of the failed log in attempts for the user to review.
  logFailedAttempts
}

/// An enum for you to choose a fallback option if the user's safety plan
/// settings are violated

enum SafetyFallBackOptions {
  /// Shows an alert controller telling the user an action cannot be completed
  /// because of their settings
  errorController,

  /// Runs an alternate piece of code
  alternateCode
}
