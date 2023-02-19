import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- CONTAINER WRAPPER ----------*/
/// Used in conjuction with a [ContainerView] to 'layout' the elements. This
/// is where you should pass all of the view's children.

class ContainerWrapperElement extends StatefulWidget {
  ///
  final List<Widget> children;

  ///
  final wrapperVariants containerVariant;

  ///
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

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return children;
    });
  }
}
