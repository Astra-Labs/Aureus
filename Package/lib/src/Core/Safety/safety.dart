import 'package:aureus/aureus.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/*--------- IMPORTANT ----------*/

/* 

Tampering with the implementation of the Safety Plan, or harvesting the 
information for marketing or data collection purposes is against the terms 
of the Aureus license, and can result in having your license revoked. 

*/

/*--------- ENUMS ----------*/

// ---------------------------------------------

/* An enum that determines if account creation is linked to the software. 

- If an account is not needed to access functionality within your app, use singleUse. 
- If an account IS needed, use reccuringUse. 

*/

enum SafetyPlanFrequency {
  singleUse, // software is used once, but doesn't have an account linked to it or isn't intended for long term visits.
  recurringUse // user has account with software, and is required to register to use.
}

// ---------------------------------------------
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

/* 

A class that metadata about what the different options mean. 

*/

class SafetyOptionDetails {
  final String name;
  final String description;
  final IconData icon;
  final String functionalityChange;

  const SafetyOptionDetails(
      {required this.name,
      required this.description,
      required this.icon,
      required this.functionalityChange});
}

// ---------------------------------------------

/*--------- SAFETY ----------*/

// A class that contains data regarding how to handle creating a
// safety plan for the user.

class Safety {
  /* 
  
  A map that contains Safety Plan options that ALL software can complete.
  If you pass an empty list to productEligiblePlanOptions, basePlanOptions
  will be used to create a safety plan for the user. 
  
  */
  static Map<SafetyPlanOptions, bool> basePlanOptions = {
    SafetyPlanOptions.deviceSandbox: true,
    SafetyPlanOptions.exitBar: true,
    SafetyPlanOptions.disableScreenshots: true
  };

  /* 
  
  A map that contains product specific Safety Plan options aside from the base options
  This is where YOU pass to Aureus what options you can adopt. Please ensure
  ALL ELIGIBLE plan options are choosen when passed to packageVariables in initialization. 
  
  */
  final List<SafetyPlanOptions> eligiblePlanOptions;
  final SafetyPlanFrequency frequencyUsage;
  final bool? isActionBarDevEnabled;
  final List<TabObject>? quickActionItems;

  const Safety(
      {required this.frequencyUsage,
      required this.eligiblePlanOptions,
      this.isActionBarDevEnabled = false,
      this.quickActionItems = const []});

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

  SafetyOptionDetails onlyNeccessaryEmailsDetails() {
    return const SafetyOptionDetails(
        name: 'Only receieve neccessary emails.',
        description:
            'Opts you out of any emails outside of required account functionality emails.',
        icon: Assets.mail,
        functionalityChange:
            'You will not be sent any emails outside of required account functionality.');
  }

  SafetyOptionDetails disableNotificationsDetails() {
    return SafetyOptionDetails(
        name: 'Disable notifications.',
        description:
            'Stops us from sending you push notifications that may show up on your phone / browser screen.',
        icon: Assets.paperplane,
        functionalityChange:
            'You will not receive push notifications from ${resourceValues.name}');
  }

  SafetyOptionDetails disableBiometricsDetails() {
    return SafetyOptionDetails(
        name: 'Disable biometrics.',
        description:
            'Turns off the ability to access or make changes to your account with biometric (TouchID / FaceID) authentication.',
        icon: Assets.person,
        functionalityChange:
            "You won't be able to use your face or fingerprints to perform actions on ${resourceValues.name}");
  }

  SafetyOptionDetails enable2FADetails() {
    return SafetyOptionDetails(
        name: 'Enable Two Factor Authentication.',
        description:
            "Asks you for a secondary passcode to finish signing in. You'll set this passcode later on.",
        icon: Assets.stop,
        functionalityChange:
            'You will not be able to access ${resourceValues.name} without a secondary passcode.');
  }

  SafetyOptionDetails localDataStorageDetails() {
    return const SafetyOptionDetails(
        name: 'Request local data storage.',
        description:
            'Keeps your data off of the cloud by encrypting it locally on your local device, instead of using a database and servers.',
        icon: Assets.pencil,
        functionalityChange:
            'This will stop you from having access to data back-ups and cloud access. You will only be able to access information from the device it was originally stored on.');
  }

  SafetyOptionDetails failedPasscodeDataDeletionDetails() {
    return SafetyOptionDetails(
        name: 'Delete data after failed log-in attempts.',
        description:
            'Automatically deletes all usuable data on ${resourceValues.name} if you enter your password or code incorrectly more than 10 times.',
        icon: Assets.alert,
        functionalityChange:
            'You will not be able to retrieve any account data after it has been deleted. To continue using ${resourceValues.name}, you will need to re-set up an account from scratch.');
  }

  SafetyOptionDetails exitBarDetails() {
    return SafetyOptionDetails(
        name: 'Show an emergency exit bar.',
        description:
            'Has an exit bar that allows you to quickly leave ${resourceValues.name} on every screen.',
        icon: Assets.expand,
        functionalityChange:
            'You will see an exit bar on every screen you access.');
  }

