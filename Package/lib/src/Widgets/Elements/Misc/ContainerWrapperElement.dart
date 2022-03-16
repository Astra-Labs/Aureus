import 'package:aureus/aureus.dart';

class ContainerWrapperElement extends StatefulWidget {
  final List<Widget> children;
  final wrapperVariants containerVariant;
  final bool takesFullWidth;

  const ContainerWrapperElement(
      {required this.children,
      required this.containerVariant,
      this.takesFullWidth = false});

  @override
  _ContainerWrapperElementState createState() =>
      _ContainerWrapperElementState();
}

class _ContainerWrapperElementState extends State<ContainerWrapperElement> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    Widget children = widget.containerVariant == wrapperVariants.stackScroll
        ? SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.responsiveTextSize(20.0),
                children: widget.children))
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: widget.children,
          );

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          constraints: widget.takesFullWidth
              ? BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                  maxHeight: MediaQuery.of(context).size.height)
              : BoxConstraints(
                  minWidth: size.layoutItemWidth(1, screenSize),
                  maxWidth: size.layoutItemWidth(1, screenSize),
                  minHeight: size.layoutItemHeight(1, screenSize),
                  maxHeight: size.layoutItemHeight(1, screenSize)),
          child: children);
    });
  }
}
