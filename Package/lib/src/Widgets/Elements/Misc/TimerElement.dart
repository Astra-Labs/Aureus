import 'package:aureus/aureus.dart';

//A backing that acts as a timer.
//Doc Link:

class TimerElement extends StatefulWidget {
  final DateTimeRange timeAllotment;

  const TimerElement({required this.timeAllotment});

  @override
  _TimerElementState createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement> {
  @override
  Widget build(BuildContext context) {
    var timerBacking =
        LayerBackingDecoration(priority: decorationPriority.inactive)
            .buildBacking()
            .copyWith(
              borderRadius: BorderRadius.circular(245),
            );

    return FloatingContainerElement(
      child: Container(
          width: 300,
          height: 300,
          alignment: Alignment.center,
          child: HeadingOneText("${widget.timeAllotment.duration.inSeconds}",
              decorationPriority.standard),
          decoration: timerBacking),
    );
  }
}
