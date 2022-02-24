import 'package:aureus/aureus.dart';

class MapInputToolTemplate extends ToolCardTemplate {
  MapInputToolTemplate()
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

class _MapInputCard extends StatefulWidget {
  _MapInputCard();

  @override
  _MapInputCardState createState() => _MapInputCardState();
}

class _MapInputCardState extends State<_MapInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
