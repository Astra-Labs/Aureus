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

    return Container(
        constraints: BoxConstraints(
            minHeight: minimumButtonTextSize.height * 1.8,
            maxHeight: minimumButtonTextSize.height * 2,
            maxWidth: minimumButtonTextSize.width * 1.6,
            minWidth: minimumButtonTextSize.width * 1.4),
        decoration:
            LayerBackingDecoration(priority: decorationPriority.standard)
                .buildBacking()
                .copyWith(color: coloration.accentColor()),
        child:
            Center(child: TagOneText('$title', decorationPriority.important)));
  }
}
