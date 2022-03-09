import 'package:aureus/aureus.dart';

class ContainerWrapperElement extends StatefulWidget {
  final List<Widget> children;
  final wrapperVariants containerVariant;
  final bool takesFullWidth;

  ContainerWrapperElement(
      {required this.children,
      required this.containerVariant,
      this.takesFullWidth = false});

  @override
  _ContainerWrapperElementState createState() =>
      _ContainerWrapperElementState();
}

class _ContainerWrapperElementState extends State<ContainerWrapperElement>
    with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  // When the window changes, the container view uses
  // the observer pattern to reload the children.
  @override
  void didChangeMetrics() {
    setState(() {});
  }

  // When the user changes between light / dark mode, the container view uses
  // the observer pattern to reload the children.
  @override
  void didChangePlatformBrightness() {
    setState(() {});
  }

  // When the user changes accessibility features, the container view uses
  // the observer pattern to reload the children.
  @override
  void didChangeAccessibilityFeatures() {
    setState(() {});
  }

  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    Widget containerFormatting(List<Widget> items) {
      if (widget.containerVariant == wrapperVariants.stackScroll) {
        return SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                runSpacing: size.responsiveTextSize(20.0),
                children: widget.children));
      } else if (widget.containerVariant == wrapperVariants.fullScreen) {
        return Container(
            constraints: widget.takesFullWidth
                ? BoxConstraints(
                    minWidth: screenSize.width,
                    maxWidth: screenSize.width,
                    minHeight: screenSize.height,
                    maxHeight: screenSize.height)
                : BoxConstraints(
                    minWidth: size.layoutItemWidth(1, screenSize),
                    maxWidth: size.layoutItemWidth(1, screenSize),
                    minHeight: size.layoutItemHeight(1, screenSize),
                    maxHeight: size.layoutItemHeight(1, screenSize)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: widget.children,
            ));
      }

      throw ("Proper variant wasn't given to ContainerWrapperElement.");
    }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return containerFormatting(widget.children);
    });
  }
}
