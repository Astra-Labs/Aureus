import 'package:aureus/aureus.dart';

class SplashScreenView extends StatefulWidget {
  final VoidCallback onLaunch;
  const SplashScreenView({required this.onLaunch});

  @override
  _SplashScreenViewState createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late TickerFuture animationDirection;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    animationController.forward();
  }

  void afterBuild() {
    setState(() {
      // Reverses the animation controller and runs on launch VoidCallback
      animationController.reverse();
      widget.onLaunch();
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => afterBuild);

    var screenSize = size.logicalScreenSize();

    return CircleAnimation(
      child: Container(
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
                HeadingTwoText(
                    resourceValues.name, decorationPriority.standard),
                const Spacer(),
              ],
            ),
          )),
      animation: animation,
      centerAlignment: Alignment.centerRight,
      centerOffset: Offset.zero,
    );
  }
}
