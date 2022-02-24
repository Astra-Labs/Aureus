import 'package:aureus/aureus.dart';
/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class CameraInputToolTemplate extends ToolCardTemplate {
  CameraInputToolTemplate()
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
