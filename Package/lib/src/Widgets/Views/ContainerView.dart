import 'package:aureus/aureus.dart';
//A container that sets the size for the screen with QA-approved padding,
//and enables the exit bar at the top of the screen when enabled in the safety plan.

class ContainerView extends StatefulWidget {
  //determines if primary landing page (fluid decoration),
  //or just secondary page (blur decoration).
  final decorationPriority decorationVariant;
  final ContainerWrapperElement builder;
  final bool? takesFullWidth;

  ContainerView(
      {required this.decorationVariant,
      required this.builder,
      this.takesFullWidth = false});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

// Widgets Binding Observer is added to the Container View to automatically
// resize the backing images as the window changes.
class _ContainerViewState extends State<ContainerView>
    with WidgetsBindingObserver {
  final master = AureusResourceMaster();

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
    print('Metrics changed!');

    setState(() {
      master.notifyObservers();
    });
  }

  // When the user changes between light / dark mode, the container view uses
  // the observer pattern to reload the children.
  @override
  void didChangePlatformBrightness() {
    print('Platform brightness changed!');

    setState(() {
      master.notifyObservers();
    });
  }

  // When the user changes accessibility features, the container view uses
  // the observer pattern to reload the children.
  @override
  void didChangeAccessibilityFeatures() {
    print('Accessibility features changed!');

    setState(() {
      master.notifyObservers();
    });
  }

  @override
  Widget build(BuildContext context) {
    //pull exit bar setting status from Safety Plan
    const bool hasExitBar = false;

    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();

    BoxDecoration containerBacking() {
      if (brightness() == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid
          return BoxDecoration(
            image: DecorationImage(
              image: packageVariables.lightFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
          return BoxDecoration(
            image: DecorationImage(
              image: packageVariables.lightBlurImage!.image,
              fit: BoxFit.cover,
            ),
          );
        }
      } else if (brightness() == Brightness.dark) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns dark fluid
          return BoxDecoration(
            image: DecorationImage(
              image: packageVariables.darkFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
          return BoxDecoration(
            image: DecorationImage(
              image: packageVariables.darkBlurImage!.image,
              fit: BoxFit.cover,
            ),
          );
        }
      }
      return BoxDecoration();
    }

    Container backingContainer = Container(
        key: ValueKey<bool>(containerEnvChanged),
        alignment: Alignment.center,
        width: screenWidth,
        decoration: containerBacking(),
        padding: widget.takesFullWidth!
            ? EdgeInsets.all(0.0)
            : EdgeInsets.fromLTRB(0.0, size.heightOf(weight: sizingWeight.w0),
                0.0, size.heightOf(weight: sizingWeight.w0)),
        child: Container(
            width: widget.takesFullWidth!
                ? screenWidth
                : size.layoutItemWidth(1, screenSize),
            height: widget.takesFullWidth!
                ? screenHeight
                : size.layoutItemHeight(1, screenSize),
            child: Center(child: widget.builder)));

    if (hasExitBar == true) {
      return Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              key: ValueKey<bool>(containerEnvChanged),
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [ExitBarComponent(), backingContainer],
            );
          },
        ),
      );
    } else if (hasExitBar == false) {
      return Scaffold(
          body: (LayoutBuilder(
        key: ValueKey<bool>(containerEnvChanged),
        builder: (BuildContext context, BoxConstraints constraints) {
          return backingContainer;
        },
      )));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