  SafetyOptionDetails disableScreenshotsDetails() {
    return SafetyOptionDetails(
        name: 'Disable screenshots.',
        description: 'Screenshots / screen recordings will be blocked.',
        icon: Assets.lock,
        functionalityChange:
            'You will not be able to take screenshots or screen recordings inside of ${resourceValues.name}');
  }

  SafetyOptionDetails deviceSandboxDetails() {
    return SafetyOptionDetails(
        name: 'Sandbox your device.',
        description:
            'Disables ${resourceValues.name} from doing anything outside of its container. This disables opening links, exporting items, sending messages, sending data to a server, and more.',
        icon: Assets.link,
        functionalityChange:
            'You will not be able to complete any functionality that requires ${resourceValues.name} to use a 3rd party service. This will completely block it from having contact with the rest of your device.');
  }

  SafetyOptionDetails logFailedAttemptsDetails() {
    return const SafetyOptionDetails(
        name: 'Track failed log-in attempts.',
        description: 'Keeps a log of failed attempts to access your account.',
        icon: Assets.alertmessage,
        functionalityChange:
            'You will have a log available in settings of failed log-in attempts.');
  }

  // Takes a list of fallbacks (options that a specific piece of code violates,
  // and the desired fallback to complete instead)
  Future<VoidCallback> actionSafetyCheck(BuildContext actionContext,
      List<SafetyPlanFallback> fallbackItems, VoidCallback primaryItem) async {
    VoidCallback executableCode = () => {};

    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();

    Widget alertControllerModal = SizedBox(
      width: screenWidth,
      height: screenHeight,
      child: FloatingContainerElement(
          child: Center(
              child: CenteredAlertControllerComponent(
                  alertData: AlertControllerObject.singleAction(
                      onCancellation: () => {Navigator.pop(actionContext)},
                      alertTitle: "Error!",
                      alertBody:
                          "You requested an action that was disabled by your Safety Plan settings.",
                      alertIcon: Icons.alternate_email_outlined,
                      actions: [
            AlertControllerAction(
                actionName: "Okay.",
                actionSeverity: AlertControllerActionSeverity.standard,
                onSelection: () => {Navigator.pop(actionContext)})
          ])))),
    );

    for (var element in fallbackItems) {
      if (await _SafetyPlan()._readSetting(element.safetyOption) == true) {
        if (element.fallbackOption == SafetyFallBackOptions.alternateCode) {
          executableCode = element.fallbackCode!;
        } else if (element.fallbackOption ==
            SafetyFallBackOptions.errorController) {
          executableCode = () => {
                Navigator.pushReplacement(
                    actionContext,
                    MaterialPageRoute(
                      builder: (context) => alertControllerModal,
                    ))
              };
        }
      }
    }

    return executableCode;
  }
}

/*--------- SAFETY PLAN ----------*/
/*

To reduce risk of abuse, all Safety Plan settings are handled directly by Aureus, 
and not passed to the developer. 

Aureus sets a safety plan through the 3 associated screens: 
- SafetyPlanOptInView
- SafetyPlanConfirmationView
- SafetyPlanFunctionalityView

After that, you interact with the Safety Plan by writing 

*/

class _SafetyPlan {
  final _storage = const FlutterSecureStorage();

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

      case SafetyPlanOptions.deviceSandbox:
        return 'deviceSandbox';

      case SafetyPlanOptions.logFailedAttempts:
        return 'logFailedAttempts';
    }
  }

  Future<bool> _readSetting(SafetyPlanOptions option) async {
    final settings = _storage.read(key: safetyPlanKey(option));

    return settings.toString() == "true" ? true : false;
  }

  Future<void> _writeSetting(SafetyPlanOptions option, bool isEnabled) async {
    await _storage.write(
        key: safetyPlanKey(option), value: isEnabled.toString());
  }

  Future<Map<SafetyPlanOptions, bool>> get readSettings async {
    // pull settings from local storage here

    Map<SafetyPlanOptions, bool> settings = {};

    for (var element in SafetyPlanOptions.values) {
      settings.addEntries([MapEntry(element, await _readSetting(element))]);
    }

    return settings;
  }

  //write settings directly to local storage
  Future<void> writeSettings(Map<SafetyPlanOptions, bool> newSettings) async {
    for (var element in newSettings.entries) {
      _writeSetting(element.key, element.value);
    }
  }
}

enum SafetyFallBackOptions { errorController, alternateCode }

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

// Safety Plan Functionality Opt-in View
//------------------------------------------------
// Dev Note: This view is located within the safety.dart file
// to make sure that access to SafetyPlan isn't accessible outside
// of the filescope.

class SafetyPlanFunctionalityView extends StatefulWidget {
  final List<SafetyPlanOptions> userSelectedOptions;
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
    _SafetyPlan().writeSettings(userEnabledSettings).then(
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
      var safetyObject = resourceValues.safetySettings.retrieveDetails(element);
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
        future: _SafetyPlan().writeSettings(widget.userEnabledSettings),
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
