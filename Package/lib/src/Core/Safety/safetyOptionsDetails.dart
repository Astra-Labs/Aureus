part of aureus_safety_plan;

/// {@category Safety}

/// A class that metadata about what the different safety options mean.
class SafetyOptionDetails {
  /// The name of an option detail
  final String name;

  /// The description of what the option DOES
  final String description;

  /// The icon to describe a safety option
  final IconData icon;

  /// The description of how it changes an application's functionality
  final String functionalityChange;

  const SafetyOptionDetails(
      {required this.name,
      required this.description,
      required this.icon,
      required this.functionalityChange});
}

/// A class that contains all of the actual metadata.
class SafetyOptionDetailMetadata {
  const SafetyOptionDetailMetadata();

  /// A helper function that brings up the relevant metadata for each detail.
  /// These are for views where the user selects what options they want / how it
  /// affects the functionality.
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

  /// A SOD that for only neccessarily emails
  /// ---
  SafetyOptionDetails onlyNeccessaryEmailsDetails() {
    return const SafetyOptionDetails(
        name: 'Only receieve neccessary emails.',
        description:
            'Opts you out of any emails outside of required account functionality emails.',
        icon: Assets.mail,
        functionalityChange:
            'You will not be sent any emails outside of required account functionality.');
  }

  /// A SOD that for disabling local / remote notifications
  /// ---
  SafetyOptionDetails disableNotificationsDetails() {
    return SafetyOptionDetails(
        name: 'Disable notifications.',
        description:
            'Stops us from sending you push notifications that may show up on your phone / browser screen.',
        icon: Assets.paperplane,
        functionalityChange:
            'You will not receive push notifications from ${resourceValues.name}');
  }

  /// A SOD that disables biometric data
  /// ---
  SafetyOptionDetails disableBiometricsDetails() {
    return SafetyOptionDetails(
        name: 'Disable biometrics.',
        description:
            'Turns off the ability to access or make changes to your account with biometric (TouchID / FaceID) authentication.',
        icon: Assets.person,
        functionalityChange:
            "You won't be able to use your face or fingerprints to perform actions on ${resourceValues.name}");
  }

  /// A SOD that enables 2FA
  /// ---
  SafetyOptionDetails enable2FADetails() {
    return SafetyOptionDetails(
        name: 'Enable Two Factor Authentication.',
        description:
            "Asks you for a secondary passcode to finish signing in. You'll set this passcode later on.",
        icon: Assets.stop,
        functionalityChange:
            'You will not be able to access ${resourceValues.name} without a secondary passcode.');
  }

  /// A SOD that for asks for all items to be saved locally
  /// ---
  SafetyOptionDetails localDataStorageDetails() {
    return const SafetyOptionDetails(
        name: 'Request local data storage.',
        description:
            'Keeps your data off of the cloud by encrypting it locally on your local device, instead of using a database and servers.',
        icon: Assets.pencil,
        functionalityChange:
            'This will stop you from having access to data back-ups and cloud access. You will only be able to access information from the device it was originally stored on.');
  }

  /// A SOD that automatically deletes data after failed attempts
  /// ---
  SafetyOptionDetails failedPasscodeDataDeletionDetails() {
    return SafetyOptionDetails(
        name: 'Delete data after failed log-in attempts.',
        description:
            'Automatically deletes all usuable data on ${resourceValues.name} if you enter your password or code incorrectly more than 10 times.',
        icon: Assets.alert,
        functionalityChange:
            'You will not be able to retrieve any account data after it has been deleted. To continue using ${resourceValues.name}, you will need to re-set up an account from scratch.');
  }

  /// A SOD that keeps an exit bar permanently on every screen
  /// ---
  SafetyOptionDetails exitBarDetails() {
    return SafetyOptionDetails(
        name: 'Show an emergency exit bar.',
        description:
            'Has an exit bar that allows you to quickly leave ${resourceValues.name} on every screen.',
        icon: Assets.expand,
        functionalityChange:
            'You will see an exit bar on every screen you access.');
  }

  /// A SOD to disable screenshots
  /// ---
  SafetyOptionDetails disableScreenshotsDetails() {
    return SafetyOptionDetails(
        name: 'Disable screenshots.',
        description: 'Screenshots / screen recordings will be blocked.',
        icon: Assets.lock,
        functionalityChange:
            'You will not be able to take screenshots or screen recordings inside of ${resourceValues.name}');
  }

  /// A SOD that sandboxes the user's device
  /// ---
  SafetyOptionDetails deviceSandboxDetails() {
    return SafetyOptionDetails(
        name: 'Sandbox your device.',
        description:
            'Disables ${resourceValues.name} from doing anything outside of its container. This disables opening links, exporting items, sending messages, sending data to a server, and more.',
        icon: Assets.link,
        functionalityChange:
            'You will not be able to complete any functionality that requires ${resourceValues.name} to use a 3rd party service. This will completely block it from having contact with the rest of your device.');
  }

  /// A SOD that logs failed attempts
  /// ---
  SafetyOptionDetails logFailedAttemptsDetails() {
    return const SafetyOptionDetails(
        name: 'Track failed log-in attempts.',
        description: 'Keeps a log of failed attempts to access your account.',
        icon: Assets.alertmessage,
        functionalityChange:
            'You will have a log available in settings of failed log-in attempts.');
  }
}
