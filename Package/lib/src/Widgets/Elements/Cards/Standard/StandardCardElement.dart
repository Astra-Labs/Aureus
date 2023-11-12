// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- STANDARD CARD ----------*/
/// A standard card with just a title.

class StandardCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  VoidCallback? onTap;

  StandardCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

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

    return onTap != null
        ? InteractiveSemanticsWrapper(
            properties: SemanticsWrapper.card(
              isEnabled: decorationVariant == decorationPriority.inactive
                  ? false
                  : true,
              label: cardLabel,
            ),
            child: UniversalGestureDetector(
              onDetect: () => {
                onTap!(),
              },
              child: standardCardContainer,
            ))
        : standardCardContainer;
  }
}
