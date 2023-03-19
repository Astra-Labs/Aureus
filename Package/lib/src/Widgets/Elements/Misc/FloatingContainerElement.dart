import 'dart:ui';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- FLOATING CONTAINER ----------*/
/// This is a decorative element that gives the widgets that
/// 'floating above the noise' look. Use it to add depth to custom widgets.

class FloatingContainerElement extends StatelessWidget {
  /// The item that will have a 'floating glass' look behind it.
  final Widget child;

  const FloatingContainerElement({required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: 10, sigmaY: 10, tileMode: TileMode.decal),
          child: child),
    );
  }
}
