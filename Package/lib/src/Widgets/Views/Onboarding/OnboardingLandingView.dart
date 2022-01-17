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
    LayoutBuilder viewLayout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Column(
        children: [
          Align(alignment: Alignment.topCenter, child: Image.network('')),
          Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  HeadingThreeText(
                      "I'm ${}", decorationPriority.standard),
                  HeadingOneText('', decorationPriority.standard)
                ],
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                children: [
                  StandardIconButtonElement(
                      decorationVariant: decorationVariant,
                      buttonTitle: buttonTitle,
                      buttonIcon: buttonIcon,
                      buttonAction: buttonAction),
                  StandardIconButtonElement(
                      decorationVariant: decorationVariant,
                      buttonTitle: buttonTitle,
                      buttonIcon: buttonIcon,
                      buttonAction: buttonAction),
                  StandardIconButtonElement(
                      decorationVariant: decorationVariant,
                      buttonTitle: buttonTitle,
                      buttonIcon: buttonIcon,
                      buttonAction: buttonAction)
                ],
              ))
        ],
      );
    });

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
