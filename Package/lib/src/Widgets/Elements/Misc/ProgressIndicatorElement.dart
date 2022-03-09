import 'package:aureus/aureus.dart';

//A bar that indicators progress for a given task.

class ProgressIndicatorElement extends StatefulWidget {
  final double value;
  const ProgressIndicatorElement({required this.value});

  @override
  _ProgressIndicatorElementState createState() =>
      _ProgressIndicatorElementState();
}

class _ProgressIndicatorElementState extends State<ProgressIndicatorElement> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: widget.value,
      backgroundColor: coloration.inactiveColor(),
      color: coloration.accentColor(),
      minHeight: 5.0,
      semanticsLabel: 'Progress Indicator',
      semanticsValue: 'Progress: ${widget.value}',
    );
  }
}
