/// @nodoc
import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*---------    SEMANTICS ----------*/
/// A semantics wrapper that provides a Focus node for screen readers
/// and tab orders to be established. This is just a little helper wrapper
/// to combine Focus / semantics into one overarching wrapper class.

class SemanticsWrapper extends StatelessWidget {
  /// The item that will have a 'floating glass' look behind it.
  final SemanticsProperties properties;
  final Widget child;

  const SemanticsWrapper({
    required this.properties,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: coloration.accentColor(),
        ),
      ),
      child: Focus(
        child: Semantics.fromProperties(
          properties: properties,
          child: child,
        ),
      ),
    );
  }
}
