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

class InteractiveSemanticsWrapper extends StatefulWidget {
  /// The item that will have a 'floating glass' look behind it.
  final SemanticsProperties properties;
  final Widget child;

  const InteractiveSemanticsWrapper({
    required this.properties,
    required this.child,
  });

  @override
  _InteractiveSemanticsWrapperState createState() =>
      _InteractiveSemanticsWrapperState();
}

class _InteractiveSemanticsWrapperState
    extends State<InteractiveSemanticsWrapper> {
  Color borderColor = Colors.transparent;

  void hideBorder() {
    setState(() {
      borderColor = Colors.transparent.withAlpha(0);
    });
  }

  void showBorder() {
    setState(() {
      borderColor = coloration.accentColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Focus(
        onFocusChange: (focused) {
          if (focused == true) {
            showBorder();
          } else {
            hideBorder();
          }
        },
        child: Semantics.fromProperties(
          properties: widget.properties,
          child: widget.child,
        ),
      ),
    );
  }
}
