import 'package:aureus/aureus.dart';

/*--------- CONTAINER WRAPPER ----------*/

class ContainerWrapperElement extends StatefulWidget {
  final List<Widget> children;
  final wrapperVariants containerVariant;
  final bool takesFullWidth;

  ContainerWrapperElement(
      {required this.children,
      required this.containerVariant,
      this.takesFullWidth = false})
      : assert(children.isNotEmpty == true);

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

    var paddingInset = size.widthOf(weight: sizingWeight.w0) / 2;

    var wrapperPadding = widget.takesFullWidth == true
        ? const EdgeInsets.all(0.0)
        : EdgeInsets.all(paddingInset);

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: wrapperPadding,
          child: children);
    });
  }
}
