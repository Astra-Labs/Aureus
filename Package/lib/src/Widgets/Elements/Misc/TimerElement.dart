import 'package:aureus/aureus.dart';

//A blank card that looks like a "pane" of glass
//Doc Link:

class TimerElement extends StatefulWidget {
  @override
  _TimerElementState createState() => _TimerElementState();
}

class _TimerElementState extends State<TimerElement> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
            width: 245,
            height: 245,
            alignment: Alignment.center,
            child: Text('00:00:00', style: foundation.heading1()),
            decoration: ButtonBackingDecoration(
                    variant: buttonDecorationVariants.circle,
                    priority: decorationPriority.inactive)
                .buildBacking()));
  }
}
