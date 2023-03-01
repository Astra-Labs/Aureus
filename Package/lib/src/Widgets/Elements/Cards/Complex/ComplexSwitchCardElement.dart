import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- COMPLEX SWITCH CARD ----------*/
/// A detailed card meant to allow the user to enable or disable it based on
/// the metadata.

class ComplexSwitchCardElement extends StatelessWidget {
  /// The text for the main header of the card.
  final String cardLabel;

  /// The text for the body content underneath the header.
  final String cardBody;

  /// An icon that describes the card.
  final IconData cardIcon;

  /// A [VoidCallback] to run when the switch is enabled.
  final VoidCallback onEnable;

  /// A [VoidCallback] to run when the switch is disabled.
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
          const SizedBox(height: 20),
          complexSwitchTopContent,
          const SizedBox(height: 20),
          HeadingFourText(cardLabel, decorationPriority.standard),
          const SizedBox(height: 20),
          BodyOneText(cardBody, decorationPriority.standard),
          const SizedBox(height: 20),
        ]);

    var complexSwitchContainer = FloatingContainerElement(
        child: Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: Container(
          width: size.layoutItemWidth(1, screenSize),
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: complexSwitchContent)),
    ));

    return complexSwitchContainer;
  }
}
