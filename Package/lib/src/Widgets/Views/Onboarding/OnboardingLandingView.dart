import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- ONBOARDING LANDING VIEW ----------*/
/// A view that should be where the user 'lands' if they haven't been onboarded.
/// This landing view gets autopopulated with the data from [AureusNavigationTree].

class OnboardingLandingView extends StatefulWidget {
  /// A list of [StandardIconButtonElement]s that represent the main
  /// Calls To Action that you want the user to take. These should be limited to
  /// 1 or 2 of the most important things on the landing page.
  final List<StandardIconButtonElement> actionButtons;

  const OnboardingLandingView({
    required this.actionButtons,
  });

  @override
  _OnboardingLandingViewState createState() => _OnboardingLandingViewState();
}

class _OnboardingLandingViewState extends State<OnboardingLandingView> {
  List<Widget> buttons = [];

  @override
  void initState() {
    super.initState();

    for (var element in widget.actionButtons) {
      buttons.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 8.0),
        child: element,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        const Spacer(),
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
        const Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeadingThreeText(
                "I'm ${resourceValues.name}", decorationPriority.standard),
            HeadingOneText(
                data: resourceValues.mission ?? "",
                textColor: decorationPriority.standard)
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: buttons,
        ),
        const Spacer(),
      ],
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
