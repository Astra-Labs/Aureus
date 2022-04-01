import 'package:aureus/aureus.dart';

class SafetyPlanOptionsView extends StatefulWidget {
  final Widget exitPoint;

  const SafetyPlanOptionsView({required this.exitPoint});

  @override
  _SafetyPlanOptionsViewState createState() => _SafetyPlanOptionsViewState();
}

class _SafetyPlanOptionsViewState extends State<SafetyPlanOptionsView> {
  List<SafetyPlanOptions> userSelectedOptions = [];

  @override
  Widget build(BuildContext context) {
    List<StandardSwitchCardElement> eligibleOptionCards = [];

    var safety = resourceValues.safetySettings;
    var screenSize = size.logicalScreenSize();

    for (var element in safety.eligiblePlanOptions) {
      eligibleOptionCards.add(StandardSwitchCardElement(
          switchDescription: safety.retrieveDetails(element).name));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Plan Options',
            subheaderText:
                'Enable the options below to modify the functionality of ${resourceValues.name}.'),
        const Spacer(),
        SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(1, screenSize) * 0.6,
            child: SingleChildScrollView(
                child: (ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                    children: eligibleOptionCards)))),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Assets.next,
              buttonHint: 'Go to next page',
              buttonAction: () => {
                    eligibleOptionCards.forEach((element) {
                      if (element.isSwitchEnabled == true) {
                        var index = eligibleOptionCards.indexOf(element);
                        userSelectedOptions
                            .add(safety.eligiblePlanOptions.elementAt(index));
                      }
                    }),
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SafetyPlanFunctionalityView(
                              exitPoint: widget.exitPoint,
                              userSelectedOptions: userSelectedOptions),
                        ))
                  }),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
