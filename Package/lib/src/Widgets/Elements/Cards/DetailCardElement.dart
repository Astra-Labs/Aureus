import 'package:aureus/aureus.dart';

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
    var screenSize = size.logicalScreenSize();

    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize),
              maxHeight: size.layoutItemHeight(4, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeadingFourText(cardLabel, decorationVariant),
                    Padding(padding: EdgeInsets.fromLTRB(0, 4.0, 0.0, 4.0)),
                    BodyOneText(cardBody, decorationVariant)
                  ]))),
    );
  }
}
