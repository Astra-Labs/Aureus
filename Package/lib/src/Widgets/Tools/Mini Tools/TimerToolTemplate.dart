import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class TimerToolTemplate extends ToolCardTemplate {
  TimerToolTemplate()
      : super(templateItems: [], templatePrompt: '', badgeIcon: IconData(0));

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: templateItems);
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
