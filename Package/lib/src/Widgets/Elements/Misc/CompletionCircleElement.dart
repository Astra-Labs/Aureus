import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLETION CIRCLE ELEMENT ----------*/
/// A floating circle with a gradient that's filled according
/// to how complete something is. Used for showing completion
/// at the end of a task or action.

class CompletionCircleElement extends StatefulWidget {
  /// The progress value from 1-100 (aka how filled up the circle is).
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
    var dynamicSize = size.responsiveSize(120, MediaQuery.of(context).size);

    var circularProgressIndicator = CircularProgressIndicator(
        backgroundColor: coloration.inactiveColor(),
        color: coloration.accentColor(),
        value: controller.value,
        strokeWidth: 2.0,
        semanticsLabel: 'Progress Indicator');

    var indicatorContainer = FloatingContainerElement(
      child: SizedBox(
        width: dynamicSize,
        height: dynamicSize,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: coloration.accentColor().withOpacity(0.2),
                shape: BoxShape.circle),
            child: circularProgressIndicator,
          ),
        ),
      ),
    );

    var indicatorStack = Stack(alignment: Alignment.center, children: [
      SizedBox(
        width: dynamicSize,
        height: dynamicSize,
      ),
      indicatorContainer,
      BodyOneText('${widget.progressValue * 100}%', decorationPriority.standard)
    ]);

    return SizedBox(
      width: dynamicSize,
      height: dynamicSize,
      child: indicatorStack,
    );
  }
}
