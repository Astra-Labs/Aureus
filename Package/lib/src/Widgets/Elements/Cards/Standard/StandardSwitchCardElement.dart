import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD SWITCH CARD ----------*/

class StandardSwitchCardElement extends StatefulWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  ///
  final VoidCallback onEnable;

  ///
  final VoidCallback onDisable;

  ///
  bool isSwitchEnabled = false;

  StandardSwitchCardElement(
      {required this.cardLabel,
      required this.onEnable,
      required this.onDisable});

  @override
  _StandardSwitchCardElementState createState() =>
      _StandardSwitchCardElementState();
}

class _StandardSwitchCardElementState extends State<StandardSwitchCardElement> {
  void toggleSwitch(bool value) {
    if (widget.isSwitchEnabled == false) {
      setState(() {
        widget.isSwitchEnabled = true;
      });
    } else {
      setState(() {
        widget.isSwitchEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size minimumLabelTextSize = Accessibility.textStringSize(
        textInput: widget.cardLabel,
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: FloatingContainerElement(
        child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: minimumLabelTextSize.height * 6,
            child: Container(
                decoration: LayerBackingDecoration(
                        decorationVariant: decorationPriority.inactive)
                    .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: BodyOneText(
                              widget.cardLabel, decorationPriority.standard),
                        ),
                        SwitchComponent(widget.onEnable, widget.onDisable)
                      ]),
                ))),
      ),
    );
  }
}
