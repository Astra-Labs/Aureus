import 'package:aureus/aureus.dart';

class DividerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.layoutItemWidth(1, size.logicalScreenSize),
        height: 2,
        decoration: BoxDecoration(color: coloration.inactiveColor()));
  }
}
