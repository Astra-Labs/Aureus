import 'package:aureus/aureus.dart';

class SafetyPlanFunctionalityView extends StatefulWidget {
  final List<SafetyPlanOptions> userSelectedOptions;

  const SafetyPlanFunctionalityView({required this.userSelectedOptions});

  @override
  _SafetyPlanFunctionalityViewState createState() =>
      _SafetyPlanFunctionalityViewState();
}

class _SafetyPlanFunctionalityViewState
    extends State<SafetyPlanFunctionalityView> {
  var safety = resourceValues.safetySettings;

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: "Safety Plan - Confirmation",
            subheaderText:
                "In order to enable your safety plan, you need to opt-in to agreeing the functionality of ${resourceValues.name} may change."),
        SizedBox(
          width: size.layoutItemWidth(1, screenSize),
          height: size.layoutItemHeight(2, screenSize),
          child: SingleChildScrollView(
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.userSelectedOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = widget.userSelectedOptions[index];
                  var safetyObject = resourceValues.safetySettings
                      .retrieveDetails(currentItem);

                  return Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: ComplexSwitchCardElement(
                        cardLabel: safetyObject.name,
                        cardBody: safetyObject.functionalityChange,
                        cardIcon: safetyObject.icon),
                  );
                }),
          ),
        ),
        SizedBox(height: 20.0),
        Column(
          children: [
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: 'I agree to these changes.',
                buttonAction: () => {}),
            SizedBox(height: 8.0),
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: 'I want to edit my safety plan.',
                buttonAction: () => {})
          ],
        ),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
