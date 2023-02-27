import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- DIVIDING HEADER ELEMENT ----------*/
/// A view header that has a header and a subheader.

class DividingHeaderElement extends StatelessWidget {
  /// The main header of the element
  final String headerText;

  /// The subheader text of the element
  final String subheaderText;

  const DividingHeaderElement(
      {required this.headerText, required this.subheaderText});

  @override
  Widget build(BuildContext context) {
    return Semantics.fromProperties(
      properties: SemanticsWrapper.header(label: '$headerText, $subheaderText'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          HeadingOneText(headerText, decorationPriority.standard),
          const SizedBox(height: 10.0),
          BodyOneText(subheaderText, decorationPriority.standard),
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
