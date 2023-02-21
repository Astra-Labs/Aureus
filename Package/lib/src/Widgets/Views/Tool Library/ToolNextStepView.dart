import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL NEXT STEPS VIEW ----------*/

class ToolNextStepsView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// A map to collect titles and functions that perform next steps. These are
  /// where you want to connect the user to additional resources, other tools,
  /// donate buttons if you're running a survey, etc.
  final Map<String, VoidCallback> nextSteps;

  /// If you do not want to use the pre-templated tools flow,
  /// you can set a custom widget in this parameter to override the flow template.
  Widget? alternateCTAEntryPoint;

  ToolNextStepsView({
    required this.parentTool,
    required this.nextSteps,
    this.alternateCTAEntryPoint,
  });

  @override
  _ToolNextStepsViewState createState() => _ToolNextStepsViewState();
}

class _ToolNextStepsViewState extends State<ToolNextStepsView> {
  var popCount = 0;

  @override
  void initState() {
    sensation.prepare();
    sensation.createSensation(sensationType.praise);
    super.initState();
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    List<Widget> nextStepCards = [];
    var tool = widget.parentTool;

    for (var element in widget.nextSteps.entries) {
      nextStepCards.add(InkWell(
        onTap: () => {element.value()},
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: StandardCardElement(
                cardLabel: element.key,
                decorationVariant: decorationPriority.standard)),
      ));
    }

    var fullWidthButtonElement = FullWidthButtonElement(
        buttonTitle: 'Return home.',
        buttonHint: 'Takes you to the screen before entering the tool.',
        currentVariant: decorationPriority.important,
        buttonAction: () => {
              Navigator.of(context).popUntil((_) => popCount++ >= 4),
            });

    var column = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        BodyOneText('Choose next steps to go further, or return home.',
            decorationPriority.standard),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: nextStepCards,
          ),
        ),
        const SizedBox(height: 20.0),
      ],
    );

    var floatingContainerElement = FloatingContainerElement(
        child: Container(
      width: size.layoutItemWidth(1, screenSize),
      decoration:
          LayerBackingDecoration(decorationVariant: decorationPriority.inactive)
              .buildBacking(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: column,
      ),
    ));

    var column2 = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const Spacer(),
        SizedBox(width: 60.0, height: 60.0, child: coloration.resourceLogo()),
        const SizedBox(height: 20.0),
        HeadingOneText('You did a great job with ${tool.toolName}',
            decorationPriority.standard),
        const SizedBox(height: 40.0),
        const DividerElement(),
        const SizedBox(height: 40.0),
        floatingContainerElement,
        const Spacer(),
      ],
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: column2,
          ),
        ),
        const Spacer(),
        fullWidthButtonElement
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
