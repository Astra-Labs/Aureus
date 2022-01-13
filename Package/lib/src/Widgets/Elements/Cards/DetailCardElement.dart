import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class DetailCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final String cardBody;

  const DetailCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w3),
        textInput: cardLabel,
        textStyle: heading4(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    Size bodySize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w3),
        textInput: cardLabel,
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            minHeight: size.layoutItemHeight(5, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(4, size.logicalScreenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        clipBehavior: Clip.hardEdge,
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HeadingFourText(cardLabel, decorationVariant),
                  Padding(padding: EdgeInsets.fromLTRB(0, 4.0, 0.0, 4.0)),
                  BodyOneText(cardBody, decorationVariant)
                ])));
  }
}
