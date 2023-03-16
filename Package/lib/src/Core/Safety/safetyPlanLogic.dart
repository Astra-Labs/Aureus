part of aureus_safety_plan;

/// {@category Safety}

/*--------- SAFETY ----------*/

/// A class that contains data regarding how to handle creating a
/// Safety Plan for the user.

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

  const Safety(
      {required this.frequencyUsage,
      required this.eligiblePlanOptions,
      this.isActionBarDevEnabled = false,
      this.quickActionItems = const []});

  /// Takes a list of fallbacks (options that a specific piece of code violates,
  /// and the desired fallback to complete instead). You should use this to check
  /// if the piece of code you wrote violated a SafetyPlan request.
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
  ///
  /// You can learn about how to handle futures in dart here.

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
            var disabledAlertControllerObject = AlertControllerObject.singleAction(
                onCancellation: () => {},
                alertTitle: "Blocked Action",
                alertBody:
                    "You requested an action that was disabled by your Safety Plan settings. The setting blocking this action is $safetyOption. You can go into your settings to change your Safety Plan settings at any time.",
                alertIcon: Assets.alertmessage,
                actions: [
                  AlertControllerAction(
                      actionName: "Okay.",
                      actionSeverity: AlertControllerActionSeverity.standard,
                      onSelection: () => {}),
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
  void recordFailedLogInAttempt() {
    var date = DateTime.now();
    _SafetyPlanStorageLayer().writeLogIn(date.toString());
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
  /// initializes a storage layer in FlutterSecureStorage
  final _storage = const FlutterSecureStorage();

  /// Switches the option into the relevant key for writing / retrival
  String safetyPlanKey(SafetyPlanOptions option) {
    switch (option) {
      case SafetyPlanOptions.onlyNeccessaryEmails:
        return 'onlyNeccessaryEmails';

      case SafetyPlanOptions.disableNotifications:
        return 'disableNotifications';

      case SafetyPlanOptions.disableBiometrics:
        return 'disableBiometrics';

      case SafetyPlanOptions.enable2FA:
        return 'enable2FA';

      case SafetyPlanOptions.localDataStorage:
        return 'localDataStorage';

      case SafetyPlanOptions.failedPasscodeDataDeletion:
        return 'failedPasscodeDataDeletion';

      case SafetyPlanOptions.exitBar:
        return 'exitBar';

      case SafetyPlanOptions.disableScreenshots:
        return 'disableScreenshots';

      case SafetyPlanOptions.logFailedAttempts:
        return 'logFailedAttempts';
    }
  }

  // READ / WRITE SETTINGS

  /// Reads a setting
  Future<bool> _readSetting(SafetyPlanOptions option) async {
    print("Reading a setting!");
    final settings = _storage.read(key: safetyPlanKey(option));
    return settings.toString() == "true" ? true : false;
  }

  /// Writes a setting
  Future<void> _writeSetting(SafetyPlanOptions option, bool isEnabled) async {
    print("Writing a setting!");
    await _storage.write(
        key: safetyPlanKey(option), value: isEnabled.toString());
  }

  /// Reads ALL settings
  Future<Map<SafetyPlanOptions, bool>> get readSettings async {
    print("Reading ALL settings!");
    // pull settings from local storage here
    Map<SafetyPlanOptions, bool> settings = {};

    for (var element in SafetyPlanOptions.values) {
      settings.addEntries([MapEntry(element, await _readSetting(element))]);
    }

    return settings;
  }

  /// write ALL settings specified in the parameters directly to local storage
  Future<void> writeSettings(Map<SafetyPlanOptions, bool> newSettings) async {
    print("Writing all settings!");
    for (var element in newSettings.entries) {
      _writeSetting(element.key, element.value);
    }
  }

  // READ / WRITE FAILED LOG IN ATTEMPTS

  var logInKey = "";

  /// Reads ALL failed log in attempts
  Future<List<String>> get readFailedLogInAttempts async {
    print("Reading failed log in attempts!");
    // pull settings from local storage here
    List<String> attempts = [];

    var data = _storage.read(key: logInKey);

    // Waits for the future to complete, and then separates them based
    // on the "+" symbol into their attempts.
    data.whenComplete(() => {});

    return attempts;
  }

  /// Writes a failed log-in attempt.
  Future<void> writeLogIn(String logInData) async {
    print("Writing failed log in attempts");
    // There needs to be some way to separate the String with special characters
    // to determine the separate attempts, since you can only write single strings
    // to the local storage.

    var previousAttempts = await _storage.read(key: logInKey);
    var updatedAttempts = previousAttempts ?? "" + logInData;

    await _storage.write(key: logInKey, value: updatedAttempts);
  }
}

/// An enum for you to choose a fallback option if the user's safety plan
/// settings are violated
///
enum SafetyFallBackOptions {
  /// Shows an alert controller telling the user an action cannot be completed
  /// because of their settings
  errorController,

  /// Runs an alternate piece of code
  alternateCode
}

/// A class that creates a 'fallback'. This is what you give to the Safety Plan
/// to execute code on your behalf, depending on the user's safety settings.
class SafetyPlanFallback {
  /// Describes what option you may be 'violating'
  final SafetyPlanOptions safetyOption;

  /// How you want to handle that violation
  final SafetyFallBackOptions fallbackOption;

  /// If you want to use the alternate code error option, this is
  /// the code that will alternatively be run.
  final VoidCallback? fallbackCode;

  const SafetyPlanFallback(this.safetyOption, this.fallbackOption,
      [this.fallbackCode])
      : assert(fallbackOption == SafetyFallBackOptions.alternateCode ||
            fallbackOption == SafetyFallBackOptions.errorController);
}

/// A class that acts as a 'wrapper' for the safety plan
class SafetyPlanObject {
  /// A map for each option and where or not it's enabled
  final Map<SafetyPlanOptions, bool> settings;

  const SafetyPlanObject({required this.settings})
      : assert(settings.length < 0);
}

/// This view is located within the safety.dart file
/// to make sure that access to SafetyPlan isn't accessible outside
/// of the filescope.

/// A view used by Aureus to double confirm the functionality changes that a
/// user is requesting, and then saving it to the Storage Layer.

class SafetyPlanFunctionalityView extends StatefulWidget {
  /// The user selected options that they want to enable
  final List<SafetyPlanOptions> userSelectedOptions;

  /// Where the user should go after their safety plan has been written. E.G
  /// to the home screen, to another onboarding screen, etc.
  final Widget exitPoint;

  const SafetyPlanFunctionalityView(
      {required this.userSelectedOptions, required this.exitPoint});

  @override
  _SafetyPlanFunctionalityViewState createState() =>
      _SafetyPlanFunctionalityViewState();
}

class _SafetyPlanFunctionalityViewState
    extends State<SafetyPlanFunctionalityView> {
  var safety = resourceValues.safetySettings;

  Map<SafetyPlanOptions, bool> userEnabledSettings = {};
  List<ComplexSwitchCardElement> optionCards = [];

  void updateSettings() {
    _SafetyPlanStorageLayer().writeSettings(userEnabledSettings).then(
        (value) => {
              notificationMaster.sendAlertControllerRequest(
                  AlertControllerObject.singleAction(
                      onCancellation: () => {},
                      alertTitle: "Safety Plan Enabled",
                      alertBody:
                          "Your safety plan settings have been encrypted, and saved.",
                      alertIcon: Assets.yes,
                      actions: [
                    AlertControllerAction(
                        actionName: "Ok!",
                        actionSeverity: AlertControllerActionSeverity.standard,
                        onSelection: () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => widget.exitPoint,
                                  ))
                            })
                  ]))
            }, onError: (error) {
      notificationMaster.sendAlertControllerRequest(
          AlertControllerObject.singleAction(
              onCancellation: () => {},
              alertTitle: "Uh oh.",
              alertBody:
                  "An error saving your safety plan has occured: $error.",
              alertIcon: Assets.yes,
              actions: [
            AlertControllerAction(
                actionName: "Ok.",
                actionSeverity: AlertControllerActionSeverity.standard,
                onSelection: () => {})
          ]));
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    for (var element in widget.userSelectedOptions) {
      var safetyObject = Safety.detailMetaData.retrieveDetails(element);
      optionCards.add(ComplexSwitchCardElement(
          onEnable: () =>
              {userEnabledSettings.putIfAbsent(element, () => true)},
          onDisable: () => {
                if (userEnabledSettings.containsKey(element))
                  {userEnabledSettings.remove(element)}
              },
          cardLabel: safetyObject.name,
          cardBody: safetyObject.functionalityChange,
          cardIcon: safetyObject.icon));
    }

    ContainerWrapperElement selectionViewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          DividingHeaderElement(
              headerText: "Plan Confirmation",
              subheaderText:
                  "In order to enable your safety plan, you need to opt-in to agreeing the functionality of ${resourceValues.name} may change."),
          SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(2, screenSize),
              child: SingleChildScrollView(
                  child: (Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: optionCards,
              )))),
          const SizedBox(height: 20.0),
          Column(children: [
            StandardButtonElement(
                decorationVariant: userEnabledSettings.isEmpty
                    ? decorationPriority.inactive
                    : decorationPriority.standard,
                buttonTitle: 'I agree to these changes.',
                buttonHint:
                    "Agrees to functionality changes, and saves safety plan items.",
                buttonAction: updateSettings),
            const SizedBox(height: 8.0),
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: 'I want to edit my safety plan.',
                buttonHint:
                    "Disagrees to functionality changes, and takes you to the previous page to edit your settings.",
                buttonAction: () => {Navigator.pop(context)})
          ])
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: selectionViewLayout);
  }
}

