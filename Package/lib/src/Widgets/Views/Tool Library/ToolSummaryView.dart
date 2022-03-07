import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolSummaryView extends StatefulWidget {
  final CoreTool parentTool;
  ToolSummaryView({required this.parentTool})
      : assert(parentTool.navigationContainer.toolCards!.isNotEmpty == true,
            'Tool Summary View requires the parent CoreTool to have tool cards in the navigation container.');

  @override
  _ToolSummaryViewState createState() => _ToolSummaryViewState();
}

class _ToolSummaryViewState extends State<ToolSummaryView> {
  @override
  Widget build(BuildContext context) {
    var tool = widget.parentTool;
    List<Widget> summaryItems = [];

    tool.navigationContainer.toolCards!.forEach((element) {
      summaryItems.add(Padding(
        padding: EdgeInsets.all(8.0),
        child: element.returnTemplateSummary(),
      ));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        Spacer(),
        CircularProgressIndicator(),
        SizedBox(height: 20.0),
        HeadingOneText('${tool.toolName}', decorationPriority.standard),
        SizedBox(height: 20.0),
        FloatingContainerElement(
            child: Container(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TabSubheaderElement(title: 'Summary'),
                        SecondaryIconButtonElement(
                            decorationVariant: decorationPriority.standard,
                            buttonIcon: Assets.hamburgermenu,
                            buttonTooltip: 'Summary Actions',
                            buttonAction: () => {})
                      ],
                    ),
                    SizedBox(height: 15.0),
                    SingleChildScrollView(
                      child: ListView(
                        children: summaryItems,
                      ),
                    )
                  ],
                ))),
        SizedBox(height: 20.0),
        StandardButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Go to next steps.',
            buttonAction: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            tool.navigationContainer.nextSteps,
                      ))
                }),
        Spacer(),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
