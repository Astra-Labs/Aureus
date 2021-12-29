import 'package:aureus/aureus.dart';

//A visual divider that breaks up space
//Doc Link:

class DividerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Container(
            width: size.widthOf(weight: sizingWeight.w8),
            height: 1,
            decoration: BoxDecoration(color: coloration.inactiveColor())));
  }
}
