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

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
      children: [
        Center(
          child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Spacer(),
                SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: coloration.resourceLogo()),
                const SizedBox(height: 20.0),
                HeadingOneText('You did a great job with ${tool.toolName}',
                    decorationPriority.standard),
                const SizedBox(height: 40.0),
                const DividerElement(),
                const SizedBox(height: 40.0),
                FloatingContainerElement(
                    child: Container(
                  width: size.layoutItemWidth(1, screenSize),
                  decoration: LayerBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        BodyOneText(
                            'Choose next steps to go further, or return home.',
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
                    ),
                  ),
                )),
                const Spacer(),
              ],
            ),
          ),
        ),
        const Spacer(),
        FullWidthButtonElement(
            buttonTitle: 'Return home.',
            buttonHint: 'Takes you to the screen before entering the tool.',
            currentVariant: decorationPriority.important,
            buttonAction: () => {
                  Navigator.of(context).popUntil((_) => popCount++ >= 4),
                })
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
