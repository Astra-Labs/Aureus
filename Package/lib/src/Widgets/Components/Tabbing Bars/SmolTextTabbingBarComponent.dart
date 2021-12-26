import 'package:aureus/aureus.dart';

//A group of smol buttons that acts as a tabbing bar to change data
//Doc Link:

class SmolTextTabbingBarComponent extends StatefulWidget {
  final List<TabObject> tabObjects;

  const SmolTextTabbingBarComponent({required this.tabObjects})
      : assert(tabObjects.length >= 2);

  @override
  _SmolTextTabbingBarComponentState createState() =>
      _SmolTextTabbingBarComponentState();
}

class _SmolTextTabbingBarComponentState
    extends State<SmolTextTabbingBarComponent> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
