// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL SUMMARY VIEW ----------*/
/// A view that displays a summary of what a user did in [ToolTemplateCardCarouselView].
/// You must use the [ToolTemplateCardCarouselView] before showing this view, or you
/// will get many errors.

class ToolSummaryView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// An action to take on the bottom of the page
  final VoidCallback mainCTAAction;

  /// What to call the action
  final String mainCTATitle;

  /// Whether or not the progress circle should be shown.
  final bool? showProgressCircle;

  ToolSummaryView({
    Key? key,
    required this.parentTool,
    required this.mainCTAAction,
    required this.mainCTATitle,
    this.showProgressCircle,
  })  : assert(parentTool.toolCards!.isNotEmpty == true,
            'Tool Summary View requires the parent CoreTool to have tool cards in the navigation container.'),
        super(key: key);

  @override
  _ToolSummaryViewState createState() => _ToolSummaryViewState();
}

class _ToolSummaryViewState extends State<ToolSummaryView> {
  @override
  Widget build(BuildContext context) {
    var tool = widget.parentTool;
    var screenSize = size.logicalScreenSize();
    List<Widget> summaryItems = [];

    for (var element in tool.toolCards!) {
      summaryItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        child: element.returnTemplateSummary(),
      ));
    }

    var standardButtonElement = StandardButtonElement(
        decorationVariant: decorationPriority.important,
        buttonTitle: widget.mainCTATitle,
        buttonHint: "Completes " + widget.mainCTATitle,
        buttonAction: () => {
              widget.mainCTAAction(),
            });

    var column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            TabSubheaderElement(title: 'Summary'),
            Spacer(),
          ],
        ),
        const SizedBox(height: 15.0),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: summaryItems,
            ),
          ),
        )
      ],
    );

    var floatingContainerElement = FloatingContainerElement(
        child: Container(
            width: size.layoutItemWidth(1, screenSize),
            constraints: BoxConstraints(
                maxHeight: size.layoutItemHeight(1, screenSize) * 0.55,
                minHeight: size.layoutItemHeight(5, screenSize)),
            padding: const EdgeInsets.all(15.0),
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.standard)
                .buildBacking(),
            child: column));

    var column2 = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.showProgressCircle == true
              ? const CompletionCircleElement(progressValue: 1)
              : const SizedBox(
                  height: 5,
                ),
          const SizedBox(height: 10.0),
          HeadingThreeText(tool.toolName, decorationPriority.standard),
          const SizedBox(height: 20.0),
          floatingContainerElement,
          const SizedBox(height: 30.0),
          standardButtonElement,
        ]);

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          Center(
            child: column2,
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
