import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Tools/BaseCardToolTemplate.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class BubbleBurstToolTemplate extends ToolCardTemplate {
  BubbleBurstToolTemplate()
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
