/// @nodoc
import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*---------  UNIVERSAL GESTURE DETECTOR ----------*/
/// A gesture detector that recognizes taps AND enter presses on keyboards so
/// that those with assistive tech can navigate

class UniversalGestureDetector extends StatefulWidget {
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
    return GestureDetector(
      onTap: () {
        widget.onDetect();
      },
      child: FocusableActionDetector(
        onShowFocusHighlight: (isFocused) => {
          isFocused ? showBorder() : hideBorder(),
        },
        actions: <Type, Action<Intent>>{
          ActivateIntent: CallbackAction<Intent>(
            onInvoke: (Intent intent) => widget.onDetect(),
          ),
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              style: BorderStyle.solid,
              color: borderColor,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

/*

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
        } else if (event.isKeyPressed(LogicalKeyboardKey.tab)) {
          //shoud move focus to the next node
          FocusScope.of(context).nextFocus();
        }
      },

*/