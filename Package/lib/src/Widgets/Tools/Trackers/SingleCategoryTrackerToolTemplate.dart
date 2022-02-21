import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SingleCategoryTrackerToolTemplate extends ToolCardTemplate {
  SingleCategoryTrackerToolTemplate()
      : super(templateItems: [], templatePrompt: '', badgeIcon: IconData(0));

  @override
  Widget returnActiveToolCard() {
    return BasePageToolTemplate(
        parentTool: parentTool,
        onToolDetail: () =>,
        pageChildren: []);
  }
}
