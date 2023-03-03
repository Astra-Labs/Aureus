import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

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

    for (var element in productSafetyObject.eligiblePlanOptions) {
      eligibleOptionCards.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: StandardSwitchCardElement(
            onEnable: () => {},
            onDisable: () => {},
            cardLabel: Safety.detailMetaData.retrieveDetails(element).name),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        PageHeaderElement.withExit(
            pageTitle: 'Safety Plan Settings',
            onPageExit: () => {Navigator.pop(context)}),
        const Spacer(),
        Column(
          children: eligibleOptionCards,
        ),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
