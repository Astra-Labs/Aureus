import 'package:aureus/aureus.dart';
import 'dart:async';

//A backing that acts as a timer.
//Doc Link:

class TimerElement extends StatefulWidget {
  final DateTimeRange timeAllotment;

  const TimerElement({required this.timeAllotment});

  @override
  _TimerElementState createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement> {
  late Timer _timer;
  late Duration duration;

  void startTimer() {
    duration = widget.timeAllotment.duration;
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (duration.inSeconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            duration = (duration.inSeconds - 1) as Duration;
          });
        }
      },
    );
  }

  void pauseTimer() {
    _timer.cancel();
  }

  void resetTimer() {
    _timer.cancel();
    duration = widget.timeAllotment.duration;
  }

  @override
  void dispose() {
    pauseTimer();
  }

  String formatHHMMSS(int seconds) {
    int hours = (seconds / 3600).truncate();
    seconds = (seconds % 3600).truncate();
    int minutes = (seconds / 60).truncate();

    String hoursStr = (hours).toString().padLeft(2, '0');
    String minutesStr = (minutes).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');

    if (hours == 0) {
      return "$minutesStr:$secondsStr";
    }

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  @override
  Widget build(BuildContext context) {
    var timerBacking =
        LayerBackingDecoration(priority: decorationPriority.inactive)
            .buildBacking()
            .copyWith(
              borderRadius: BorderRadius.circular(245),
            );

    return Column(children: [
      FloatingContainerElement(
        child: Container(
            width: 300,
            height: 300,
            alignment: Alignment.center,
            child: HeadingOneText(
                formatHHMMSS(widget.timeAllotment.duration.inSeconds),
                decorationPriority.standard),
            decoration: timerBacking),
      ),
      SizedBox(height: 10.0),
      Row(children: [
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Start',
            buttonAction: () => {startTimer()}),
        Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Pause',
            buttonAction: () => {pauseTimer()}),
        Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: 'Cancel',
            buttonAction: () => {resetTimer()}),
      ]),
    ]);
  }
}
