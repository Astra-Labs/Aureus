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

class _SensoryMapInputCard extends StatefulWidget {
  _SensoryMapInputCard();

  @override
  _SensoryMapInputCardState createState() => _SensoryMapInputCardState();
}

class _SensoryMapInputCardState extends State<_SensoryMapInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
