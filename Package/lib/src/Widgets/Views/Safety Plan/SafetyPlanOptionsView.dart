import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SAFETY PLAN OPTIONS VIEW ----------*/

class SafetyPlanOptionsView extends StatefulWidget {
  ///
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
    var screenSize = size.logicalScreenSize();

    for (var element in safety.eligiblePlanOptions) {
      eligibleOptionCards.add(StandardSwitchCardElement(
          onEnable: () => {userSelectedOptions.add(element)},
          onDisable: () => {userSelectedOptions.remove(element)},
          switchDescription:
              Safety.detailMetaData.retrieveDetails(element).name));
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

    var sizedBox = SizedBox(
        width: size.layoutItemWidth(1, screenSize),
        height: size.layoutItemHeight(1, screenSize) * 0.6,
        child: SingleChildScrollView(
            child: (ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                children: eligibleOptionCards))));

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Plan Options',
            subheaderText:
                'Enable the options below to modify the functionality of ${resourceValues.name}.'),
        const Spacer(),
        sizedBox,
        const Spacer(),
        align
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
