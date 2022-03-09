import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolNextStepsView extends StatefulWidget {
  final CoreTool parentTool;
  final Map<String, VoidCallback> nextSteps;
  const ToolNextStepsView({required this.parentTool, required this.nextSteps});

  @override
  _ToolNextStepsViewState createState() => _ToolNextStepsViewState();
}

class _ToolNextStepsViewState extends State<ToolNextStepsView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    List<Widget> nextStepCards = [];
    var tool = widget.parentTool;

    widget.nextSteps.entries.forEach((element) {
      nextStepCards.add(InkWell(
        onTap: () => {element.value()},
        child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
            child: StandardCardElement(
                cardLabel: element.key,
                decorationVariant: decorationPriority.standard)),
      ));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Spacer(),
                SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: coloration.resourceLogo()),
                SizedBox(height: 10.0),
                HeadingOneText('You did a great job with ${tool.toolName}',
                    decorationPriority.standard),
                SizedBox(height: 40.0),
                DividerElement(),
                SizedBox(height: 40.0),
                FloatingContainerElement(
                    child: Container(
                  width: size.layoutItemWidth(1, screenSize),
                  height: size.layoutItemHeight(2, screenSize),
                  decoration: LayerBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        HeadingThreeText(
                            'Next Steps', decorationPriority.standard),
                        SizedBox(height: 5.0),
                        BodyOneText(
                            'Choose next steps to go further, or return home.',
                            decorationPriority.standard),
                        SizedBox(height: 10.0),
                        SizedBox(
                          width: size.layoutItemWidth(1, screenSize),
                          height: size.layoutItemHeight(1, screenSize) * 0.4,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: nextStepCards,
                            ),
                          ),
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )),
                Spacer(),
              ],
            ),
          ),
        ),
        Spacer(),
        FullWidthButtonElement(
            buttonTitle: 'Return home.',
            currentVariant: decorationPriority.important,
            buttonAction: () => {Navigator.pop(context)})
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
