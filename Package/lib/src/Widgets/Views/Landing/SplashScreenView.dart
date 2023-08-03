import 'dart:async';
import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SPLASH SCREEN VIEW ----------*/
/// A templatized splash screen view. This is the first view your users should
/// see, and where you should run any downloading / onboarding logic checks.

class SplashScreenView extends StatefulWidget {
  /// A function that the splash screen should run after the animation has completed.
  /// This should be where you navigate to the next page, and do any logic in determing
  /// if the user has completed the onboarding process or not.
  final VoidCallback onLaunch;
  const SplashScreenView({required this.onLaunch});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer(const Duration(seconds: 3), () {
      widget.onLaunch();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Spacer(),
        Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: coloration.resourceLogo().image,
              fit: BoxFit.cover,
            ))),
        const SizedBox(height: 40.0),
        HeadingTwoText(resourceValues.name ?? "", decorationPriority.standard),
        const Spacer(),
      ],
    );

    return Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
            gradient: palette.brightness() == Brightness.light
                ? palette.lightGradient()
                : palette.darkGradient()),
        child: Center(
          child: column,
        ));
  }
}
