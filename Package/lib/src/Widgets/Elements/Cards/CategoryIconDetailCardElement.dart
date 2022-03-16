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

    return FloatingContainerElement(
      child: Container(
          //this will be the rounded card backing
          constraints: BoxConstraints(
              maxWidth: size.layoutItemWidth(2, screenSize) * 0.95,
              minHeight: size.layoutItemHeight(3, screenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          alignment: Alignment.center,
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
              width: size.layoutItemWidth(2, screenSize) - 20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(height: size.responsiveTextSize(30.0)),
                      Icon(cardIcon,
                          size: size.responsiveTextSize(60),
                          color: coloration.decorationColor(
                              decorationVariant: decorationVariant)),
                      SizedBox(height: size.responsiveTextSize(30.0)),
                      HeadingFourText(cardLabel, decorationVariant),
                      const SizedBox(height: 5.0),
                      Text(cardBody,
                          textAlign: TextAlign.center,
                          style: body1().copyWith(
                            color: coloration.decorationColor(
                                decorationVariant: decorationVariant),
                          )),
                      const SizedBox(height: 10.0),
                    ]),
              ))),
    );
  }
}
