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
        const SizedBox(height: 40.0),
        HeadingOneText(headerText, decorationPriority.standard),
        const SizedBox(height: 10.0),
        BodyOneText(subheaderText, decorationPriority.standard),
        const SizedBox(height: 30.0),
        DividerElement(),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
