part of aureus_safety_plan;

/// {@category Safety}

/*--------- SAFETY ----------*/

/// A class that contains data regarding how to handle creating a
/// Safety Plan for the user.
///

enum SafetyStorageLayer {
  logInAttempts,
}

Map<SafetyStorageLayer, String> safetyStorageKeys = {
  SafetyStorageLayer.logInAttempts: 'logInAttempts'
};

class Safety {
  /// A map that contains Safety Plan options that ALL software can complete.
  /// If you pass an empty list to productEligiblePlanOptions, basePlanOptions
  /// will be used to create a safety plan for the user.

  static Map<SafetyPlanOptions, bool> basePlanOptions = {
    SafetyPlanOptions.exitBar: true,
    SafetyPlanOptions.disableScreenshots: true
  };

  /// A reference to the metadata class in a separate file
  static const detailMetaData = SafetyOptionDetailMetadata();

  /// A map that contains product specific Safety Plan options aside from the base options
  /// This is where YOU pass to Aureus what options you can adopt. Please ensure
  /// ALL ELIGIBLE plan options are choosen when passed to packageVariables in initialization.
  final List<SafetyPlanOptions> eligiblePlanOptions;

  /// The frequency usage is how often you anticipate someone to use your piece of software.
  final SafetyPlanFrequency frequencyUsage;

  /// This is if you are using a quick action bar that allows user to access
  /// certain functionality on every single page. This is helpful if you have
  /// 'emergency' features that need to be accessed on every page (e.g: dealing
  ///  with suicidal users who may emergency access a tool).
  final bool? isActionBarDevEnabled;

  /// If you do want a quick action bar to appear on every screen, these are
  /// the objects that will show up in the bar. The tabs can do anything from
  /// call an emergency hotline, to segue users to a specific tool. The idea
  /// is to limit these to really sensitive resources that need to be close at all times
  final List<TabObject>? quickActionItems;

  const Safety({
    required this.frequencyUsage,
    required this.eligiblePlanOptions,
    this.isActionBarDevEnabled = false,
    this.quickActionItems = const [],
  });

  /// Takes a list of fallbacks (options that a specific piece of code violates,
  /// and the desired fallback to complete instead). You should use this to check
  /// if the piece of code you wrote violated a SafetyPlan request.
  ///
  ///   IMPORTANT: if the parent widget does not subclass from [AureusNotificationMaster],
  ///   the notificationManager will not be able to show a widget. If you're only using Material,
  ///   you should probably only use the 'executable code' fallback.
  ///
  ///  To use an action SafetyCheck, provide:
  ///   - fallbackItems: A list of rules that you may violate, and the fallback code you want to execute
  /// - primaryItem: the action you want to take if the user's safetyPlan allows it.
  ///
  /// For example, before sending a notification you would provide the context,
  /// the fallback items in case a user doesn't want notifications (the alt code to execute would be nothing),
  /// and the primary item would be scheduling / sending the notification.
  ///
  /// Keep in mind this is a future, and requires the proper handling for async
  /// code. If you're a beginner, another area you might recognize async code from
  /// is a networking request. It's relatively similar to requesting data from an API!
  ///
  /// So think of it as querying a user's "safety API" while giving the error handling
  /// directly to the API itself. The VoidCallback you're given is the executable code to run.

  Future<VoidCallback> actionSafetyCheck(
      List<SafetyPlanFallback> fallbackItems, VoidCallback primaryItem) async {
    VoidCallback executableCode = primaryItem;

    for (var element in fallbackItems) {
      if (await _SafetyPlanStorageLayer()._readSetting(element.safetyOption) ==
          true) {
        if (element.fallbackOption == SafetyFallBackOptions.alternateCode) {
          executableCode = element.fallbackCode!;
        } else if (element.fallbackOption ==
            SafetyFallBackOptions.errorController) {
          executableCode = () {
            var safetyOption =
                detailMetaData.retrieveDetails(element.safetyOption).name;

            // Creates an alert controller object to show to the user.
            var disabledAlertControllerObject =
                AlertControllerObject.singleAction(
                    onCancellation: () => {
                          notificationMaster.resetRequests(),
                        },
                    alertTitle: "Blocked Action",
                    alertBody:
                        "You requested an action that was disabled by your Safety Plan settings. The setting blocking this action is $safetyOption. You can go into your settings to change your Safety Plan settings at any time.",
                    alertIcon: Assets.alertmessage,
                    actions: [
                  AlertControllerAction(
                      actionName: "Okay.",
                      actionSeverity: AlertControllerActionSeverity.standard,
                      onSelection: () => {
                            notificationMaster.resetRequests(),
                          }),
                ]);

            notificationMaster
                .sendAlertControllerRequest(disabledAlertControllerObject);
          };
        }
      }
    }

    return executableCode;
  }

