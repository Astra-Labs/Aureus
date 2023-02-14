import 'package:aureus/aureus.dart';
import 'dart:async';

/*--------- TIMER ELEMENT ----------*/
//A backing that acts as a timer.

// ignore: must_be_immutable
class TimerElement extends StatefulWidget {
  final Duration timeAllotment;
  VoidCallback? onFinish;

  TimerElement({required this.timeAllotment, this.onFinish});

  @override
  _TimerElementState createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement>
    with TickerProviderStateMixin {
  late Timer _timer;
  var _isTimerActive = false;
  var intDuration = 0;
  var timeString = '';

  void startTimer() {
    print("timer string is $timeString");
    print("int duration is $intDuration");
    _isTimerActive = true;
    controller.forward();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (intDuration == 0) {
          timer.cancel();
          //uses the sensory library to make an attention noise.
          sensation.createSensation(sensationType.attention);
          if (widget.onFinish != null) {
            widget.onFinish!();
          }
          _isTimerActive = false;
        } else {
          intDuration--;
        }
      },
    );
  }

  void pauseTimer() {
    setState(() {
      print("timer string is $timeString");
      print("int duration is $intDuration");
      _isTimerActive = false;
      _timer.cancel();
      controller.stop();
    });
  }

  void resetTimer() {
    setState(() {
      _isTimerActive = false;
      _timer.cancel();
      intDuration = widget.timeAllotment.inSeconds;
      controller.reset();
    });
  }

  late AnimationController controller;

  @override
  void initState() {
    // Checks user's accessibility settings to make sure animations are allowed,
    //and then initializes the animation controller.

    intDuration = widget.timeAllotment.inSeconds;
    sensation.prepare();

    if (accessibility.accessFeatures.disableAnimations == false ||
        accessibility.accessFeatures.reduceMotion == false) {
      controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: intDuration),
      )..addListener(() {
          setState(() {
            timeString = formatHHMMSS(intDuration);
          });
        });
      super.initState();
    }
  }

  @override
  void dispose() {
    pauseTimer();
    sensation.dispose();
    controller.dispose();
    super.dispose();
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
    var responsiveSize = size.responsiveSize(350);

    var timerCircle = SizedBox(
      width: responsiveSize,
      height: responsiveSize,
      child: Stack(alignment: Alignment.center, children: [
        FloatingContainerElement(
          child: SizedBox(
            width: responsiveSize,
            height: responsiveSize,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: coloration.accentColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                child: CircularProgressIndicator(
                    backgroundColor: coloration.inactiveColor(),
                    color: coloration.accentColor(),
                    value: controller.value,
                    strokeWidth: 3.0,
                    semanticsLabel: 'Timer'),
              ),
            ),
          ),
        ),
        HeadingOneText(timeString, decorationPriority.standard)
      ]),
    );

    return Column(children: [
      timerCircle,
      const SizedBox(height: 30.0),
      SizedBox(
        width: responsiveSize,
        child: Row(children: [
          SmolButtonElement(
              decorationVariant: _isTimerActive == true
                  ? decorationPriority.inactive
                  : decorationPriority.important,
              buttonTitle: 'Start',
              buttonHint: 'Starts the timer.',
              buttonAction: () => {startTimer()}),
          const Spacer(),
          SmolButtonElement(
              decorationVariant: _isTimerActive == true
                  ? decorationPriority.standard
                  : decorationPriority.inactive,
              buttonTitle: 'Pause',
              buttonHint: 'Pauses the timer.',
              buttonAction: () => {pauseTimer()}),
          const Spacer(),
          SmolButtonElement(
              decorationVariant: _isTimerActive == true
                  ? decorationPriority.standard
                  : decorationPriority.inactive,
              buttonTitle: 'Cancel',
              buttonHint: 'Cancels the timer.',
              buttonAction: () => {resetTimer()}),
        ]),
      ),
    ]);
  }
}
