import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- GRID CARD ----------*/

class GridCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  ///
  final Size gridSize;

  const GridCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.gridSize});

  @override
  Widget build(BuildContext context) {
    var maxWidth =
        size.isDesktopDisplay() ? gridSize.width / 2 : gridSize.width / 3.2;

    var gridCardContent = Align(
        alignment: Alignment.topLeft,
        child: BodyTwoText(cardLabel, decorationVariant));

    var gridCardContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: maxWidth,
              maxWidth: maxWidth,
              minHeight: maxWidth,
              maxHeight: maxWidth),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: gridCardContent,
          )),
    );

    return gridCardContainer;
  }
}
