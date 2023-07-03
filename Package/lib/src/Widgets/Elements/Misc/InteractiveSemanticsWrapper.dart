/// @nodoc
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- INTERACTIVE SEMANTICS ----------*/
/// A semantics wrapper that provides a Focus node for screen readers
/// and tab orders to be established. This is just a little helper wrapper
/// to combine Focus / semantics into one overarching wrapper class.

class InteractiveSemanticsWrapper extends StatelessWidget {
  /// The item that will have a 'floating glass' look behind it.
  final SemanticsProperties properties;
  final Widget child;

  const InteractiveSemanticsWrapper(
      {required this.properties, required this.child});

  @override
  Widget build(BuildContext context) {
    return Focus(
      child: Semantics.fromProperties(
        properties: properties,
        child: child,
      ),
    );
  }
}