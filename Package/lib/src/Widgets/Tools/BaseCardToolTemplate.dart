import 'package:aureus/aureus.dart';

// The base class for a card tool template.
// A CARD is a tool template that doesn't take up a full page, and
// is accessed within a card carousel only. It's used in conjunction with
// other cards, not as a stand alone item.

class BaseCardToolTemplate extends StatefulWidget {
  final IconData cardIcon;
  final String toolPrompt;
  final Widget toolChildren;

  const BaseCardToolTemplate(
      {required this.cardIcon,
      required this.toolPrompt,
      required this.toolChildren});

  @override
  _BaseCardToolTemplateState createState() => _BaseCardToolTemplateState();
}

class _BaseCardToolTemplateState extends State<BaseCardToolTemplate> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
