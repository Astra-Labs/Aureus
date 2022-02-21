import 'package:aureus/aureus.dart';

class SensoryMapToolTemplate extends ToolCardTemplate {
  SensoryMapToolTemplate()
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
