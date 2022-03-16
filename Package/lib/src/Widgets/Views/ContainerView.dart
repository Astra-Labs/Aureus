import 'package:aureus/aureus.dart';
//A container that sets the size for the screen with QA-approved padding,
//and enables the exit bar at the top of the screen when enabled in the safety plan.

class ContainerView extends StatefulWidget {
  //determines if primary landing page (fluid decoration),
  //or just secondary page (blur decoration).
  final decorationPriority decorationVariant;
  final ContainerWrapperElement builder;
  final bool? takesFullWidth;
  final bool? hasBackgroundImage;

  const ContainerView(
      {required this.decorationVariant,
      required this.builder,
      this.takesFullWidth = false,
      this.hasBackgroundImage = true});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

// Widgets Binding Observer is added to the Container View to automatically
// alert child widgets as important information changes.
class _ContainerViewState extends State<ContainerView>
    with AureusNotificationObserver {
  @override
  void initState() {
    AureusNotificationMaster().registerObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    AureusNotificationMaster().unregisterObserver(this);
    super.dispose();
  }

  //Displays an alert controller over the current view.
  @override
  void showAlertController() {
    super.showAlertController();
  }

  //Displays a content warning over the current view.
  @override
  void showContentWarning() {
    super.showContentWarning();
  }

  // Displays a dropdown notification at the top of the view.
  @override
  void showDropdownNotification() {
    super.showDropdownNotification();
  }

  @override
  Widget build(BuildContext context) {
    //pull exit bar setting status from Safety Plan
    const bool hasExitBar = false;

    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();

    BoxDecoration containerBacking() {
      if (widget.decorationVariant == decorationPriority.important &&
          widget.hasBackgroundImage == true) {
        //returns primary image defined in AureusStylization
        return BoxDecoration(
          image: DecorationImage(
            image: coloration.primaryImage().image,
            fit: BoxFit.cover,
          ),
        );
      } else if (widget.decorationVariant == decorationPriority.standard &&
          widget.hasBackgroundImage == true) {
        //returns secondary image defined in AureusStylization
        return BoxDecoration(
          image: DecorationImage(
            image: coloration.secondaryImage().image,
            fit: BoxFit.cover,
          ),
        );
      }
      return const BoxDecoration();
    }

    Container backingContainer = Container(
        alignment: Alignment.center,
        width: screenWidth,
        decoration: widget.hasBackgroundImage == true
            ? containerBacking()
            : const BoxDecoration(color: Colors.transparent),
        padding: widget.takesFullWidth!
            ? const EdgeInsets.all(0.0)
            : EdgeInsets.fromLTRB(0.0, size.heightOf(weight: sizingWeight.w0),
                0.0, size.heightOf(weight: sizingWeight.w0)),
        child: SizedBox(
            width: widget.takesFullWidth!
                ? screenWidth
                : size.layoutItemWidth(1, screenSize),
            height: widget.takesFullWidth!
                ? screenHeight
                : size.layoutItemHeight(1, screenSize),
            child: Center(child: widget.builder)));

    if (hasExitBar == true) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [const ExitBarComponent(), backingContainer],
            );
          },
        ),
      );
    } else if (hasExitBar == false) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: (LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return backingContainer;
            },
          )));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
