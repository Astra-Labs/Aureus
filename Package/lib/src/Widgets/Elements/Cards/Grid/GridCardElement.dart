import 'package:aureus/aureus.dart';

/*--------- GRID CARD ----------*/

class GridCardElement extends StatelessWidget {
  final decorationPriority decorationVariant;
  final String cardLabel;
  final Size gridSize;

  const GridCardElement(
      {required this.decorationVariant,
      required this.cardLabel,
      required this.gridSize});

  @override
  Widget build(BuildContext context) {
    var maxWidth =
        size.isDesktopDisplay() ? gridSize.width / 2 : gridSize.width / 3.2;

    var gridCardContent = Align(
        alignment: Alignment.topLeft,
        child: BodyTwoText(cardLabel, decorationVariant));

    var gridCardContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: maxWidth,
              maxWidth: maxWidth,
              minHeight: maxWidth,
              maxHeight: maxWidth),
          decoration:
              CardBackingDecoration(priority: decorationVariant).buildBacking(),
          clipBehavior: Clip.hardEdge,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: gridCardContent,
          )),
    );

    return gridCardContainer;
  }
}
