import 'package:aureus/aureus.dart';
import 'dart:math';

/// {@category Foundation}

/* ------------------ ANIMATIONS -------------------- */
/// Animations in the form of widgets that are used throughout Aureus.

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
