import 'package:aureus/aureus.dart';

//A visual divider that breaks up space
//Doc Link:

class DividerElement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 30, 10, 30),
        child: Container(
            width: (MediaQuery.of(context).size.width - 30),
            height: 2,
            decoration: BoxDecoration(color: foundation.steel())));
  }
}
