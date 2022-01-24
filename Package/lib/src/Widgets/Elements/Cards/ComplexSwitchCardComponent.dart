import 'package:aureus/aureus.dart';

class ComplexSwitchCardElement extends StatelessWidget {
  final String cardLabel;
  final String cardBody;
  final IconData cardIcon;

  const ComplexSwitchCardElement(
      {required this.cardLabel,
      required this.cardBody,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(3, size.logicalScreenSize)),
        decoration: CardBackingDecoration(priority: decorationPriority.inactive)
            .buildBacking(),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconBadge(
                            badgeIcon: cardIcon,
                            badgePriority: decorationPriority.important),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: SwitchComponent())
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 10)),
                  HeadingFourText(cardLabel, decorationPriority.standard),
                  BodyOneText(cardBody, decorationPriority.standard)
                ])));
  }
}
