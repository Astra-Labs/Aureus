import 'package:aureus/aureus.dart';

/*--------- COMPLEX SWITCH CARD ----------*/

class ComplexSwitchCardElement extends StatelessWidget {
  final String cardLabel;
  final String cardBody;
  final IconData cardIcon;
  final VoidCallback onEnable;
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
          decoration:
              CardBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          clipBehavior: Clip.antiAlias,
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: complexSwitchContent)),
    );

    return complexSwitchContainer;
  }
}
