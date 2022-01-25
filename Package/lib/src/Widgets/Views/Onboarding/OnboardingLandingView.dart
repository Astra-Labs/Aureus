import 'dart:ui';

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
                width: size.widthOf(weight: sizingWeight.w1),
                child: coloration.resourceLogo()),
          ),
          Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingThreeText(
                  "I'm ${apiVariables.prodName}", decorationPriority.standard),
              HeadingOneText(
                  apiVariables.missionTagline, decorationPriority.standard)
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
                  buttonAction: () => {print('tool demo!')}),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'See the features',
                  buttonIcon: Assets.phone,
                  buttonAction: () => {print('tool information!')}),
              StandardIconButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'Get started',
                  buttonIcon: Assets.next,
                  buttonAction: () => {print('onboarding!')})
            ],
          ),
          Spacer(),
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
