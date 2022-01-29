import 'package:aureus/aureus.dart';

class DividerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
        width: size.layoutItemWidth(1, screenSize),
        height: 2,
        decoration: BoxDecoration(color: coloration.inactiveColor()));
  }
}
