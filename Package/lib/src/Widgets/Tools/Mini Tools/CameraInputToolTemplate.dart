import 'package:aureus/aureus.dart';
/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class CameraInputToolTemplate extends ToolCardTemplate {
  CameraInputToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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
          BodyTwoText('Took a photo with Camera Input Tool',
              decorationPriority.standard)
        ]);
  }
}

class _CameraInputCard extends StatefulWidget {
  _CameraInputCard();

  @override
  _CameraInputCardState createState() => _CameraInputCardState();
}

class _CameraInputCardState extends State<_CameraInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
