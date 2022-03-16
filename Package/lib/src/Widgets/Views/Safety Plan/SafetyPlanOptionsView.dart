import 'package:aureus/aureus.dart';

class SafetyPlanOptionsView extends StatefulWidget {
  const SafetyPlanOptionsView();

  @override
  _SafetyPlanOptionsViewState createState() => _SafetyPlanOptionsViewState();
}

class _SafetyPlanOptionsViewState extends State<SafetyPlanOptionsView> {
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
        child: StandardSwitchCardComponent(
            switchDescription: safety.retrieveDetails(element).name),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Safety Plan - Options',
            subheaderText:
                'Enable the options below to modify the functionality of ${resourceValues.name}.'),
        const Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize) * 0.6,
            child: SingleChildScrollView(
                child: (ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(12.0),
                    children: eligibleOptionCards)))),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Assets.next,
              buttonHint: 'Go to next page',
              buttonAction: () => {print("go to next!")}),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
