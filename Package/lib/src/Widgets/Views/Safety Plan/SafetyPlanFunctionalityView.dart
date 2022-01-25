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
  var safety = apiVariables.safetyObject;

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: "Functionality",
            subheaderText:
                "In order to enable your safety plan, you need to opt-in to agreeing the functionality of ${apiVariables.prodName} may change."),
        SizedBox(
          width: size.layoutItemWidth(1, size.logicalScreenSize),
          height: size.layoutItemHeight(1, size.logicalScreenSize) * 0.6,
          child: SingleChildScrollView(
            child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: widget.userSelectedOptions.length,
                itemBuilder: (BuildContext context, int index) {
                  var currentItem = widget.userSelectedOptions[index];
                  var safetyObject =
                      apiVariables.safetyObject.retrieveDetails(currentItem);

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
                decorationVariant: decorationPriority.important,
                buttonTitle: 'I agree to these changes.',
                buttonAction: () => {}),
            SizedBox(height: 8.0),
            StandardButtonElement(
                decorationVariant: decorationPriority.important,
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
