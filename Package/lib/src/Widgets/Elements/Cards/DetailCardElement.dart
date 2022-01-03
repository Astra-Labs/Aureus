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
        textStyle: foundation.heading4(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    Size bodySize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w3),
        textInput: cardLabel,
        textStyle: foundation.body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        constraints: BoxConstraints(
            minWidth: 300,
            minHeight: 100,
            maxWidth: size.widthOf(weight: sizingWeight.w5)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Wrap(
                direction: Axis.vertical,
                spacing: 10,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.start,
                clipBehavior: Clip.hardEdge,
                children: [
                  HeadingFourText(cardLabel, decorationVariant),
                  BodyOneText(cardBody, decorationVariant)
                ])));
  }
}
