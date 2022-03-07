import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TimerToolTemplate extends ToolCardTemplate {
  TimerToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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
        toolChildren: [
          BodyTwoText('Completed with a Timer.', decorationPriority.standard)
        ]);
  }
}

class _TimerInputCard extends StatefulWidget {
  _TimerInputCard();

  @override
  _TimerInputCardState createState() => _TimerInputCardState();
}

class _TimerInputCardState extends State<_TimerInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
