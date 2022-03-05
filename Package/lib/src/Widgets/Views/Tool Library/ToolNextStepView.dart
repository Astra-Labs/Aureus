import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ToolNextStepsView extends StatefulWidget {
  final CoreTool parentTool;

  const ToolNextStepsView({required this.parentTool});

  @override
  _ToolNextStepsViewState createState() => _ToolNextStepsViewState();
}

class _ToolNextStepsViewState extends State<ToolNextStepsView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    var nextStepCards = [];
    var tool = widget.parentTool;

    tool.nextSteps.forEach((element) {
      nextStepCards.add(InkWell(
        onTap: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => element.navigationContainer.entryPoint,
              ))
        },
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StandardCardElement(
                cardLabel: element.toolName,
                decorationVariant: decorationPriority.standard)),
      ));
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          child: Column(
            children: [
              Spacer(),
              coloration.resourceLogo(),
              HeadingOneText('You did a great job with ${tool.toolName}',
                  decorationPriority.standard),
              Divider(),
              SizedBox(height: 40.0),
              FloatingContainerElement(
                  child: Container(
                child: Column(
                  children: [
                    HeadingThreeText('Next Steps', decorationPriority.standard),
                    BodyOneText('', decorationPriority.standard),
                    ListView(),
                  ],
                ),
              )),
              Spacer(),
            ],
          ),
        ),
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
