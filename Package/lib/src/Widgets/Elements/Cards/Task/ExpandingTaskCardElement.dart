import 'package:aureus/aureus.dart';

/*--------- EXPANDING TASK CARD ----------*/

class ExpandingTaskCardElement extends StatefulWidget {
  @override
  _ExpandingTaskCardElementState createState() =>
      _ExpandingTaskCardElementState();
}

class _ExpandingTaskCardElementState extends State<ExpandingTaskCardElement> {
  var isExpanded = false;

  void expandCard() {}

  void shrinkCard() {}

  void updateTaskCount() {}

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var closedCard = FloatingContainerElement(
      child: Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(5, screenSize),
            maxHeight: size.layoutItemHeight(4, screenSize)),
        decoration: CardBackingDecoration(priority: decorationPriority.standard)
            .buildBacking(),
      ),
    );

    var expandedCard = FloatingContainerElement(
      child: Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize),
            minHeight: size.layoutItemHeight(2, screenSize),
            maxHeight: size.layoutItemHeight(2, screenSize)),
        decoration: CardBackingDecoration(priority: decorationPriority.standard)
            .buildBacking(),
      ),
    );

    return isExpanded ? expandedCard : closedCard;
  }
}
