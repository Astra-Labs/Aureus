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
        padding: const EdgeInsets.all(8.0),
        child: element.returnTemplateSummary(),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemHeight(1, screenSize),
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Spacer(),
                      const CompletionCircleElement(progressValue: 100),
                      const SizedBox(height: 10.0),
                      HeadingOneText(
                          tool.toolName, decorationPriority.standard),
                      const SizedBox(height: 40.0),
                      FloatingContainerElement(
                          child: Container(
                              width: size.layoutItemWidth(1, screenSize),
                              height: size.layoutItemHeight(2, screenSize),
                              padding: const EdgeInsets.all(10.0),
                              decoration: LayerBackingDecoration(
                                      priority: decorationPriority.standard)
                                  .buildBacking(),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const TabSubheaderElement(
                                          title: 'Summary'),
                                      const Spacer(),
                                      SecondaryIconButtonElement(
                                          decorationVariant:
                                              decorationPriority.standard,
                                          buttonIcon: Assets.hamburgermenu,
                                          buttonHint: 'Summary Actions',
                                          buttonAction: () => {})
                                    ],
                                  ),
                                  const SizedBox(height: 15.0),
                                  SizedBox(
                                    width: size.layoutItemWidth(1, screenSize),
                                    height:
                                        size.layoutItemHeight(1, screenSize) *
                                            0.5,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: summaryItems,
                                      ),
                                    ),
                                  )
                                ],
                              ))),
                      const SizedBox(height: 20.0),
                      StandardButtonElement(
                          decorationVariant: decorationPriority.important,
                          buttonTitle: 'Go to next steps.',
                          buttonAction: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          navigationContainer(tool).nextSteps,
                                    ))
                              }),
                    ]),
              ))
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
