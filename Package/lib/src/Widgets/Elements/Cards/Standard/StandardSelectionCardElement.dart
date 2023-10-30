// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD SELECTION CARD ----------*/
/// A standard card with an label, that can actively be selected as part of a
/// group.

class StandardSelectionCardElement extends StatefulWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  /// If the card is enabled for user interaction.
  bool? isEnabled;

  /// Whether or not a card is actively selected.
  bool isCardSelected = false;

  /// A function to run when the user presses on the card.
  VoidCallback? onSelection;

  StandardSelectionCardElement({
    required this.cardLabel,
    this.isEnabled = true,
    this.isCardSelected = false,
    this.onSelection,
  });

  @override
  _StandardSelectionCardElementState createState() =>
      _StandardSelectionCardElementState();
}

class _StandardSelectionCardElementState
    extends State<StandardSelectionCardElement> {
  void toggleCard() {
    if (widget.onSelection != null) {
      widget.onSelection!();
    }

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
    var screenSize = MediaQuery.of(context).size;

    var responsiveRadius = size.responsiveSize(25, MediaQuery.of(context).size);

    var unselectedCircle = Container(
      width: responsiveRadius,
      height: responsiveRadius,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: coloration.contrastColor(), width: 1)),
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

    var column = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          widget.isCardSelected == true ? selectedCircle : unselectedCircle,
          const Spacer(),
          Flexible(
            child: TagTwoText(
                widget.cardLabel,
                widget.isEnabled == true
                    ? (widget.isCardSelected
                        ? decorationPriority.important
                        : decorationPriority.standard)
                    : decorationPriority.inactive),
          ),
        ]);

    var floatingContainerElement = FloatingContainerElement(
      child: Container(
          decoration: CardBackingDecoration(
                  decorationVariant: widget.isEnabled == true
                      ? (widget.isCardSelected
                          ? decorationPriority.important
                          : decorationPriority.standard)
                      : decorationPriority.inactive)
              .buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: column,
          )),
    );

    var cardContainer = SizedBox(
        width: size.layoutItemWidth(4, screenSize),
        height: size.layoutItemHeight(6, screenSize),
        child: floatingContainerElement);

    var semantics = Semantics.fromProperties(
      properties: SemanticsWrapper.toggle(
          isEnabled: widget.isEnabled,
          isToggled: widget.isCardSelected,
          isMutuallyExclusive: false),
    );

    return InteractiveSemanticsWrapper(
      properties: semantics.properties,
      child: cardContainer,
      onInteract: () => {
        widget.isEnabled == true ? toggleCard : () => {},
      },
    );
  }
}
