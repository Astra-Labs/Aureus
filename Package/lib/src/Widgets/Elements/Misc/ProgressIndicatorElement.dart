import 'package:aureus/aureus.dart';

//A bar that indicators progress for a given task.

class ProgressIndicatorElement extends StatefulWidget {
  final double value;
  const ProgressIndicatorElement({required this.value});

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
        upperBound: widget.value,
        duration: const Duration(seconds: 1),
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
    return LinearProgressIndicator(
      value: controller.value,
      backgroundColor: coloration.inactiveColor(),
      color: coloration.accentColor(),
      minHeight: 3.0,
      semanticsLabel: 'Progress Indicator',
      semanticsValue: 'Progress: ${widget.value}',
    );
  }
}
