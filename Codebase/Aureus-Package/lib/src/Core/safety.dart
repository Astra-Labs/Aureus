library aureus;

/*--------- IMPORTANT ----------

This class holds data about the safety of vulnerable populations. 
It is absolutely imperative that you store and transmit this information in a way that protects the user above anything. 
If this information is leaked and associated with a user, it can DESTROY someone's life. 

It is HIGHLY recommended that you do not alter the implementation and ONLY locally store this information encrypted on device, and do not save the values on a database or server. 

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

  const Safety({this.isSafetyPlanEnabled = false});
}

class SafetyPlan {
  SafetyPlanObject accountSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.onlyNeccessaryEmails: false,
      SafetyPlanOptions.disableNotifications: false,
      SafetyPlanOptions.disableBiometrics: false,
      SafetyPlanOptions.enable2FA: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject dataSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.localDataStorage: false,
      SafetyPlanOptions.failedPasscodeDataDeletion: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject functionalitySafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.exitBar: false,
      SafetyPlanOptions.disableScreenshots: false,
      SafetyPlanOptions.deviceSandbox: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject loggingSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.logFailedAttempts: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }
}

class SafetyPlanObject {
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}
