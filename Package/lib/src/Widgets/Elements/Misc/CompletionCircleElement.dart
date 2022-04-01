import 'package:aureus/aureus.dart';

// A floating circle with a gradient that's filled according to how complete
// something is. Used for showing completion at the end of a task or action.

class CompletionCircleElement extends StatefulWidget {
  final double progressValue;

  const CompletionCircleElement({required this.progressValue});

  @override
  _CompletionCircleElementState createState() =>
      _CompletionCircleElementState();
}

class _CompletionCircleElementState extends State<CompletionCircleElement>
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
        upperBound: widget.progressValue,
        duration: const Duration(seconds: 2),
      )..addListener(() {
          setState(() {});
        });
      controller.forward();
      super.initState();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Stack(alignment: Alignment.center, children: [
        const SizedBox(
          width: 150.0,
          height: 150.0,
        ),
        FloatingContainerElement(
          child: SizedBox(
            width: 150.0,
            height: 150.0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: coloration.accentColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                child: CircularProgressIndicator(
                    backgroundColor: coloration.inactiveColor(),
                    color: coloration.accentColor(),
                    value: controller.value,
                    strokeWidth: 3.0,
                    semanticsLabel: 'Progress Indicator'),
              ),
            ),
          ),
        ),
        HeadingTwoText(
            '${widget.progressValue * 100}%', decorationPriority.standard)
      ]),
    );
  }
}
