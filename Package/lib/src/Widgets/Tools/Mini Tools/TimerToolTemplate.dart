import 'package:aureus/aureus.dart';

class TimerToolTemplate extends ToolCardTemplate {
  final Duration allotment;
  final VoidCallback onFinish;

  TimerToolTemplate(
      {required this.allotment,
      required this.onFinish,
      required templatePrompt,
      required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

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
        toolChildren: [
          TimerElement(
              timeAllotment: allotment,
              onFinish: () => {
                    onFinish(),
                    toolTemplateMaster.notifyObserverForward(),
                    notificationMaster.sendAlertNotificationRequest(
                        "Timer completed", Assets.time)
                  }),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Completed a Timer.', decorationPriority.standard)
        ]);
  }
}

class _TimerInputCard extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _TimerInputCard();

  @override
  _TimerInputCardState createState() => _TimerInputCardState();
}

class _TimerInputCardState extends State<_TimerInputCard> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
