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
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        HeadingTwoText("Functionality", decorationPriority.standard),
        SizedBox(height: 8.0),
        BodyTwoText(
            "In order to enable your safety plan, you need to opt-in to agreeing the functionality of the app may change.",
            decorationPriority.standard),
        Spacer(),
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

                  return Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                    child: ComplexSwitchCardElement(
                        cardLabel: currentItem.name,
                        cardBody: '',
                        cardIcon: Icons.settings_accessibility_outlined),
                  );
                }),
          ),
        ),
        Spacer(),
        Container(
            decoration:
                CardBackingDecoration(priority: decorationPriority.inactive)
                    .buildBacking(),
            padding: EdgeInsets.all(12.0),
            child: Column(
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
            )),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
