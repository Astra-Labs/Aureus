import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- TAB SUBHEADER ELEMENT ----------*/
/// A small tab subheader.

class TabSubheaderElement extends StatelessWidget {
  ///The title of the tab subheader.
  final String title;

  const TabSubheaderElement({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: title,
        textStyle: tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Semantics.fromProperties(
      properties: SemanticsWrapper.header(label: title),
      child: Container(
          constraints: BoxConstraints(
              minHeight: minimumButtonTextSize.height + 10,
              maxHeight: minimumButtonTextSize.height + 10,
              maxWidth: minimumButtonTextSize.width + 20,
              minWidth: minimumButtonTextSize.width + 20),
          decoration: TabItemBackingDecoration(
                  decorationVariant: decorationPriority.standard,
                  variant: tabItemDecorationVariants.roundedRectangle)
              .buildBacking()
              .copyWith(color: coloration.accentColor()),
          child:
              Center(child: TagTwoText(title, decorationPriority.important))),
    );
  }
}
