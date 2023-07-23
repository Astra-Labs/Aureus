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

  /// Whether or not the view should manage recieving notifications.
  /// This should only be done if the ContainerView is the top most root
  /// of the view controller hierarchy. If there is a higher widget in the hierarchy
  /// (like a navigation bar), then the HIGHEST parent should implement [NotificationOverlayView].
  final bool? shouldManageNotifications;

  const ContainerView({
    required this.decorationVariant,
    required this.builder,
    this.takesFullWidth = false,
    this.hasBackgroundImage = true,
    this.showQuickActionBar = true,
    this.shouldManageNotifications = true,
  });

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView>
    with WidgetsBindingObserver {
  final Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  late Future<double> actionBarX;
  late Future<double> actionBarY;

  Offset position = const Offset(0.5, 0.0);

  @override
  void initState() {
    actionBarY = preferences.then((SharedPreferences preferences) {
      return /*preferences.getDouble('barY') ?? */ 0.6;
    });

    actionBarX = preferences.then((SharedPreferences preferences) {
      return /* preferences.getDouble('barX') ?? */ 0.4;
    });

    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangeMetrics();
  }

  void updateAccessBarPosition(DraggableDetails details) {
    setState(() {
      RenderBox? renderBox = context.findRenderObject() as RenderBox;
      position = renderBox.globalToLocal(details.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    // pull exit bar setting status from Safety Plan
    var safety = resourceValues.safetySettings!;
    const bool hasExitBar = false;

    var screenSize = MediaQuery.of(context).size;
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
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
        ? EdgeInsets.fromLTRB(0.0,
            size.heightOf(weight: sizingWeight.w0, area: screenSize), 0.0, 0.0)
        : EdgeInsets.fromLTRB(
            0.0,
            size.heightOf(weight: sizingWeight.w1, area: screenSize),
            0.0,
            size.heightOf(weight: sizingWeight.w0, area: screenSize));

    // Builds the backing container with an action bar

    var stack = Stack(children: [
      widget.builder,
      (safety.isActionBarDevEnabled == true &&
              widget.showQuickActionBar == true)
          ? Positioned(
              left: 0.0 * (screenWidth) /*position.dx*/,
              top: 0.75 * (screenHeight) /*position.dy*/,
              child: actionBar,
            )
          : const SizedBox(width: 1),
    ]);

    // Builds the general backing container
    Container backingContainer = Container(
      alignment: Alignment.center,
      width: screenWidth,
      decoration: containerDecoration,
      padding: containerPadding,
      child: SizedBox(
        width: containerWidth,
        height: screenHeight,
        child: stack,
      ),
    );

    // Adds a notification overlay depending on if it's a nav bar child.
    // If it's a nav bar child, the notification overlay should be handled by the
    // TOP MOST nav bar parent.
    Widget containerContent() {
      return widget.shouldManageNotifications == true
          ? NotificationOverlayView(child: backingContainer)
          : backingContainer;
    }

    var exitBarContent = Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const ExitBarComponent(),
              containerContent(),
            ],
          );
        },
      ),
    );

    var nonExitBarContent = Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: (LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return containerContent();
        },
      )),
    );

    return hasExitBar == true ? exitBarContent : nonExitBarContent;
  }
}
