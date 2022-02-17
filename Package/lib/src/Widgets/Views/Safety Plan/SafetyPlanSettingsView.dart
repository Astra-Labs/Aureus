import 'package:aureus/aureus.dart';

class SafetyPlanSettingsView extends StatefulWidget {
  const SafetyPlanSettingsView();

  @override
  _SafetyPlanSettingsViewState createState() => _SafetyPlanSettingsViewState();
}

class _SafetyPlanSettingsViewState extends State<SafetyPlanSettingsView> {
  Safety productSafetyObject = Safety(
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

    productSafetyObject.eligiblePlanOptions.forEach((element) {
      eligibleOptionCards.add(Padding(
        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: StandardSwitchCardComponent(
            switchDescription: safety.retrieveDetails(element).name),
      ));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        SecondaryIconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.no,
            buttonTooltip: 'Return to settings page.',
            buttonAction: () => {}),
        DividingHeaderElement(
            headerText: 'Safety Plan - Settings',
            subheaderText: 'Change your safety plan settings here.'),
        Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize) * 0.8,
            child: SingleChildScrollView(
                child: (ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(12.0),
                    children: eligibleOptionCards)))),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
