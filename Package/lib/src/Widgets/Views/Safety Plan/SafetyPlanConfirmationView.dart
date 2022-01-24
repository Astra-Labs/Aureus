import 'package:aureus/aureus.dart';

class SafetyPlanConfirmationView extends StatefulWidget {
  const SafetyPlanConfirmationView();

  @override
  _SafetyPlanConfirmationViewState createState() =>
      _SafetyPlanConfirmationViewState();
}

class _SafetyPlanConfirmationViewState
    extends State<SafetyPlanConfirmationView> {
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

    productSafetyObject.eligiblePlanOptions.forEach((element) {
      eligibleOptionCards.add(Padding(
        padding: EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: StandardSwitchCardComponent(switchDescription: element.name),
      ));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        HeadingTwoText('Safety Options', decorationPriority.standard),
        SizedBox(height: 8.0),
        BodyOneText(
            'Enable the options below to modify the functionality of ${apiVariables.prodName}.',
            decorationPriority.standard),
        SizedBox(height: 12.0),
        DividerElement(),
        Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, size.logicalScreenSize),
            height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.6,
            child: SingleChildScrollView(
                child: (ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(12.0),
                    children: eligibleOptionCards)))),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Icons.navigate_next_outlined,
              buttonTooltip: 'Go to next page',
              buttonAction: () => {print("go to next!")}),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
