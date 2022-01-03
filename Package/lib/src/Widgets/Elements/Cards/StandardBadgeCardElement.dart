import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class StandardBadgeCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final IconData cardIcon;

  const StandardBadgeCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        widthLimit: 300,
        textInput: cardLabel,
        textStyle: foundation.body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        constraints: BoxConstraints(
            minWidth: labelSize.width * 1.5,
            minHeight: labelSize.height * 8,
            maxWidth: labelSize.width * 2,
            maxHeight: labelSize.height * 12),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
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
          ),
        ));
  }
}
