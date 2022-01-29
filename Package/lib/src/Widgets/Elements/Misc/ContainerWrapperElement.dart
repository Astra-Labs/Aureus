import 'package:aureus/aureus.dart';

class ContainerWrapperElement extends StatelessWidget {
  final List<Widget> children;
  final wrapperVariants containerVariant;

  ContainerWrapperElement(
      {required this.children, required this.containerVariant});

  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();

    Widget containerFormatting(List<Widget> items) {
      if (containerVariant == wrapperVariants.stackScroll) {
        return SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.responsiveTextSize(20.0),
                children: children));
      } else if (containerVariant == wrapperVariants.fullScreen) {
        return Container(
            constraints: BoxConstraints(
                minWidth: size.layoutItemWidth(1, screenSize),
                maxWidth: size.layoutItemWidth(1, screenSize),
                minHeight: size.layoutItemHeight(1, screenSize),
                maxHeight: size.layoutItemHeight(1, screenSize)),
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
