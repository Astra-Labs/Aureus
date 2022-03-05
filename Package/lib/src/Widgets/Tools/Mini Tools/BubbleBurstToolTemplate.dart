import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Tools/BaseCardToolTemplate.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class BubbleBurstToolTemplate extends ToolCardTemplate {
  BubbleBurstToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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

class _BubbleBurstCard extends StatefulWidget {
  _BubbleBurstCard();

  @override
  _BubbleBurstCardState createState() => _BubbleBurstCardState();
}

class _BubbleBurstCardState extends State<_BubbleBurstCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
