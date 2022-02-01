import 'package:aureus/aureus.dart';

//A bar that indicators progress for a given task.

class ArticleViewElement extends StatefulWidget {
  const ArticleViewElement();

  @override
  _ArticleViewElementState createState() => _ArticleViewElementState();
}

class _ArticleViewElementState extends State<ArticleViewElement> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator();
  }
}
