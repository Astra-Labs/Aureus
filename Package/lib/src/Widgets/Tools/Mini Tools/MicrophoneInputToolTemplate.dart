import 'package:aureus/aureus.dart';

class MicrophoneInputToolTemplate extends ToolCardTemplate {
  MicrophoneInputToolTemplate()
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
        toolChildren: [
          BodyTwoText('Recorded a noise with Microphone Input tool.',
              decorationPriority.standard)
        ]);
  }
}

class _MicrophoneInputCard extends StatefulWidget {
  _MicrophoneInputCard();

  @override
  _MicrophoneInputCardState createState() => _MicrophoneInputCardState();
}

class _MicrophoneInputCardState extends State<_MicrophoneInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
