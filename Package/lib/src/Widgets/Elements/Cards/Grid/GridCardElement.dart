import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- GRID CARD ----------*/
/// A simple, square card that is meant to be apart of a grid.
///
class GridCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// The size of the grid the card is meant to size into.
  final Size gridSize;

  VoidCallback? onTap;

  GridCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.gridSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var maxWidth = size.isDesktopDisplay(MediaQuery.of(context).size)
        ? gridSize.width / 2
        : gridSize.width / 3.2;

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

    return onTap != null
        ? InteractiveSemanticsWrapper(
            properties: SemanticsWrapper.card(
              isEnabled: decorationVariant == decorationPriority.inactive
                  ? false
                  : true,
              label: cardLabel,
            ),
            child: gridCardContainer,
            onInteract: () => {
              onTap!(),
            },
          )
        : gridCardContainer;
  }
}
