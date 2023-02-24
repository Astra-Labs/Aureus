import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- TOOL SUMMARY VIEW ----------*/

class ToolSummaryView extends StatefulWidget {
  /// The tool that contains the data to be used in this template.
  final CoreTool parentTool;

  /// If you do not want to use the pre-templated tools flow,
  /// you can set a custom widget in this parameter to override the flow template.
  Widget? alternateCTAEntryPoint;

  ToolSummaryView({
    Key? key,
    required this.parentTool,
    this.alternateCTAEntryPoint,
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
        buttonTitle: 'Go to next steps.',
        buttonHint: "Finishes the tool, and takes you to find more actions.",
        buttonAction: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => navigationContainer(tool).nextSteps,
                  ))
            });

    var column = Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: const [
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
          const CompletionCircleElement(progressValue: 1),
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
