import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- MISSION HEADER ----------*/

class MissionHeaderElement extends StatelessWidget {
  const MissionHeaderElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveSize = size.responsiveSize(50.0);

    return Semantics.fromProperties(
      properties: SemanticsWrapper.header(label: 'How can I help?'),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          HeadingOneText('How can I help?', decorationPriority.standard),
          const Spacer(),
          SizedBox(
              width: responsiveSize,
              height: responsiveSize,
              child: coloration.resourceLogo()),
        ],
      ),
    );
  }
}
