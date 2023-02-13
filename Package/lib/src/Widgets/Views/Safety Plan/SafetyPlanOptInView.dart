import 'package:aureus/aureus.dart';

/*--------- SAFETY PLAN OPT IN VIEW ----------*/

class SafetyPlanOptInView extends StatefulWidget {
  final Widget exitPoint;

  const SafetyPlanOptInView({required this.exitPoint});

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
            const IconBadge(
                badgeIcon: Assets.lock,
                badgePriority: decorationPriority.standard)
          ]),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.center,
          child: BodyOneText(
              "Our software has added safety features for people in dangerous situations. This information will be encrypted, and stored locally on your device. You can add these features now, or enable them anytime in app settings.",
              decorationPriority.standard),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(children: [
            StandardButtonElement(
                decorationVariant: decorationPriority.important,
                buttonTitle: 'I want additional safety features.',
                buttonHint: 'Takes you to enable safety features.',
                buttonAction: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SafetyPlanOptionsView(
                              exitPoint: widget.exitPoint,
                            ),
                          ))
                    }),
            SizedBox(height: size.heightOf(weight: sizingWeight.w0) / 2),
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: "I don't want safety features.",
                buttonHint: "Continues without enabling safety features",
                buttonAction: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => widget.exitPoint,
                          ))
                    })
          ]),
        )
      ],
    );
    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
