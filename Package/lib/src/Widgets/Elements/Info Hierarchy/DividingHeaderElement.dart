import 'package:aureus/aureus.dart';

class DividingHeaderElement extends StatelessWidget {
  final String headerText;
  final String subheaderText;

  const DividingHeaderElement(
      {required this.headerText, required this.subheaderText});

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(height: 40.0),
        HeadingOneText(headerText, decorationPriority.standard),
        SizedBox(height: 10.0),
        BodyOneText(subheaderText, decorationPriority.standard),
        SizedBox(height: 30.0),
        DividerElement(),
        SizedBox(height: 20.0),
      ],
    );
  }
}
