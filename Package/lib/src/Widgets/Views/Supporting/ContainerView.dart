import 'dart:developer';

import 'package:aureus/aureus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*--------- CONTAINER VIEW ----------*/

// A container that sets the size for the screen,
// enables the exit bar at the top of the screen when enabled in
// the safety plan, and shows notifications / prompts to the user.
// Think of this view as the 'glue' that holds Aureus together.

// ALL VIEWS IN AN AUREUS RESOURCE SHOULD BE A CONTAINER VIEW.
// If you do not use ContainerView, you will not be able to access
// the NotificationObserver or some built-in Safety Plan features.

class ContainerView extends StatefulWidget {
  //determines if primary landing page (fluid decoration),
  //or just secondary page (blur decoration).
  final decorationPriority decorationVariant;
  final ContainerWrapperElement builder;
  final bool? takesFullWidth;
  final bool? hasBackgroundImage;
  final bool? showQuickActionBar;

  const ContainerView(
      {required this.decorationVariant,
      required this.builder,
      this.takesFullWidth = false,
      this.hasBackgroundImage = true,
      this.showQuickActionBar = true});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView>
    with AureusNotificationObserver, TickerProviderStateMixin {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  late Future<double> actionBarX;
  late Future<double> actionBarY;

  double holdX = 0.0;
  double holdY = 0.0;

  Widget overlayView = Container();
  var hasOverlayEnabled = false;
  late AnimationController _controller;
  late Animation<Offset> _offset;
  final GlobalKey quickBarKey = GlobalKey();

  @override
  void initState() {
    log("state initiation");

    notificationMaster.registerObserver(this);
    sensation.prepare();

    actionBarY = preferences.then((SharedPreferences preferences) {
      return preferences.getDouble('barY') ?? 0.6;
    });

    actionBarX = preferences.then((SharedPreferences preferences) {
      return preferences.getDouble('barX') ?? 0.4;
    });

    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          //uses the sensory library to make a notification noise.
          sensation.createSensation(sensationType.notification);
        }
        if (status == AnimationStatus.dismissed) {
          //resets the container after the animation is reversed
          setState(() {
            overlayView = Container();
            hasOverlayEnabled = false;
          });
        }
      });

    _offset = Tween<Offset>(
            begin: const Offset(0.0, 0.0), end: const Offset(0.0, 0.0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

    super.initState();
  }

  @override
  void dispose() {
    print('view disposed!');

    //Removes items in the container view
    resetRequests();

    _controller.dispose();
    sensation.dispose();
    super.dispose();
  }

  @override
  void resetRequests() {
    print('-----------------------------------');
    print('container view: resetting overlay');

    overlayView = Container();
    hasOverlayEnabled = false;
    notificationMaster.unregisterObserver(this);

    setState(() {
      _controller.reverse();
    });
  }

  //Displays an alert controller over the current view.
  @override
  void showAlertController(AlertControllerObject data) {
    print('container view: showing alert controller');
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      hasOverlayEnabled = true;
      overlayView = Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: CenteredAlertControllerComponent(alertData: data));
      _controller.forward();
    });
  }

  //Displays a content warning over the current view.
  @override
  void showContentWarning(String description, IconData icon) {
    print('container view: showing content warning');
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      hasOverlayEnabled = true;
      overlayView = Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: ContentWarningComponent(
              warningDescription: description,
              onContinue: () => {resetRequests()}));
      _controller.forward();
    });
  }

  // Displays a dropdown notification at the top of the view.
  @override
  void showDropdownNotification(String description, IconData icon) {
    print('container view: showing banner notification');
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      hasOverlayEnabled = true;
      overlayView = Container(
        width: size.logicalWidth(),
        height: size.heightOf(weight: sizingWeight.w3),
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(
            0.0, size.heightOf(weight: sizingWeight.w0), 0.0, 0.0),
        child: BannerNotificationComponent(body: description, icon: icon),
      );
      _controller.forward();
    });
  }

  @override
  void showBottomActionController(AlertControllerObject data) {
    print('container view: showing bottom action sheet');
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));
      hasOverlayEnabled = true;
      overlayView = Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(15.0),
          child: BottomActionSheetComponent(alertData: data));
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    //pull exit bar setting status from Safety Plan
    var safety = resourceValues.safetySettings;
    const bool hasExitBar = false;

    var screenSize = size.logicalScreenSize();
    var screenWidth = size.logicalWidth();
    var screenHeight = size.logicalHeight();
    var actionBar;

    holdY = screenHeight * 0.8;

    if (safety.isActionBarDevEnabled == true) {
      var actionBarWidget = QuickActionBarComponent(
          key: quickBarKey, tabItems: safety.quickActionItems!);

      var draggableActionBar = Draggable(
          child: actionBarWidget,
          feedback: actionBarWidget,
          onDragEnd: (dragDetails) {
            setState(() {
              holdX = dragDetails.offset.dx;
              holdY = dragDetails.offset.dy;
            });
          });

      actionBar = draggableActionBar;
    }

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
      }

      if (widget.decorationVariant == decorationPriority.standard &&
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

    // Calculates width based on parameters
    var containerWidth = widget.takesFullWidth!
        ? screenWidth
        : size.layoutItemWidth(1, screenSize);

    //Calucates height based on parameters
    var containerHeight = widget.takesFullWidth!
        ? screenHeight
        : size.layoutItemHeight(1, screenSize);

    // Creates decoration depending on params w/ background images
    var containerDecoration = widget.hasBackgroundImage == true
        ? containerBacking()
        : const BoxDecoration(color: Colors.transparent);

    // Sets padding according to full width or not
    var containerPadding = widget.takesFullWidth!
        ? EdgeInsets.fromLTRB(
            0.0, size.heightOf(weight: sizingWeight.w0), 0.0, 0.0)
        : EdgeInsets.fromLTRB(0.0, size.heightOf(weight: sizingWeight.w0), 0.0,
            size.heightOf(weight: sizingWeight.w0));

    // Builds the backing container
    Container backingContainer = Container(
        alignment: Alignment.center,
        width: screenWidth,
        decoration: containerDecoration,
        padding: containerPadding,
        child: SizedBox(
            width: containerWidth,
            height: containerHeight,
            child: Center(
                child: Stack(children: [
              widget.builder,
              safety.isActionBarDevEnabled == true
                  ? Positioned(top: holdY, left: holdX, child: actionBar)
                  : const SizedBox(width: 1),
            ]))));

    // Builds an overlay item to hold any items coming into the view
    var overlayItem = SizedBox(
        width: size.logicalWidth(),
        height: size.logicalHeight(),
        child: Stack(
          children: [
            backingContainer,
            Positioned(
                top: _offset.value.dy * (size.logicalWidth()),
                left: _offset.value.dx * (size.logicalHeight()),
                child: overlayView),
          ],
        ));

    if (hasExitBar == true) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const ExitBarComponent(),
                hasOverlayEnabled == true ? overlayItem : backingContainer
              ],
            );
          },
        ),
      );
    } else if (hasExitBar == false) {
      return Scaffold(
          backgroundColor: Colors.transparent,
          body: (LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return hasOverlayEnabled == true ? overlayItem : backingContainer;
            },
          )));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
