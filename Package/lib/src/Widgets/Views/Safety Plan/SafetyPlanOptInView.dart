import 'package:aureus/aureus.dart';

//
//Doc Link:

class SafetyPlanOptInView extends StatefulWidget {
  const SafetyPlanOptInView();

  @override
  _SafetyPlanOptInViewState createState() => _SafetyPlanOptInViewState();
}

class _SafetyPlanOptInViewState extends State<SafetyPlanOptInView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        Align(
          alignment: Alignment.topCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            HeadingTwoText("Safety Check", decorationPriority.standard),
            IconBadge(
                badgeIcon: Icons.lock_outline,
                badgePriority: decorationPriority.important)
          ]),
        ),
        Spacer(),
        Align(
          alignment: Alignment.center,
          child: BodyOneText(
              "Our software has added safety features for people in dangerous situations. \n\nThis information will be encrypted, and stored locally on your device.\n\nYou can add these features now, or enable them anytime in app settings.",
              decorationPriority.standard),
        ),
        Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(children: [
            StandardButtonElement(
                decorationVariant: decorationPriority.important,
                buttonTitle: 'I want additional safety features.',
                buttonAction: () => {}),
            SizedBox(height: size.heightOf(weight: sizingWeight.w0) / 2),
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: "I don't want safety features.",
                buttonAction: () => {})
          ]),
        )
      ],
    );
    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
