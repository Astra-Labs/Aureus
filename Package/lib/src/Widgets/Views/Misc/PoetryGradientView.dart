import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- POETRY GRADIENT VIEW ----------*/
/// A view that animates gradients and noise, while scrolling through a poem.
/// This is an 'Easter Egg' Astra uses to hide poems within our resources for a
/// better user experience.

class PoetryGradientView extends StatefulWidget {
  /// A List with the strings that make up a poem.
  final List<String> poetryArray;

  const PoetryGradientView({required this.poetryArray});

  @override
  _PoetryGradientViewState createState() => _PoetryGradientViewState();
}

class _PoetryGradientViewState extends State<PoetryGradientView> {
  // All of the gradients that will be phased through
  var morningGrad = const LinearGradient(colors: [], stops: []);
  var afternoonGrad = const LinearGradient(colors: [], stops: []);
  var sunsetGrad = const LinearGradient(colors: [], stops: []);
  var nightGrad = const LinearGradient(colors: [], stops: []);

  Map<String, int> lineReadingTimes = {};

  int lineIndex = 0;
  String currentQuote = "";

  @override
  void initState() {
    // Iterates through each line, calucates the reading duration,
    // and then stores both pieces of info in a map for fast retrival
    for (var element in widget.poetryArray) {
      var duration = calculateDuration(element);
      lineReadingTimes[element] = duration;
    }

    super.initState();
  }

  // calculates the amount of time based on the # in the array
  // to set the duration of the scroll. duration is calculated
  // in Ints and then cast later so we can add all durations up
  // for the total reading time required by the day to night gradient

  int calculateDuration(String item) {
    //var charCount;

    return 1;
  }

  // Iterates through the entire map of strings & reading times
  // and then adds all of these together to create an animation
  // time estimate for the gradient animation controller, as well
  // as the noise animation.
  Duration calculateOverallDuration() {
    var totalDuration = 0;

    for (var time in lineReadingTimes.values) {
      totalDuration += time;
    }

    return Duration(seconds: totalDuration);
  }

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          _NoiseAnimationWidget(gradientTime: calculateOverallDuration())
        ]);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      hasBackgroundImage: false,
      takesFullWidth: false,
      showQuickActionBar: false,
    );
  }
}

// NOISE ANIMATION

class _NoiseAnimationWidget extends StatefulWidget {
  final Duration gradientTime;
  const _NoiseAnimationWidget({required this.gradientTime});

  @override
  _NoiseAnimationWidgetState createState() => _NoiseAnimationWidgetState();
}

class _NoiseAnimationWidgetState extends State<_NoiseAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController _noiseAnimationController;
  late AnimationController _gradientAnimationController;

  @override
  void initState() {
    super.initState();
    _noiseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    );

    _gradientAnimationController = AnimationController(
      vsync: this,
      duration: widget.gradientTime,
    );

    _noiseAnimationController.forward();
    _gradientAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // The animated builder for the custom painter
    var animationBuilder = AnimatedBuilder(
        animation: _noiseAnimationController,
        builder: (BuildContext ctx, Widget? w) {
          return CustomPaint(
            size: size.logicalScreenSize(),
            painter: _NoisePainter(
              width: size.logicalWidth(),
              height: size.logicalHeight(),
            ),
          );
        });

    // A sized box widget to ensure the animated builder is neatly contained.
    var builderBox = SizedBox(
      width: size.logicalWidth(),
      height: size.logicalHeight(),
      child: animationBuilder,
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        takesFullWidth: true,
        children: [builderBox]);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      hasBackgroundImage: false,
      takesFullWidth: true,
      showQuickActionBar: false,
    );
  }
}

class _NoisePainter extends CustomPainter {
  final double width;
  final double height;

  _NoisePainter({required this.width, required this.height});

  List<Color> colors = [Colors.black, Colors.grey, Colors.white];

  @override
  void paint(Canvas canvas, Size size) {
    Random random = Random();

    for (int i = 0; i < width; i += 3) {
      for (int j = 0; j < height; j += 3) {
        Offset point = Offset(
          random.nextDouble() * (width),
          random.nextDouble() * (height),
        );

        Paint p = Paint();
        p.color = colors[random.nextInt(colors.length)];
        p.strokeWidth = random.nextDouble() * 2;

        canvas.drawPoints(PointMode.points, [point], p);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
