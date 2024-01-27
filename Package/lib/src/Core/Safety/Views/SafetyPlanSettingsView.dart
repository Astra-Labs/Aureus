part of aureus_safety_plan;

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SAFETY PLAN SETTINGS VIEW ----------*/
/// A view that allows the user to modify their Safety Plan settings. This is
/// automatically pulled from [Safety], so it requires no developer input.

class SafetyPlanSettingsView extends StatefulWidget {
  const SafetyPlanSettingsView();

  @override
  _SafetyPlanSettingsViewState createState() => _SafetyPlanSettingsViewState();
}

class _SafetyPlanSettingsViewState extends State<SafetyPlanSettingsView> {
  late Safety safetyObject;
  List<Widget> eligibleOptionCards = [];

  @override
  void initState() {
    super.initState();

    for (var element in resourceValues.safetySettings!.eligiblePlanOptions) {
      eligibleOptionCards.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
          child: StandardSwitchCardElement(
            isSwitchEnabled: true,
            onEnable: () => {
              writeSettingToStorage(element, true),
            },
            onDisable: () => {
              writeSettingToStorage(element, false),
            },
            cardLabel: Safety.detailMetaData.retrieveDetails(element).name,
          ),
        ),
      );
    }
  }

  void showUpdatedConfirmation(SafetyPlanOptions option) {
    var description = Safety.detailMetaData.retrieveDetails(option).name +
        "has been updated!";
    notificationMaster.sendAlertNotificationRequest(description, Assets.lock);
  }

  void writeSettingToStorage(SafetyPlanOptions option, bool state) {
    _SafetyPlanStorageLayer()
        ._writeSetting(option, state)
        .then((value) => showUpdatedConfirmation(option));
  }

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        PageHeaderElement.withExit(
          pageTitle: 'Safety Plan Settings',
          onPageExit: () => {
            Navigator.pop(context),
          },
        ),
        Column(
          children: eligibleOptionCards,
        ),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
