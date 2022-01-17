import 'package:aureus/aureus.dart';

//A card that contains a badge and label to describe what the card represents
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Cards/Badge%20Cards.md

class StandardCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;

  const StandardCardElement(
      {required this.decorationVariant, required this.cardLabel});

  @override
  Widget build(BuildContext context) {
    Size labelSize = Accessibility.textStringSize(
        textInput: cardLabel,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    print('label size is ${labelSize}');

    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(4, size.logicalScreenSize),
            maxWidth: size.layoutItemWidth(3, size.logicalScreenSize),
            minHeight: size.layoutItemHeight(5, size.logicalScreenSize),
            maxHeight: size.layoutItemHeight(4, size.logicalScreenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        clipBehavior: Clip.hardEdge,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
              alignment: Alignment.topLeft,
              child: BodyTwoText(cardLabel, decorationVariant)),
        ));
  }
}
