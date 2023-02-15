import 'package:aureus/aureus.dart';

/*--------- STANDARD CARD ----------*/

class StandardCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;

  const StandardCardElement(
      {required this.decorationVariant, required this.cardLabel});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var standardCardContent = Align(
        alignment: Alignment.topLeft,
        child: BodyTwoText(cardLabel, decorationVariant));

    var standardCardContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(4, screenSize),
              maxWidth: size.layoutItemWidth(3, screenSize),
              minHeight: size.layoutItemHeight(5, screenSize),
              maxHeight: size.layoutItemHeight(4, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: standardCardContent,
          )),
    );

    return standardCardContainer;
  }
}
