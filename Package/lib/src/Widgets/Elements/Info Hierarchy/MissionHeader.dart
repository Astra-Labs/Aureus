import 'package:aureus/aureus.dart';

//A backing that acts as a timer.
//Doc Link:

class MissionHeader extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        HeadingOneText('How can I help?', decorationPriority.standard),
        Image.asset(''),
      ],
    );
  }
}
