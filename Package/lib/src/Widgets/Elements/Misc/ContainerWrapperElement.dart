import 'package:aureus/aureus.dart';

class ContainerWrapperElement extends StatelessWidget {
  final List<Widget> children;
  final wrapperVariants containerVariant;

  ContainerWrapperElement(
      {required this.children, required this.containerVariant});

  Widget build(BuildContext context) {
    Widget containerFormatting(List<Widget> items) {
      if (containerVariant == wrapperVariants.stackScroll) {
        return SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.heightOf(weight: sizingWeight.w0),
                children: children));
      } else if (containerVariant == wrapperVariants.fullScreen) {
        return Container(
            constraints: BoxConstraints(
                minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
                maxWidth: size.layoutItemWidth(1, size.logicalScreenSize),
                minHeight: size.layoutItemHeight(6, size.logicalScreenSize)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            ));
      }

      throw ("Proper variant wasn't given to ContainerWrapperElement.");
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return containerFormatting(children);
    });
  }
}
