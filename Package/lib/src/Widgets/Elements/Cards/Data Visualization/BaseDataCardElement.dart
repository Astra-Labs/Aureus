import 'package:aureus/aureus.dart';

// The base class for a card tool template.
// A CARD is a tool template that doesn't take up a full page, and
// is accessed within a card carousel only. It's used in conjunction with
// other cards, not as a stand alone item.

class BaseDataDetailCard extends StatefulWidget {
  final bool isBeingEdited;
  final String detailLabel;
  final List<Widget> detailChildren;

  const BaseDataDetailCard(
      {required this.isBeingEdited,
      required this.detailLabel,
      required this.detailChildren});

  @override
  _BaseDataDetailCardState createState() => _BaseDataDetailCardState();
}

class _BaseDataDetailCardState extends State<BaseDataDetailCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    //checks if widget is actively engaged, and returns proper layout.
    return FloatingContainerElement(
        child: Container(
            constraints: BoxConstraints(
                maxWidth: size.layoutItemWidth(1, screenSize),
                minWidth: size.layoutItemWidth(1, screenSize),
                minHeight: size.layoutItemHeight(5, screenSize),
                maxHeight: size.layoutItemHeight(3, screenSize)),
            decoration: CardBackingDecoration(
                    priority: widget.isBeingEdited
                        ? decorationPriority.active
                        : decorationPriority.inactive)
                .buildBacking(),
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BodyTwoText(widget.detailLabel, decorationPriority.standard),
                const SizedBox(height: 20.0),
                Column(children: widget.detailChildren),
                const SizedBox(height: 20.0)
              ],
            )));
  }
}
