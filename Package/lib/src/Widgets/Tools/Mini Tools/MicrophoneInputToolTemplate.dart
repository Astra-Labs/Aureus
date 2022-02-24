import 'package:aureus/aureus.dart';

class MicrophoneInputToolTemplate extends ToolCardTemplate {
  MicrophoneInputToolTemplate()
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
