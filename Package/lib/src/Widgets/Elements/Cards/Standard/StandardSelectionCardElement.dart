import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD SELECTION CARD ----------*/

class StandardSelectionCardElement extends StatefulWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  ///
  bool isCardSelected = false;

  StandardSelectionCardElement({required this.cardLabel});

  @override
  _StandardSelectionCardElementState createState() =>
      _StandardSelectionCardElementState();
}

class _StandardSelectionCardElementState
    extends State<StandardSelectionCardElement> {
  void toggleCard() {
    if (widget.isCardSelected == false) {
      setState(() {
        widget.isCardSelected = true;
      });
    } else {
      setState(() {
        widget.isCardSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var responsiveRadius = size.responsiveSize(25);

    var unselectedCircle = Container(
      width: responsiveRadius,
      height: responsiveRadius,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: coloration.inactiveColor(), width: 2)),
    );

    var selectedCircle = Container(
      width: responsiveRadius,
      height: responsiveRadius,
      alignment: Alignment.center,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: coloration.sameColor()),
      child: Icon(Assets.yes,
          color: coloration.contrastColor(), size: responsiveRadius - 5),
    );

    return Semantics.fromProperties(
      properties: SemanticsWrapper.toggle(
          isEnabled: widget.isCardSelected,
          label: widget.cardLabel,
          hint: 'Enables or disables ${widget.cardLabel}',
          isToggled: widget.isCardSelected,
          isMutuallyExclusive: false),
      child: InkWell(
        onTap: toggleCard,
        child: SizedBox(
            width: size.layoutItemWidth(4, screenSize),
            height: size.layoutItemHeight(5, screenSize),
            child: Container(
                decoration: CardBackingDecoration(
                        decorationVariant: widget.isCardSelected
                            ? decorationPriority.important
                            : decorationPriority.inactive)
                    .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        widget.isCardSelected == true
                            ? selectedCircle
                            : unselectedCircle,
                        const Spacer(),
                        Flexible(
                          child: TagTwoText(
                              widget.cardLabel,
                              widget.isCardSelected
                                  ? decorationPriority.important
                                  : decorationPriority.standard),
                        ),
                      ]),
                ))),
      ),
    );
  }
}
