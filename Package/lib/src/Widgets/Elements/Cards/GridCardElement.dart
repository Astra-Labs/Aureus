import 'package:aureus/aureus.dart';

class GridCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;

  const GridCardElement(
      {required this.decorationVariant, required this.cardLabel});

  @override
  Widget build(BuildContext context) {
    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: size.layoutItemWidth(3, size.logicalScreenSize),
              maxWidth: size.layoutItemWidth(3, size.logicalScreenSize),
              minHeight: size.layoutItemWidth(3, size.logicalScreenSize),
              maxHeight: size.layoutItemWidth(3, size.logicalScreenSize)),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: BodyTwoText(cardLabel, decorationVariant)),
          )),
    );
  }
}
