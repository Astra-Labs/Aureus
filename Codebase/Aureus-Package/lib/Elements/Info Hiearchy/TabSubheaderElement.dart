import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A label that has a rounded backing and acts as a category subheader
//Doc Link:

class TabSubheaderElement extends StatelessWidget {
  final String title;

  const TabSubheaderElement({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var variables = UDSVariables();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: variables.carbon(),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title,
              textAlign: TextAlign.center,
              style: variables.tag1(color: variables.melt())),
        ],
      ),
    );
  }
}
