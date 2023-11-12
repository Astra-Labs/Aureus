import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- GRID BADGE CARD ----------*/
/// A simple, square card with an icon that is meant to be apart of a grid.

class GridBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// The text for the main header of the card.
  final String cardLabel;

  /// An icon that describes the card.
  final IconData cardIcon;

  VoidCallback? onTap;

  GridBadgeCardElement({
    required this.decorationVariant,
    required this.cardLabel,
    required this.cardIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        textInput: cardLabel,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = MediaQuery.of(context).size;

    var gridBadgeContent = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: IconBadge(
                badgeIcon: cardIcon, badgePriority: decorationVariant)),
        Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
                width: labelSize.width,
                height: labelSize.height,
                child: BodyTwoText(cardLabel, decorationVariant))),
      ],
    );

    var gridBadgeContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(3, screenSize),
              maxWidth: size.layoutItemWidth(3, screenSize),
              minHeight: size.layoutItemWidth(3, screenSize),
              maxHeight: size.layoutItemWidth(3, screenSize)),
          decoration:
              CardBackingDecoration(decorationVariant: decorationVariant)
                  .buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: gridBadgeContent,
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
              child: gridBadgeContainer,
            ))
        : gridBadgeContainer;
  }
}
