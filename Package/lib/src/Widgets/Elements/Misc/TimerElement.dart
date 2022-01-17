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
            .copyWith(shape: BoxShape.circle);

    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            width: 245,
            height: 245,
            alignment: Alignment.center,
            child: Text('$widget.timeAllotment.duration', style: heading1()),
            decoration: timerBacking));
  }
}
