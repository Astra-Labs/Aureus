import 'package:aureus/aureus.dart';

class MissionHeaderElement extends StatelessWidget {
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        HeadingOneText('How can I help?', decorationPriority.standard),
        Container(width: 70.0, height: 70.0, child: coloration.resourceLogo()),
      ],
    );
  }
}
