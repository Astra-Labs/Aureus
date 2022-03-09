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
        const SizedBox(height: 20.0),
        HeadingOneText(title, decorationPriority.standard),
        const SizedBox(height: 5.0),
        SubheaderText(subheader, decorationPriority.standard),
        const SizedBox(height: 10.0),
        DividerElement(),
        const SizedBox(height: 10.0),
        BodyOneText(body, decorationPriority.standard),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
