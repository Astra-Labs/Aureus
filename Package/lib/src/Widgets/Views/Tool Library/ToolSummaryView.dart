import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolSummaryView extends StatefulWidget {
  final CoreTool parentTool;
  ToolSummaryView({Key? key, required this.parentTool})
      : assert(parentTool.toolCards!.isNotEmpty == true,
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

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const CompletionCircleElement(progressValue: 1),
                  const SizedBox(height: 10.0),
                  HeadingThreeText(tool.toolName, decorationPriority.standard),
                  const SizedBox(height: 20.0),
                  FloatingContainerElement(
                      child: Container(
                          width: size.layoutItemWidth(1, screenSize),
                          constraints: BoxConstraints(
                              maxHeight:
                                  size.layoutItemHeight(1, screenSize) * 0.55,
                              minHeight: size.layoutItemHeight(5, screenSize)),
                          padding: const EdgeInsets.all(15.0),
                          decoration: LayerBackingDecoration(
                                  priority: decorationPriority.standard)
                              .buildBacking(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  const TabSubheaderElement(title: 'Summary'),
                                  const Spacer(),
                                  IconButtonElement(
                                    decorationVariant:
                                        decorationPriority.standard,
                                    buttonIcon: Assets.hamburgermenu,
                                    buttonHint: 'Summary Actions',
                                    buttonAction: () => {},
                                    buttonPriority: buttonSize.secondary,
                                  )
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
                          ))),
                  const SizedBox(height: 30.0),
                  StandardButtonElement(
                      decorationVariant: decorationPriority.important,
                      buttonTitle: 'Go to next steps.',
                      buttonHint:
                          "Finishes the tool, and takes you to find more actions.",
                      buttonAction: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      navigationContainer(tool).nextSteps,
                                ))
                          }),
                ]),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
