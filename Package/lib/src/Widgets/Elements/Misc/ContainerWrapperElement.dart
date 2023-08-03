import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- CONTAINER WRAPPER ----------*/
/// Used in conjuction with a [ContainerView] to 'layout' the elements. This
/// is where you should pass all of the view's children.

class ContainerWrapperElement extends StatefulWidget {
  ///A list of all children you want to be displayed on the page.
  final List<Widget> children;

  /// Whether or not your container should only fill the screen,
  /// or if the items should be free to 'stack' and extend past the
  /// device height.
  final wrapperVariants containerVariant;

  /// Whether or not you want to take the full width of the screen,
  /// for full width elements, like the [FullWidthButtonElement].
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
                runSpacing:
                    size.responsiveSize(20.0, MediaQuery.of(context).size),
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
