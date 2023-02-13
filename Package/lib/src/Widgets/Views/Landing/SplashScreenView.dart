import 'dart:async';

import 'package:aureus/aureus.dart';

/*--------- SPLASH SCREEN VIEW ----------*/

class SplashScreenView extends StatefulWidget {
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
    timer = Timer(const Duration(seconds: 5), () {
      widget.onLaunch();
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
            gradient: palette.brightness() == Brightness.light
                ? palette.lightGradient()
                : palette.darkGradient()),
        child: Center(
          child: Column(
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
              HeadingTwoText(resourceValues.name, decorationPriority.standard),
              const Spacer(),
            ],
          ),
        ));
  }
}
