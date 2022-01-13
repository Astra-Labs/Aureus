import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class CategoryIconDetailCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final String cardBody;
  final IconData cardIcon;

  const CategoryIconDetailCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.cardBody,
      required this.cardIcon});

  @override
  Widget build(BuildContext context) {
    Size cardLabelSize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w9),
        textInput: cardLabel,
        textStyle: heading3(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    Size cardBodySize = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w9),
        textInput: cardBody,
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        //this will be the rounded card backing
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(2, size.logicalScreenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        0.0, size.widthOf(weight: sizingWeight.w1), 0.0, 0.0)),
                Icon(cardIcon,
                    size: size.widthOf(weight: sizingWeight.w2),
                    color: coloration.decorationColor(
                        decorationVariant: decorationVariant),
                    // TODO: Add accessibility semantic label support
                    semanticLabel: 'Icon name'),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0.0,
                      size.widthOf(weight: sizingWeight.w1),
                      0.0,
                      size.widthOf(weight: sizingWeight.w0)),
                  child: HeadingThreeText(cardLabel, decorationVariant),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  child: BodyOneText(cardBody, decorationVariant),
                ),
              ]),
        ));
  }
}
