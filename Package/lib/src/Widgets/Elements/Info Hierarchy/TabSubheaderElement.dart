import 'package:aureus/aureus.dart';

class TabSubheaderElement extends StatelessWidget {
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
              minHeight: minimumButtonTextSize.height * 1.8,
              maxHeight: minimumButtonTextSize.height * 2,
              maxWidth: minimumButtonTextSize.width * 1.7,
              minWidth: minimumButtonTextSize.width * 1.5),
          decoration: TabItemBackingDecoration(
                  priority: decorationPriority.standard,
                  variant: tabItemDecorationVariants.roundedRectangle)
              .buildBacking()
              .copyWith(color: coloration.accentColor()),
          child:
              Center(child: TagTwoText(title, decorationPriority.important))),
    );
  }
}
