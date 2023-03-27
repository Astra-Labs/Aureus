import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SAFETY PLAN OPTIONS VIEW ----------*/
/// A view that allows the user to select their safety plan choices. This is automatically
/// pulled from [Safety], so it requires no developer input. You set what
/// options users can enable in your [AureusInformation] section of [packageVariables].

class SafetyPlanOptionsView extends StatefulWidget {
  /// The view that a user should be sent to when they're done.
  final Widget exitPoint;

  const SafetyPlanOptionsView({required this.exitPoint});

  @override
  _SafetyPlanOptionsViewState createState() => _SafetyPlanOptionsViewState();
}

class _SafetyPlanOptionsViewState extends State<SafetyPlanOptionsView> {
  List<SafetyPlanOptions> userSelectedOptions = [];

  @override
  Widget build(BuildContext context) {
    List<StandardSwitchCardElement> eligibleOptionCards = [];

    var safety = resourceValues.safetySettings;

    for (var element in safety.eligiblePlanOptions) {
      eligibleOptionCards.add(StandardSwitchCardElement(
          onEnable: () => {
                userSelectedOptions.add(element),
              },
          onDisable: () => {
                userSelectedOptions.remove(element),
              },
          cardLabel: Safety.detailMetaData.retrieveDetails(element).name));
    }

    var align = Align(
      alignment: Alignment.bottomRight,
      child: IconButtonElement(
        decorationVariant: userSelectedOptions.isEmpty
            ? decorationPriority.inactive
            : decorationPriority.important,
        buttonIcon: Assets.next,
        buttonHint: 'Go to next page',
        buttonAction: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SafetyPlanFunctionalityView(
                    exitPoint: widget.exitPoint,
                    userSelectedOptions: userSelectedOptions),
              ))
        },
        buttonPriority: buttonSize.primary,
      ),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        DividingHeaderElement(
            headerText: 'Plan Options',
            subheaderText:
                'Enable the options below to modify the functionality of ${resourceValues.name}.'),
        Column(children: eligibleOptionCards),
        align,
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
