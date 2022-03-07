import 'package:aureus/aureus.dart';

class MapInputToolTemplate extends ToolCardTemplate {
  MapInputToolTemplate() : super(templatePrompt: '', badgeIcon: IconData(0));

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
          BodyTwoText('Selected a location with Map Input tool.',
              decorationPriority.standard)
        ]);
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
