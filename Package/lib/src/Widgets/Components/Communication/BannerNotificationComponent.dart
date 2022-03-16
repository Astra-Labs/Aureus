import 'package:aureus/aureus.dart';

class BannerNotificationComponent extends StatefulWidget {
  final String body;
  final IconData icon;
  const BannerNotificationComponent({required this.body, required this.icon});

  @override
  _BannerNotificationComponentState createState() =>
      _BannerNotificationComponentState();
}

class _BannerNotificationComponentState
    extends State<BannerNotificationComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> slideAnimation;
  late Animation<double> progressAnimation;
  late SlideTransition slideOverTransition;
  late TickerFuture animationDirection;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 15),
    )..addListener(() {
        // Removes notification from widget tree when
        // progress bar is done.
        if (progressAnimation.value == 1.0) {
          print('item is done!');
        } else {
          setState(() {});
        }
      });

    slideAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.0,
        0.1,
        curve: Curves.decelerate,
      ),
    );

    progressAnimation = CurvedAnimation(
      parent: animationController,
      curve: const Interval(
        0.1,
        1.0,
        curve: Curves.linear,
      ),
    );

    slideOverTransition = SlideTransition(
        position: Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(0.5, 0.0),
    ).animate(progressAnimation));

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void afterBuild() {
    setState(() {
      // Reverses the animation controller and runs on launch VoidCallback
      animationController.reverse();
      print('done bitch');
      //dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    //WidgetsBinding.instance!.addPostFrameCallback((_) => afterBuild);

    var screenSize = size.logicalScreenSize();
    var slidingProgressBar = LinearProgressIndicator(
      value: progressAnimation.value,
      backgroundColor: coloration.inactiveColor(),
      color: coloration.accentColor(),
      minHeight: 5.0,
      semanticsLabel: 'Notification Timer',
      semanticsValue: 'Time Left: ${1.0 - slideAnimation.value * 15} seconds',
    );

    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              minHeight: size.layoutItemHeight(5, screenSize),
              maxHeight: size.layoutItemHeight(5, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    BodyTwoText(widget.body, decorationPriority.standard),
                    const Spacer(),
                    const IconBadge(
                        badgeIcon: Assets.alertmessage,
                        badgePriority: decorationPriority.important),
                  ],
                ),
              ),
              const Spacer(),
              const DividerElement(),
              const SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: slidingProgressBar,
              ),
              const SizedBox(height: 10.0),
            ],
          )),
    );
  }
}
