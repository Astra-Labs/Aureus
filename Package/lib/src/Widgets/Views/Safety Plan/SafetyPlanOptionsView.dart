import 'package:aureus/aureus.dart';
import 'package:aureus/src/Objects/ResourceObserver.dart';

class SafetyPlanOptionsView extends StatefulWidget {
  const SafetyPlanOptionsView();

  @override
  _SafetyPlanOptionsViewState createState() => _SafetyPlanOptionsViewState();
}

class _SafetyPlanOptionsViewState extends State<SafetyPlanOptionsView> {
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

    var safety = packageVariables.safetyObject;

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
        DividingHeaderElement(
            headerText: 'Safety Plan - Options',
            subheaderText:
                'Enable the options below to modify the functionality of ${packageVariables.prodName}.'),
        Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize) * 0.6,
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
              buttonIcon: Assets.next,
              buttonTooltip: 'Go to next page',
              buttonAction: () => {print("go to next!")}),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
