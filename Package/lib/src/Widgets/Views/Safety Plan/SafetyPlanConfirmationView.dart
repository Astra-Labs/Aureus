import 'package:aureus/aureus.dart';

//
//Doc Link:

class SafetyPlanConfirmationView extends StatefulWidget {
  const SafetyPlanConfirmationView();

  @override
  _SafetyPlanConfirmationViewState createState() =>
      _SafetyPlanConfirmationViewState();
}

class _SafetyPlanConfirmationViewState
    extends State<SafetyPlanConfirmationView> {
  Safety productSafetyObject = apiVariables.safetyPlan ??
      Safety(
          frequencyUsage: SafetyPlanFrequency.singleUse,
          productEligiblePlanOptions: [
            SafetyPlanOptions.deviceSandbox,
            SafetyPlanOptions.disableNotifications,
            SafetyPlanOptions.failedPasscodeDataDeletion
          ]);

  @override
  Widget build(BuildContext context) {
    List<StandardSwitchCardComponent> eligibleOptionCards = [];

    productSafetyObject.productEligiblePlanOptions.forEach((element) {
      eligibleOptionCards
          .add(StandardSwitchCardComponent(switchDescription: element.name));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        HeadingTwoText('Safety Plan', decorationPriority.standard),
        ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 4.0),
            children: eligibleOptionCards),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
