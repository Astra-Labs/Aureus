import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- MISSION HEADER ----------*/
/// A header that shows a title, and the resource logo.

class MissionHeaderElement extends StatelessWidget {
  /// An alternate title if you don't want the standard "How can I help?" title.
  final String? altTitle;
  const MissionHeaderElement({Key? key, this.altTitle}) : super(key: key);

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
          HeadingOneText(altTitle != null ? altTitle! : 'How can I help?',
              decorationPriority.standard),
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
