import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLEX SWITCH CARD ----------*/

class ComplexSwitchCardElement extends StatelessWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  ///
  final IconData cardIcon;

  ///
  final VoidCallback onEnable;

  ///
  final VoidCallback onDisable;

  const ComplexSwitchCardElement(
      {required this.cardLabel,
      required this.cardBody,
      required this.cardIcon,
      required this.onEnable,
      required this.onDisable});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var complexSwitchTopContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconBadge(
            badgeIcon: cardIcon, badgePriority: decorationPriority.standard),
        SwitchComponent(onEnable, onDisable)
      ],
    );

    var complexSwitchContent = Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          complexSwitchTopContent,
          const Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
          HeadingFourText(cardLabel, decorationPriority.standard),
          BodyOneText(cardBody, decorationPriority.standard)
        ]);

    var complexSwitchContainer = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              maxHeight: size.layoutItemHeight(3, screenSize)),
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: complexSwitchContent)),
    );

    return complexSwitchContainer;
  }
}
