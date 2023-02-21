import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- GRID BADGE CARD ----------*/

class GridBadgeCardElement extends StatelessWidget {
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  ///
  final String cardLabel;

  ///
  final IconData cardIcon;

  const GridBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        textInput: cardLabel,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

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

    return gridBadgeContainer;
  }
}
