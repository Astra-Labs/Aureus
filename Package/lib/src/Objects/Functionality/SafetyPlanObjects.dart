import 'package:aureus/aureus.dart';

class _SafetyPlan {
  SafetyPlanObject _accountSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.onlyNeccessaryEmails: false,
      SafetyPlanOptions.disableNotifications: false,
      SafetyPlanOptions.disableBiometrics: false,
      SafetyPlanOptions.enable2FA: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject _dataSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.localDataStorage: false,
      SafetyPlanOptions.failedPasscodeDataDeletion: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject _functionalitySafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.exitBar: false,
      SafetyPlanOptions.disableScreenshots: false,
      SafetyPlanOptions.deviceSandbox: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  SafetyPlanObject _loggingSafetyObject() {
    Map<SafetyPlanOptions, bool> safetyMap = {
      SafetyPlanOptions.logFailedAttempts: false
    };

    return SafetyPlanObject(settings: safetyMap);
  }

  void pullSafetySettings() {}

  void updateSafetySettings() {}
}

class SafetyPlanCheck {
  final SafetyPlanOptions safetyOption;
  final VoidCallback safetyFallback;

  const SafetyPlanCheck(
      {required this.safetyOption, required this.safetyFallback});
}

class SafetyPlanObject {
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}
