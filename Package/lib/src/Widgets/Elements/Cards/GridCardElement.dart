import 'package:aureus/aureus.dart';

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
    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minWidth: gridSize.height / 3.2,
              maxWidth: gridSize.height / 3.2,
              minHeight: gridSize.height / 3.2,
              maxHeight: gridSize.height / 3.2),
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
