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
    //checks if widget is actively engaged, and returns proper layout.
    return FloatingContainerElement(
        child: Container(
            decoration: CardBackingDecoration(
                    priority: widget.isBeingEdited == true
                        ? decorationPriority.standard
                        : decorationPriority.standard)
                .buildBacking(),
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyTwoText(widget.detailLabel, decorationPriority.standard),
                  const SizedBox(height: 10.0),
                  Column(children: widget.detailChildren),
                ],
              ),
            )));
  }
}
