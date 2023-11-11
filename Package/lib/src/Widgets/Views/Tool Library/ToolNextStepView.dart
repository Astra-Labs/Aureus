// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL NEXT STEPS VIEW ----------*/
/// A view that displays next steps from a [CoreTool]

class ToolNextStepsView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// The name of the button that is the main CTA.
  final String mainCTATitle;

  /// What happens when the user clicks the main CTA of the next steps page.
  final VoidCallback onFinish;

  const ToolNextStepsView({
    required this.parentTool,
    required this.mainCTATitle,
    required this.onFinish,
  });

  @override
  _ToolNextStepsViewState createState() => _ToolNextStepsViewState();
}

class _ToolNextStepsViewState extends State<ToolNextStepsView> {
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
    var screenSize = MediaQuery.of(context).size;

    List<Widget> nextStepCards = [];
    var tool = widget.parentTool;

    for (var element in widget.parentTool.nextSteps.entries) {
      nextStepCards.add(GestureDetector(
        onTap: () => {element.value()},
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: StandardCardElement(
                cardLabel: element.key,
                decorationVariant: decorationPriority.standard)),
      ));
    }

    var fullWidthButtonElement = FullWidthButtonElement(
        buttonTitle: widget.mainCTATitle,
        buttonHint: 'Completes ' + widget.mainCTATitle,
        currentVariant: decorationPriority.important,
        buttonAction: widget.onFinish);

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
        HeadingOneText(
            data: 'You did a great job with ${tool.toolName}',
            textColor: decorationPriority.standard),
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
