import 'package:aureus/aureus.dart';

//A label that has a rounded backing and acts as a category subheader
//Doc Link:

class TabSubheaderElement extends StatelessWidget {
  final String title;

  const TabSubheaderElement({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: LayerBackingDecoration(priority: decorationPriority.standard)
          .buildBacking(),
      padding: size.universalPadding(),
      height: size.heightOf(weight: sizingWeight.w2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TagOneText('$title'),
        ],
      ),
    );
  }
}
