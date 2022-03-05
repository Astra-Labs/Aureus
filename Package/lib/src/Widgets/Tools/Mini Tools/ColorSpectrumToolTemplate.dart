import 'package:aureus/aureus.dart';
/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ColorSpectrumInputToolTemplate extends ToolCardTemplate {
  ColorSpectrumInputToolTemplate()
      : super(templatePrompt: '', badgeIcon: IconData(0));

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
        toolChildren: []);
  }
}

class _ColorSpectrumInputCard extends StatefulWidget {
  _ColorSpectrumInputCard();

  @override
  _ColorSpectrumInputCardState createState() => _ColorSpectrumInputCardState();
}

class _ColorSpectrumInputCardState extends State<_ColorSpectrumInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
