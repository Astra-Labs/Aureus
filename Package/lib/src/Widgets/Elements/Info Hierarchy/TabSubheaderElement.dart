import 'package:aureus/aureus.dart';

//A label that has a rounded backing and acts as a category subheader
//Doc Link:

class TabSubheaderElement extends StatelessWidget {
  final String title;

  const TabSubheaderElement({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String upperCaseLabel = title.toUpperCase();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: foundation.carbon(),
      ),
      padding: size.universalPadding(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(upperCaseLabel,
              textAlign: TextAlign.center,
              style: foundation.tag1(color: foundation.melt())),
        ],
      ),
    );
  }
}
