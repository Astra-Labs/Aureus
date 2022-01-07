import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class DetailCarouselCardElement extends StatelessWidget {
  final String cardLabel;
  final IconData cardIcon;

  const DetailCarouselCardElement(
      {required this.cardLabel, required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w9),
        textInput: cardLabel,
        textStyle: foundation.tag2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
      constraints: BoxConstraints(
          minWidth: size.layoutItemWidth(2, size.logicalScreenSize),
          maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
          minHeight: size.heightOf(weight: sizingWeight.w0),
          maxHeight: size.heightOf(weight: sizingWeight.w1)),
      decoration: CardBackingDecoration(priority: decorationPriority.inactive)
          .buildBacking(),
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(cardIcon, color: coloration.contrastColor().withOpacity(0.5)),
          Text(cardLabel.toUpperCase(),
              style:
                  foundation.tag2().copyWith(color: coloration.contrastColor()),
              textAlign: TextAlign.right)
        ],
      ),
    );
  }
}