  /// An interface to record failed log-in attempts for users to look back at.
  Future<void> recordFailedLogInAttempt() async {
    var date = DateTime.now();
    await _SafetyPlanStorageLayer().writeLogIn(date.toString());
  }

  Future<List<String>> readAllFailedLogInAttempts() async {
    var attempts = await _SafetyPlanStorageLayer().readFailedLogInAttempts;
    return attempts;
  }
}

/*--------- SAFETY PLAN ----------*/
///
///
/// To reduce risk of abuse, all Safety Plan settings are handled directly by Aureus,
/// and not passed to the developer.
///
/// Aureus sets a safety plan through the 3 associated screens:
/// - SafetyPlanOptInView
/// - SafetyPlanConfirmationView
/// - SafetyPlanFunctionalityView
///
/// After that, you interact with the Safety Plan by using the actionSafetyCheck function in SafetyPlan

class _SafetyPlanStorageLayer {
  /// initializes a storage layer in Perichron
  final _storage = PerichronStorageLayer();

  Map<SafetyPlanOptions, String> safetyPlanKeys = {
    SafetyPlanOptions.onlyNeccessaryEmails: 'onlyNeccessaryEmails',
    SafetyPlanOptions.disableNotifications: 'disableNotifications',
    SafetyPlanOptions.disableBiometrics: 'disableBiometrics',
    SafetyPlanOptions.enable2FA: "enable2FA",
    SafetyPlanOptions.localDataStorage: 'localDataStorage',
    SafetyPlanOptions.failedPasscodeDataDeletion: 'failedPasscodeDataDeletion',
    SafetyPlanOptions.exitBar: 'exitBar',
    SafetyPlanOptions.disableScreenshots: 'disableScreenshots',
    SafetyPlanOptions.logFailedAttempts: 'logFailedAttempts',
  };

  // READ / WRITE SETTINGS

  /// Reads a setting
  Future<bool> _readSetting(SafetyPlanOptions option) async {
    final settings = _storage.readItem(safetyPlanKeys[option]!);
    return settings.toString() == "true" ? true : false;
  }

  /// Writes a setting
  Future<void> _writeSetting(SafetyPlanOptions option, bool isEnabled) async {
    await _storage.addItem(safetyPlanKeys[option]!, isEnabled.toString());
  }

  /// Reads ALL settings
  Future<Map<SafetyPlanOptions, bool>> get readSettings async {
    // pull settings from local storage here
    Map<SafetyPlanOptions, bool> settings = {};

    for (var element in SafetyPlanOptions.values) {
      settings.addEntries(
        [
          MapEntry(
            element,
            await _readSetting(element),
          )
        ],
      );
    }

    return settings;
  }

  /// write ALL settings specified in the parameters directly to local storage
  Future<void> writeSettings(Map<SafetyPlanOptions, bool> newSettings) async {
    for (var element in newSettings.entries) {
      _writeSetting(element.key, element.value);
    }
  }

  /// Reads ALL failed log in attempts
  Future<List<String>> get readFailedLogInAttempts async {
    // pull settings from local storage here
    List<String> attempts = [];

    var data = _storage.readItem(
      safetyStorageKeys[SafetyStorageLayer.logInAttempts]!,
    );

    // Waits for the future to complete, and then separates them based
    // on the "+" symbol into their attempts.
    data.whenComplete(() => {});

    return attempts;
  }

  /// Writes a failed log-in attempt.
  Future<void> writeLogIn(String logInData) async {
    // There needs to be some way to separate the String with special characters
    // to determine the separate attempts, since you can only write single strings
    // to the local storage.

    var previousAttempts = await _storage.readItem(
      safetyStorageKeys[SafetyStorageLayer.logInAttempts]!,
    );

    // Decodes the JSON saved to the storage layer
    var jsonDecodedString = jsonDecode(previousAttempts!);
    var logInObject = LogInAttempsObject.fromJson(jsonDecodedString);

    // Adds the attempts
    logInObject.attempts.add(logInData);

    // Re-encodes to save it
    var encodedItem = jsonEncode(logInObject);

    await _storage.addItem(
        safetyStorageKeys[SafetyStorageLayer.logInAttempts]!, encodedItem);
  }
}

class LogInAttempsObject {
  List<String> attempts;

  LogInAttempsObject({required this.attempts});

  factory LogInAttempsObject.fromJson(Map<String, List<String>> json) {
    return LogInAttempsObject(
      attempts: json['attempts'] as List<String>,
    );
  }

  Map<String, dynamic> toJson() => {
        'attempts': attempts,
      };
}
