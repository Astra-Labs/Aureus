import 'package:aureus/aureus.dart';

class DividerElement extends StatelessWidget {
  const DividerElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Semantics.fromProperties(
      properties: SemanticsWrapper.ignorable(),
      child: Container(
          width: size.layoutItemWidth(1, screenSize),
          height: 2,
          decoration: BoxDecoration(color: coloration.inactiveColor())),
    );
  }
}
