import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SketchToolTemplate extends ToolCardTemplate {
  SketchToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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
        toolChildren: []);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: []);
  }
}

class _SketchInputCard extends StatefulWidget {
  _SketchInputCard();

  @override
  _SketchInputCardState createState() => _SketchInputCardState();
}

class _SketchInputCardState extends State<_SketchInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
