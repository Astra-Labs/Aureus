import 'package:aureus/aureus.dart';

class SafetyPlanSettingsView extends StatefulWidget {
  const SafetyPlanSettingsView();

  @override
  _SafetyPlanSettingsViewState createState() => _SafetyPlanSettingsViewState();
}

class _SafetyPlanSettingsViewState extends State<SafetyPlanSettingsView> {
  Safety productSafetyObject = const Safety(
      frequencyUsage: SafetyPlanFrequency.singleUse,
      eligiblePlanOptions: [
        SafetyPlanOptions.deviceSandbox,
        SafetyPlanOptions.disableNotifications,
        SafetyPlanOptions.failedPasscodeDataDeletion
      ]);

  @override
  Widget build(BuildContext context) {
    List<Widget> eligibleOptionCards = [];

    var safety = resourceValues.safetySettings;

    var screenSize = size.logicalScreenSize();

    for (var element in productSafetyObject.eligiblePlanOptions) {
      eligibleOptionCards.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: StandardSwitchCardElement(
            switchDescription: safety.retrieveDetails(element).name),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        PageHeaderElement.withExit(
            pageTitle: 'Safety Plan Settings',
            onPageExit: () => {Navigator.pop(context)}),
        const Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: SingleChildScrollView(
                child: (ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: eligibleOptionCards)))),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
