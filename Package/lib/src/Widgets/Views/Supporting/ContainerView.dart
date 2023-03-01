// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- CONTAINER VIEW ----------*/

/// A container that sets the size for the screen,
/// enables the exit bar at the top of the screen when enabled in
/// the safety plan, and shows notifications / prompts to the user.
/// Think of this view as the 'glue' that holds Aureus together.
///
/// ALL VIEWS IN AN AUREUS RESOURCE SHOULD BE A CONTAINER VIEW.
/// If you do not use ContainerView, you will not be able to access
/// the NotificationObserver or some built-in Safety Plan features.

class ContainerView extends StatefulWidget {
  /// Determines if primary landing page (fluid decoration),
  /// or just secondary page (blur decoration).
  /// {@macro aureus.decorationPriority}
  final decorationPriority decorationVariant;

  /// A [ContainerWrapperElement] that builds the 'wrapper' around your elements
  /// to fit into this ContainerView. Think of it as your elements being wrapped
  /// in one blanket for warmth and snuggliness, and another for the graphics and pizazz.
  final ContainerWrapperElement builder;

  /// Whether or not the view should take the full width of a screen
  final bool? takesFullWidth;

  /// Whether or not the view should have a background image
  final bool? hasBackgroundImage;

  /// Whether or not the view should show a quick action bar
  final bool? showQuickActionBar;

  const ContainerView({
    required this.decorationVariant,
    required this.builder,
    this.takesFullWidth = false,
    this.hasBackgroundImage = true,
    this.showQuickActionBar = true,
  });

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView>
    with
        AureusNotificationObserver,
        TickerProviderStateMixin,
        WidgetsBindingObserver {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  late Future<double> actionBarX;
  late Future<double> actionBarY;

  Offset position = const Offset(0.5, 0.0);

  Widget overlayView = Container();
  var hasOverlayEnabled = false;
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    notificationMaster.registerObserver(this);
    sensation.prepare();

    actionBarY = preferences.then((SharedPreferences preferences) {
      return /*preferences.getDouble('barY') ?? */ 0.6;
    });

    actionBarX = preferences.then((SharedPreferences preferences) {
      return /* preferences.getDouble('barX') ?? */ 0.4;
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
    notificationMaster.unregisterObserver(this);

    //Removes items in the container view
    resetRequests();

    _controller.dispose();
    sensation.dispose();
    super.dispose();
  }

  @override
  void resetRequests() {
    overlayView = Container();
    hasOverlayEnabled = false;

    setState(() {
      _controller.reverse();
    });
  }

  // Displays an alert controller over the current view.
  @override
  void showAlertController(AlertControllerObject data) {
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

  void updateAccessBarPosition(DraggableDetails details) {
    setState(() {
      print("drag has ended!");
      RenderBox? renderBox = context.findRenderObject() as RenderBox;
      position = renderBox.globalToLocal(details.offset);

      print(position);
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

    if (safety.isActionBarDevEnabled == true &&
        widget.showQuickActionBar == true) {
      var actionBarWidget =
          EmergencyAccessBarComponent(tabItems: safety.quickActionItems!);

      /*

      IN FREEZE: this draggable component is being debugged, because it hops around 
      the screen and 'jumps'. 
      var draggableActionBar = Draggable(
          child: actionBarWidget,
          feedback: actionBarWidget,
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              RenderBox? renderBox = context.findRenderObject() as RenderBox;
              position = offset;
            });
          });

        actionBar = draggableActionBar;
      */

      actionBar = actionBarWidget;
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

    // Creates decoration depending on params w/ background images
    var containerDecoration = widget.hasBackgroundImage == true
        ? containerBacking()
        : const BoxDecoration(color: Colors.transparent);

    // Sets padding according to full width or not
    var containerPadding = widget.takesFullWidth!
        ? EdgeInsets.fromLTRB(
            0.0, size.heightOf(weight: sizingWeight.w0), 0.0, 0.0)
        : EdgeInsets.fromLTRB(0.0, size.heightOf(weight: sizingWeight.w1), 0.0,
            size.heightOf(weight: sizingWeight.w0));

    // Builds the backing container

    Container backingContainer = Container(
      alignment: Alignment.center,
      width: screenWidth,
      decoration: containerDecoration,
      padding: containerPadding,
      child: SizedBox(
        width: containerWidth,
        height: screenHeight,
        child: Stack(children: [
          widget.builder,
          (safety.isActionBarDevEnabled == true &&
                  widget.showQuickActionBar == true)
              ? Positioned(
                  left: 0.0 * (size.logicalWidth()) /*position.dx*/,
                  top: 0.75 * (size.logicalHeight()) /*position.dy*/,
                  child: actionBar,
                )
              : const SizedBox(width: 1),
        ]),
      ),
    );

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
