import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- ARTICLE VIEW ELEMENT ----------*/
/// Represents an 'article' to be put into a view. This can be used for
/// legal documents, blogs, customer service pages, etc.

class ArticleViewElement extends StatelessWidget {
  /// The title of the article
  final String title;

  /// A subheader of the article
  final String subheader;

  /// The body content of the article.
  final String body;

  const ArticleViewElement(
      {required this.title, required this.subheader, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10.0),
        HeadingOneText(data: title, textColor: decorationPriority.standard),
        const SizedBox(height: 10.0),
        SubheaderText(subheader, decorationPriority.standard),
        const SizedBox(height: 10.0),
        const DividerElement(),
        const SizedBox(height: 10.0),
        BodyOneText(body, decorationPriority.standard),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
