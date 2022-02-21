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
