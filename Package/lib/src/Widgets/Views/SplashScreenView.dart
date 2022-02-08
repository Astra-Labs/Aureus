import 'package:aureus/aureus.dart';

class SplashScreenView extends StatefulWidget {
  final VoidCallback onLaunch;
  const SplashScreenView({required this.onLaunch});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: BoxDecoration(
            gradient: brightness() == Brightness.light
                ? lightGradient()
                : darkGradient()),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Spacer(),
              Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: coloration.resourceLogo().image,
                    fit: BoxFit.cover,
                  ))),
              SizedBox(height: 40.0),
              HeadingTwoText(
                  '${resourceValues.name}', decorationPriority.standard),
              Spacer(),
            ],
          ),
        ));
  }
}
