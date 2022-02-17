import 'package:aureus/aureus.dart';

// The base class for a page tool template.
// A PAGE is a tool template that uses a full page, and
// is accessed within a card navigation object. It's used solo,
// and NOT used within a card carousel. It's typically used for
// navigating information in a tool (e.g: scrolling through saved items)
// and is meant to be the scaffolding / support of a tool, not the main
// tool content.

class BasePageToolTemplate extends StatefulWidget {
  final CoreTool parentTool;
  final List<Widget> pageChildren;
  final VoidCallback onToolDetail;
  const BasePageToolTemplate(
      {required this.parentTool,
      required this.onToolDetail,
      required this.pageChildren});

  @override
  _BasePageToolTemplateState createState() => _BasePageToolTemplateState();
}

class _BasePageToolTemplateState extends State<BasePageToolTemplate> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    return SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Column(
          children: [
            SizedBox(height: 50.0),
            PageHeaderElement.withOptionsExit(
                pageTitle: '${widget.parentTool.toolName}',
                onPageDetails: widget.onToolDetail,
                onPageExit: () => {Navigator.pop(context)}),
            SizedBox(height: 30.0),
            Column(children: widget.pageChildren),
            Spacer()
          ],
        ));
  }
}
