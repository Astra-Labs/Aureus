import 'package:aureus/aureus.dart';

//A bar that indicators progress for a given task.

class ArticleViewElement extends StatelessWidget {
  final String title;
  final String subheader;
  final String body;

  const ArticleViewElement(
      {required this.title, required this.subheader, required this.body});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        HeadingOneText(title, decorationPriority.standard),
        SubheaderText(subheader, decorationPriority.standard),
        DividerElement(),
        BodyOneText(body, decorationPriority.standard)
      ],
    );
  }
}
