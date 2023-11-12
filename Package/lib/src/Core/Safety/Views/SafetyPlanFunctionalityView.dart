part of aureus_safety_plan;

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
      },
      onError: (error) {
        notificationMaster.sendAlertControllerRequest(
          AlertControllerObject.singleAction(
            onCancellation: () => {},
            alertTitle: "Uh oh.",
            alertBody: "An error saving your safety plan has occured: $error.",
            alertIcon: Assets.yes,
            actions: [
              AlertControllerAction(
                  actionName: "Ok.",
                  actionSeverity: AlertControllerActionSeverity.standard,
                  onSelection: () => {})
            ],
          ),
        );
      },
    );
  }

  void editElement(bool add, SafetyPlanOptions element) {
    if (add == true) {
      setState(
        () {
          userEnabledSettings.putIfAbsent(element, () => true);
        },
      );
    } else {
      if (userEnabledSettings.containsKey(element) == true) {
        setState(
          () {
            userEnabledSettings.remove(element);
          },
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    for (var element in widget.userSelectedOptions) {
      var safetyObject = Safety.detailMetaData.retrieveDetails(element);
      optionCards.add(
        ComplexSwitchCardElement(
            onEnable: () => {
                  editElement(true, element),
                },
            onDisable: () => {
                  editElement(false, element),
                },
            cardLabel: safetyObject.name,
            cardBody: safetyObject.functionalityChange,
            cardIcon: safetyObject.icon),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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
              )),
            ),
          ),
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
              buttonAction: () => {Navigator.pop(context)},
            )
          ])
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: selectionViewLayout);
  }
}
