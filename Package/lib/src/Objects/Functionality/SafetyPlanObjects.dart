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

enum SafetyFallBackOptions { errorController, alternateCode }

class SafetyPlanCheck {
  final List<SafetyPlanFallback> fallbackItems;

  const SafetyPlanCheck({required this.fallbackItems})
      : assert(fallbackItems != []);
}

class SafetyPlanFallback {
  SafetyPlanOptions safetyOption SafetyPlanOptions.;
  SafetyFallBackOptions fallbackOptions;
  VoidCallback fallbackCode;

  SafetyPlanFallback.withErrorController(this.safetyOption);

  SafetyPlanFallback.withAlternateExecution(
      this.safetyOption, this.fallbackCode);
}

class SafetyPlanObject {
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}
