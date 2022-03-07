import 'dart:ui';
import 'package:aureus/aureus.dart';

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
