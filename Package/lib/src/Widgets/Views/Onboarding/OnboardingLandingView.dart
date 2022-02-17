import 'package:aureus/aureus.dart';

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
          Spacer(),
          Center(
            child: SizedBox(
                height: 65.0,
                width: 65.0,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                  image: coloration.resourceLogo().image,
                  fit: BoxFit.contain,
                )))),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingThreeText(
                  "I'm ${resourceValues.name}", decorationPriority.standard),
              HeadingOneText(
                  resourceValues.mission, decorationPriority.standard)
            ],
          ),
          Spacer(),
          Wrap(
            runSpacing: 8.0,
            children: [
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'Try out tools',
                  buttonIcon: Assets.expand,
                  buttonAction: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  resourceValues.onboardingDemo!,
                            ))
                      }),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'See the features',
                  buttonIcon: Assets.phone,
                  buttonAction: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  resourceValues.onboardingInfo!,
                            ))
                      }),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'Get started',
                  buttonIcon: Assets.next,
                  buttonAction: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => resourceValues.signUp!,
                            ))
                      })
            ],
          ),
          Spacer(),
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
