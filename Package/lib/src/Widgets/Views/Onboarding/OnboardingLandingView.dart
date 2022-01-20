import 'package:aureus/aureus.dart';

//
//Doc Link:

class OnboardingLandingView extends StatefulWidget {
  const OnboardingLandingView();

  @override
  _OnboardingLandingViewState createState() => _OnboardingLandingViewState();
}

class _OnboardingLandingViewState extends State<OnboardingLandingView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: size.widthOf(weight: sizingWeight.w1),
                    child: coloration.resourceLogo())),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingThreeText("I'm ${apiVariables.prodName}",
                        decorationPriority.standard),
                    HeadingOneText(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nulla sem, eleifend tristique nulla ac.',
                        decorationPriority.standard)
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Wrap(
                  runSpacing: 8.0,
                  children: [
                    StandardIconButtonElement(
                        decorationVariant: decorationPriority.standard,
                        buttonTitle: 'Try out tools',
                        buttonIcon: Icons.pan_tool_outlined,
                        buttonAction: () => {print('tool demo!')}),
                    StandardIconButtonElement(
                        decorationVariant: decorationPriority.standard,
                        buttonTitle: 'See the features',
                        buttonIcon: Icons.featured_video_outlined,
                        buttonAction: () => {print('tool information!')}),
                    StandardIconButtonElement(
                        decorationVariant: decorationPriority.standard,
                        buttonTitle: 'Get started',
                        buttonIcon: Icons.play_arrow_outlined,
                        buttonAction: () => {print('onboarding!')})
                  ],
                )),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
