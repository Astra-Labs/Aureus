/// @nodoc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*---------  UNIVERSAL GESTURE DETECTOR ----------*/
/// A gesture detector that recognizes taps AND enter presses on keyboards so
/// that those with assistive tech can navigate

class UniversalGestureDetector extends StatefulWidget {
  /// The item that will have a 'floating glass' look behind it.
  final VoidCallback onDetect;
  final Widget child;

  const UniversalGestureDetector({
    required this.onDetect,
    required this.child,
  });

  @override
  _UniversalGestureDetectorState createState() =>
      _UniversalGestureDetectorState();
}

class _UniversalGestureDetectorState extends State<UniversalGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(onKey: (node, event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          return KeyEventResult
              .handled; // prevent passing the event into the TextField
        }
        return KeyEventResult.ignored; // pass the event to the TextField
      }),
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          // Do something
          widget.onDetect();
        }
      },
      child: GestureDetector(
        onTap: () {
          widget.onDetect();
        },
        child: widget.child,
      ),
    );
  }
}
