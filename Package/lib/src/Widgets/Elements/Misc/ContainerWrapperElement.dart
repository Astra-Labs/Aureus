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
    Widget children = widget.containerVariant == wrapperVariants.stackScroll
        ? SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.responsiveSize(20.0),
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
          constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              maxWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
              maxHeight: MediaQuery.of(context).size.height),
          padding: widget.takesFullWidth == true
              ? const EdgeInsets.all(0.0)
              : EdgeInsets.fromLTRB(
                  size.widthOf(weight: sizingWeight.w0) / 2,
                  size.widthOf(weight: sizingWeight.w1) / 2,
                  size.widthOf(weight: sizingWeight.w0) / 2,
                  size.widthOf(weight: sizingWeight.w0) / 2),
          child: children);
    });
  }
}
