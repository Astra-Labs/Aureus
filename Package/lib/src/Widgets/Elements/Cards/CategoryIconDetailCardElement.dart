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
    return Container(
        //this will be the rounded card backing
        constraints: BoxConstraints(
            maxWidth: size.layoutItemWidth(2, size.logicalScreenSize),
            minHeight: size.layoutItemHeight(2, size.logicalScreenSize)),
        decoration:
            CardBackingDecoration(priority: decorationVariant).buildBacking(),
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        child: SizedBox(
            width: size.layoutItemWidth(2, size.logicalScreenSize) - 20,
            height: size.layoutItemHeight(2, size.logicalScreenSize) - 20,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(cardIcon,
                      size: size.widthOf(weight: sizingWeight.w0),
                      color: coloration.decorationColor(
                          decorationVariant: decorationVariant)),
                  HeadingThreeText(cardLabel, decorationVariant),
                  Text(cardBody,
                      textAlign: TextAlign.center,
                      style: body1().copyWith(
                        color: coloration.decorationColor(
                            decorationVariant: decorationVariant),
                      ))
                ])));
  }
}
