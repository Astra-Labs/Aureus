import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- ARTICLE VIEW ELEMENT ----------*/

class ArticleViewElement extends StatelessWidget {
  ///
  final String title;

  ///
  final String subheader;

  ///
  final String body;

  const ArticleViewElement(
      {required this.title, required this.subheader, required this.body});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return SizedBox(
      width: size.layoutItemWidth(1, screenSize),
      height: size.layoutItemHeight(1, screenSize),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10.0),
            HeadingOneText(title, decorationPriority.standard),
            const SizedBox(height: 10.0),
            SubheaderText(subheader, decorationPriority.standard),
            const SizedBox(height: 10.0),
            const DividerElement(),
            const SizedBox(height: 10.0),
            BodyOneText(body, decorationPriority.standard),
            const SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}
