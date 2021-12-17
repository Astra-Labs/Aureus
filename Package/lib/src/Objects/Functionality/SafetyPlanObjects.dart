import 'package:aureus/aureus.dart';

class _SafetyPlan {
  Map<SafetyPlanOptions, bool> get readSettings {
    // pull most local settings from local storage here and return false if not written

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

  set writeSettings(Map<SafetyPlanOptions, bool> newSettings) {
    writeSettings = newSettings;

    //write settings directly to local storage
  }

  bool readSafetyOption(SafetyPlanOptions option) {
    return readSettings[option]!;
  }
}

enum SafetyFallBackOptions { errorController, alternateCode }

class SafetyPlanCheck {
  final List<SafetyPlanFallback> fallbackItems;

  const SafetyPlanCheck({required this.fallbackItems})
      : assert(fallbackItems.length >= 1);
}

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
