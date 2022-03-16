import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SketchToolTemplate extends ToolCardTemplate {
  SketchToolTemplate()
      : super(templatePrompt: '', badgeIcon: const IconData(0));

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: const []);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText(
              'Drew with the Sketch Input Tool', decorationPriority.standard)
        ]);
  }
}

class _SketchInputCard extends StatefulWidget {
  const _SketchInputCard();

  @override
  _SketchInputCardState createState() => _SketchInputCardState();
}

class _SketchInputCardState extends State<_SketchInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SketchCanvas extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint toolPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = coloration.accentColor();
  }

  @override
  bool shouldRepaint(SketchCanvas delegate) {
    return true;
  }
}
