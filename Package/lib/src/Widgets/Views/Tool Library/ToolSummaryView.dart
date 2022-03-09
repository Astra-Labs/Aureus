import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Elements/Misc/CompletionCircleElement.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolSummaryView extends StatefulWidget {
  final CoreTool parentTool;
  ToolSummaryView({required this.parentTool})
      : assert(parentTool.toolCards!.isNotEmpty == true,
            'Tool Summary View requires the parent CoreTool to have tool cards in the navigation container.');

  @override
  _ToolSummaryViewState createState() => _ToolSummaryViewState();
}

class _ToolSummaryViewState extends State<ToolSummaryView> {
  @override
  Widget build(BuildContext context) {
    var tool = widget.parentTool;
    var screenSize = size.logicalScreenSize();
    List<Widget> summaryItems = [];

    tool.toolCards!.forEach((element) {
      summaryItems.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: element.returnTemplateSummary(),
      ));
    });

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
                      Spacer(),
                      CompletionCircleElement(progressValue: 100),
                      SizedBox(height: 10.0),
                      HeadingOneText(
                          '${tool.toolName}', decorationPriority.standard),
                      SizedBox(height: 40.0),
                      FloatingContainerElement(
                          child: Container(
                              width: size.layoutItemWidth(1, screenSize),
                              height: size.layoutItemHeight(2, screenSize),
                              padding: EdgeInsets.all(10.0),
                              decoration: LayerBackingDecoration(
                                      priority: decorationPriority.standard)
                                  .buildBacking(),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      TabSubheaderElement(title: 'Summary'),
                                      Spacer(),
                                      SecondaryIconButtonElement(
                                          decorationVariant:
                                              decorationPriority.standard,
                                          buttonIcon: Assets.hamburgermenu,
                                          buttonTooltip: 'Summary Actions',
                                          buttonAction: () => {})
                                    ],
                                  ),
                                  SizedBox(height: 15.0),
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
                      SizedBox(height: 20.0),
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
