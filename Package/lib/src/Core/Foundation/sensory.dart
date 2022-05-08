import 'package:aureus/aureus.dart';
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
  //late AudioPlayer player;

  // Use this function in your initState method.
  void prepare() async {
    //player = AudioPlayer();
  }

  // Use this widget in your dispose method
  void dispose() {
    //player.dispose();
  }

  //static AudioCache player = AudioCache(prefix: 'assets/sounds/');
  var confirmationAudioPath = "sounds/confirm.mp3";
  var praiseAudioPath = "sounds/praise.mp3";
  var errorAudioPath = "sounds/error.mp3";
  var attentionAudioPath = "sounds/attention.mp3";
  var notificationAudioPath = "sounds/notification.mp3";
  var urgentAudioPath = "sounds/urgent.mp3";
  var enableAudioPath = "sounds/enable.mp3";
  var disableAudioPath = "sounds/disable.mp3";
  var swipeAudioPath = "sounds/swipe.mp3";
  var pressAudioPath = "sounds/enable.mp3";
  var holdAudioPath = "sounds/hold.mp3";

  Future<void> createSensation(sensationType sense) async {
    /*switch (sense) {
      case sensationType.confirmation:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(confirmationAudioPath);
          player.play();
          break;
        }
      case sensationType.praise:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(praiseAudioPath);
          player.play();
          break;
        }
      case sensationType.error:
        {
          HapticFeedback.heavyImpact();
          await player.setAsset(errorAudioPath);
          player.play();
          break;
        }
      case sensationType.attention:
        {
          HapticFeedback.vibrate();
          await player.setAsset(attentionAudioPath);
          player.play();
          break;
        }
      case sensationType.notification:
        {
          HapticFeedback.lightImpact();
          await player.setAsset(notificationAudioPath);
          player.play();
          break;
        }
      case sensationType.urgent:
        {
          HapticFeedback.heavyImpact();
          await player.setAsset(urgentAudioPath);
          player.play();
          break;
        }
      case sensationType.enable:
        {
          HapticFeedback.mediumImpact();
          await player.setAsset(enableAudioPath);
          player.play();
          break;
        }
      case sensationType.disable:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(disableAudioPath);
          player.play();
          break;
        }
      case sensationType.swipe:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(swipeAudioPath);
          player.play();
          break;
        }
      case sensationType.press:
        {
          HapticFeedback.selectionClick();
          await player.setAsset(pressAudioPath);
          player.play();
          break;
        }
      case sensationType.hold:
        {
          HapticFeedback.vibrate();
          await player.setAsset(holdAudioPath);
          player.play();
          break;
        }
    }*/
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
