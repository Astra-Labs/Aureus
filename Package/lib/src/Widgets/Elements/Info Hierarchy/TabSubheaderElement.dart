import 'package:aureus/aureus.dart';

//A label that has a rounded backing and acts as a category subheader
//Doc Link:

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
        decoration: ButtonBackingDecoration(
                variant: buttonDecorationVariants.roundedPill,
                priority: decorationPriority.inactive)
            .buildBacking(),
        child:
            Center(child: TagOneText('$title', decorationPriority.standard)));
  }
}
