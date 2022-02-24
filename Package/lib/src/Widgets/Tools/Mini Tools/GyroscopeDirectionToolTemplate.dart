import 'package:aureus/aureus.dart';

/*

*/

class GyroscopeDirectionToolTemplate extends ToolCardTemplate {
  final String toolPrompt;
  final IconData toolBadge;

  const GyroscopeDirectionToolTemplate(
      {required this.toolPrompt, required this.toolBadge})
      : super(
            templateItems: const [Divider()],
            templatePrompt: toolPrompt,
            badgeIcon: toolBadge);

  //Template summary is getting overriden because it's a complex card.
  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: templateItems);
  }
}

class _GyroscopeDirectionCard extends StatefulWidget {
  _GyroscopeDirectionCard();

  @override
  _GyroscopeDirectionCardState createState() => _GyroscopeDirectionCardState();
}

class _GyroscopeDirectionCardState extends State<_GyroscopeDirectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
