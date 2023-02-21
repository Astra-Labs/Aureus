import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- DIVIDER ELEMENT ----------*/

class DividerElement extends StatelessWidget {
  const DividerElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Semantics.fromProperties(
      properties: SemanticsWrapper.ignorable(),
      child: Container(
          width: size.layoutItemWidth(1, screenSize),
          height: 1,
          decoration: BoxDecoration(
              color: coloration.inactiveColor().withOpacity(0.3))),
    );
  }
}