/// A view used by Aureus to update the user's safety settings privately
/// in the Storage Layer.

// Dev Note: This view is located within the safety.dart file
// to make sure that access to SafetyPlan isn't accessible outside
// of the filescope. This is how access modifers work in Dart,
// which is frustrating but just how it be right now.

class _PlanModificationLoadingView extends StatefulWidget {
  final Map<SafetyPlanOptions, bool> userEnabledSettings;
  final Widget exitPoint;

  const _PlanModificationLoadingView(
      {required this.userEnabledSettings, required this.exitPoint});

  @override
  _PlanModificationLoadingViewState createState() =>
      _PlanModificationLoadingViewState();
}

class _PlanModificationLoadingViewState
    extends State<_PlanModificationLoadingView> {
  @override
  Widget build(BuildContext context) {
    var futureViewLayout = ContainerWrapperElement(children: [
      FutureBuilder<void>(
        future:
            _SafetyPlanStorageLayer().writeSettings(widget.userEnabledSettings),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the screen and the alert controller confirmation.
            notificationMaster.sendAlertControllerRequest(
                AlertControllerObject.singleAction(
                    onCancellation: () => {},
                    alertTitle: "Safety Plan Enabled",
                    alertBody:
                        "Your safety plan settings have been enabled, encrypted, and saved.",
                    alertIcon: Assets.yes,
                    actions: [
                  AlertControllerAction(
                      actionName: "Ok!",
                      actionSeverity: AlertControllerActionSeverity.standard,
                      onSelection: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => widget.exitPoint,
                                ))
                          })
                ]));
            return Column(
              children: const [],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: LoadingCircleElement());
          }
        },
      )
    ], containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: futureViewLayout,
    );
  }
}
