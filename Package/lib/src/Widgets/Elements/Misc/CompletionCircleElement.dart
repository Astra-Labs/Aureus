import 'package:aureus/aureus.dart';

// A floating circle with a gradient that's filled according to how complete
// something is. Used for showing completion at the end of a task or action.

class ProgressIndicatorElement extends StatefulWidget {
  final double progressValue;

  const ProgressIndicatorElement({required this.progressValue});

  @override
  _ProgressIndicatorElementState createState() =>
      _ProgressIndicatorElementState();
}

class _ProgressIndicatorElementState extends State<ProgressIndicatorElement>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    // Checks user's accessibility settings to make sure animations are allowed,
    //and then initializes the animation controller.
    if (accessibility.accessFeatures.disableAnimations == false ||
        accessibility.accessFeatures.reduceMotion == false) {
      controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 3),
      )..addListener(() {
          setState(() {});
        });
    }

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingContainerElement(
      child: Stack(children: [
        CircularProgressIndicator(
          backgroundColor: coloration.inactiveColor(),
          color: coloration.accentColor(),
          value: widget.progressValue,
          strokeWidth: 2.0,
          semanticsLabel: 'Progress Indicator',
        ),
        HeadingTwoText('${widget.progressValue}%', decorationPriority.standard)
      ]),
    );
  }
}
