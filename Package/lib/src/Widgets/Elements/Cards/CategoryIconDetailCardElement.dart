import 'package:aureus/aureus.dart';

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
    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();

    return FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              maxWidth: size.layoutItemWidth(1, screenSize) * 0.7,
              minHeight: size.layoutItemHeight(2, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          alignment: Alignment.center,
          clipBehavior: Clip.hardEdge,
          child: SizedBox(
              width: size.layoutItemWidth(2, screenSize) - 20,
              height: size.layoutItemHeight(2, screenSize) - 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(cardIcon,
                          size: screenWidth / 8,
                          color: coloration.decorationColor(
                              decorationVariant: decorationVariant)),
                      HeadingThreeText(cardLabel, decorationVariant),
                      Text(cardBody,
                          textAlign: TextAlign.center,
                          style: body1().copyWith(
                            color: coloration.decorationColor(
                                decorationVariant: decorationVariant),
                          ))
                    ]),
              ))),
    );
  }
}
