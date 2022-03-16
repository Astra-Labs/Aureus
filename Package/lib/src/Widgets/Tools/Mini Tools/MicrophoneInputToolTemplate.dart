import 'package:aureus/aureus.dart';

class MicrophoneInputToolTemplate extends ToolCardTemplate {
  MicrophoneInputToolTemplate()
      : super(templatePrompt: '', badgeIcon: const IconData(0));

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
        toolChildren: const []);
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
  const _MicrophoneInputCard();

  @override
  _MicrophoneInputCardState createState() => _MicrophoneInputCardState();
}

class _MicrophoneInputCardState extends State<_MicrophoneInputCard> {
  var currentIcon = Icons.play_arrow;
  var currentHint = 'Starts a recording.';
  bool isRecordingUser = false;

  void startRecording() {
    setState(() {
      currentIcon = Icons.pause;
      currentHint = 'Stops the recording.';
      isRecordingUser = true;
    });
  }

  void stopRecording() {
    setState(() {
      currentIcon = Icons.play_arrow;
      currentHint = 'Starts a recording.';
      isRecordingUser = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadingOneText('data', decorationPriority.standard),
        const SizedBox(height: 10.0),
        PrimaryIconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: currentIcon,
            buttonHint: currentHint,
            buttonAction: () => {
                  if (isRecordingUser == true)
                    {stopRecording()}
                  else if (isRecordingUser == false)
                    {startRecording()}
                })
      ],
    );
  }
}
