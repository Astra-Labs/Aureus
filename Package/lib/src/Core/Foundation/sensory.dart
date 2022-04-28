import 'package:aureus/aureus.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:math';

/* ------------------ SENSORY -------------------- */
/*

This class contains the sensory components of Aureus. This covers animations, 
haptics, our sound library, and more. 

*/

var sensation = Sensory();

class Sensory {
  // Wraps an Ink & Inkwell widget together and calls
  // the Auus sensory engine to provide haptic feedback
  // and noises from the sound library.

  // Calls the Haptic Feedback engine and plays
  // an accompanying sound file for the different
  // types of gestures that happen.

  static AudioCache player = AudioCache();
  var confirmationAudioPath = "confirm1.wav";
  var praiseAudioPath = "praise1.wav";
  var errorAudioPath = "praise1.wav";
  var attentionAudioPath = "praise1.wav";
  var notificationAudioPath = "praise1.wav";
  var urgentAudioPath = "praise1.wav";
  var enableAudioPath = "praise1.wav";
  var disableAudioPath = "praise1.wav";
  var swipeAudioPath = "swipe1.wav";
  var pressAudioPath = "praise1.wav";
  var holdAudioPath = "praise1.wav";

  void createSensation(sensationType sense) {
    switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();
          player.play(confirmationAudioPath);
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();
          player.play(praiseAudioPath);
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();
          player.play(errorAudioPath);
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();
          player.play(attentionAudioPath);
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();
          player.play(notificationAudioPath);
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();
          player.play(urgentAudioPath);
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();
          player.play(enableAudioPath);
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();
          player.play(disableAudioPath);
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();
          player.play(swipeAudioPath);
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();
          player.play(pressAudioPath);
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();
          player.play(holdAudioPath);
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

  const CircleAnimation({
    Key? key,
    required this.child,
    required this.animation,
    required this.centerAlignment,
    required this.centerOffset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: coloration.sameColor(),
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? _) {
          return ClipPath(
            clipper: CircularAnimationClip(
              fraction: animation.value,
              centerAlignment: centerAlignment,
              centerOffset: centerOffset,
            ),
            child: child,
          );
        },
      ),
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
    const minRadius = 1.0;
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
        child: Hero(tag: 'heroTag', child: child),
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
