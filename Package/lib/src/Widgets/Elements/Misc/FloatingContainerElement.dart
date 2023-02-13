import 'dart:ui';
import 'package:aureus/aureus.dart';

/*--------- FLOATING CONTAINER ----------*/
// This is a decorative element that gives the widgets that
// 'floating above the noise' look. Use it to add depth to custom widgets.

class FloatingContainerElement extends StatelessWidget {
  final Widget child;

  const FloatingContainerElement({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: child),
    );
  }
}
