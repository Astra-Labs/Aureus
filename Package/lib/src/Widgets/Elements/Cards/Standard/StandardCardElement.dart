import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD CARD ----------*/

class StandardCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  const StandardCardElement(
      {required this.decorationVariant, required this.cardLabel});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var standardCardContent = Align(
        alignment: Alignment.topLeft,
        child: BodyTwoText(cardLabel, decorationVariant));

    var standardCardContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(4, screenSize),
              maxWidth: size.layoutItemWidth(3, screenSize),
              minHeight: size.layoutItemHeight(5, screenSize),
              maxHeight: size.layoutItemHeight(4, screenSize)),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: standardCardContent,
          )),
    );

    return standardCardContainer;
  }
}
