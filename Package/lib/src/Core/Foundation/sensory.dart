import 'package:aureus/aureus.dart';
import 'package:flutter/services.dart';
import 'dart:math';

/* ------------------ SENSORY -------------------- */
/*

This class contains the sensory components of Aureus. This covers animations, 
haptics, our sound library, and more. 

*/

class Sensory {
  // Wraps an Ink & Inkwell widget together and calls
  // the Aureus sensory engine to provide haptic feedback
  // and noises from the sound library.

  // Calls the Hpatic Feedback engine and plays
  // an accompanying sound file for the different
  // types of gestures that happen.
  void createSensation(sensationType sense) {
    switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();
          break;
        }
    }
  }
}

enum sensationType {
  confirmation,
  praise,
  error,
  attention,
  notification,
  urgent,
  enable,
  disable,
  swipe,
  press,
  hold,
}

class CircleAnimation extends StatelessWidget {
  final Alignment centerAlignment;
  final Offset centerOffset;
  final Widget child;
  final Animation<double> animation;

  CircleAnimation({
    required this.child,
    required this.animation,
    required this.centerAlignment,
    required this.centerOffset,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? _) {
        return ClipPath(
          clipper: CircularAnimationClip(
            fraction: animation.value,
            centerAlignment: centerAlignment,
            centerOffset: centerOffset,
          ),
          child: this.child,
        );
      },
    );
  }
}

class CircularAnimationClip extends CustomClipper<Path> {
  final double fraction;
  final Alignment centerAlignment;
  final Offset centerOffset;

  CircularAnimationClip({
    required this.fraction,
    required this.centerAlignment,
    required this.centerOffset,
  });

  @override
  Path getClip(Size size) {
    final Offset center = centerOffset;
    final minRadius = 1.0;
    final maxRadius = calcMaxRadius(size, center);

    return Path()
      ..addOval(
        Rect.fromCircle(
          center: center,
          radius: lerpDouble(minRadius, maxRadius, fraction),
        ),
      );
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  static double calcMaxRadius(Size size, Offset center) {
    final w = max(center.dx, size.width - center.dx);
    final h = max(center.dy, size.height - center.dy);
    return sqrt(w * w + h * h);
  }

  static double lerpDouble(double a, double b, double t) {
    return a * (1.0 - t) + b * t;
  }
}

//Creates a hero widget that takes users' accessibility preferences into account.
class HeroWidget extends StatelessWidget {
  final Widget child;
  final String heroTag;
  const HeroWidget({required this.child, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return HeroMode(
        child: Hero(
            tag: 'Aureus-${Random().nextInt(1000)}-$heroTag', child: child),
        enabled: accessibility.accessFeatures.disableAnimations ? false : true);
  }
}

/* class ShakeAnimation extends ImplicitlyAnimatedWidget {
  final double rotation;
  final Duration duration;
  final Curve curve;
  final Widget child;

  const ShakeAnimation({
    required this.rotation,
    required this.duration,
    required this.curve,
    required this.child,
  }) : super(
          duration: duration,
          curve: curve,
        );

  @override
  ShakeAnimationState createState() => ShakeAnimationState();
}

class ShakeAnimationState extends AnimatedWidgetBaseState<ShakeAnimation> {
  var _rotationTween = ColorTween();

  @override
  void forEachTween(visitor) {
    _rotationTween = visitor(Color.fromRGBO(0, 0, 0, 0.0));
  }

  @override
  Widget build(BuildContext context) {
    return;
  }
} */

class PulseAnimation {
  const PulseAnimation();
}

class ShimmerAnimation {
  const ShimmerAnimation();
}
