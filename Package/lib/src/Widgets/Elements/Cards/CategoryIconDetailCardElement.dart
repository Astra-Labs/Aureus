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
        widthLimit: 1000,
        textInput: cardLabel,
        textStyle: foundation.heading3(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    Size cardBodySize = Accessibility.textStringSize(
        widthLimit: 1000,
        textInput: cardBody,
        textStyle: foundation.body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        //this will be the rounded card backing
        constraints: BoxConstraints(
            maxWidth: size.widthOf(weight: sizingWeight.w2),
            maxHeight: size.widthOf(weight: sizingWeight.w3)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Wrap(
                direction: Axis.vertical,
                spacing: 25,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Icon(cardIcon,
                      size: 80.0,
                      color: coloration.decorationColor(
                          decorationVariant: decorationVariant),
                      // TODO: Add accessibility semantic label support
                      semanticLabel: 'Icon name'),
                  HeadingThreeText(cardLabel, decorationVariant),
                  BodyOneText(cardBody, decorationVariant),
                ]),
          ),
        ));
  }
}
