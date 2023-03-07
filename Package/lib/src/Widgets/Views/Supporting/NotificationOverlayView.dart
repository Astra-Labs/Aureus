// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- NOTIFICATION OVERLAY ----------*/

/// A transparent view that manages a [AureusNotificationMaster]
/// object, and shows / hides the notifications at the correct time.
/// If you aren't using [ContainerView] or are building a custom component
/// (always use ContainerView unless you plan on custom implementations), this is
/// the widget that you would use for the notification master.

class NotificationOverlayView extends StatefulWidget {
  /// The subview to display notifications over.
  final Widget child;
  const NotificationOverlayView({required this.child});

  @override
  _NotificationOverlayViewState createState() =>
      _NotificationOverlayViewState();
}

class _NotificationOverlayViewState extends State<NotificationOverlayView>
    with AureusNotificationObserver, TickerProviderStateMixin {
  // A 'stand in' overlay view that will hold the UI components
  Widget overlayView = Container();
  var hasOverlayEnabled = false;
  late AnimationController _controller;
  late Animation<Offset> _offset;

  @override
  void initState() {
    notificationMaster.registerObserver(this);
    sensation.prepare();

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
    setState(() {
      _controller.reverse();
    });
  }

  /// Displays an alert controller over the current view.
  @override
  void showAlertController(AlertControllerObject data) {
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

      hasOverlayEnabled = true;

      overlayView = FloatingContainerElement(
        child: Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          decoration: LayerBackingDecoration(
                  decorationVariant: decorationPriority.standard)
              .buildBacking(),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: CenteredAlertControllerComponent(alertData: data),
        ),
      );

      _controller.forward();
    });
  }

  // Displays a content warning over the current view. A content warning
  // also gets a blurred background to hide the content behind it.
  @override
  void showContentWarning(String description, IconData icon) {
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

      hasOverlayEnabled = true;

      overlayView = FloatingContainerElement(
        child: Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          decoration: LayerBackingDecoration(
                  decorationVariant: decorationPriority.standard)
              .buildBacking(),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(15.0),
          child: ContentWarningComponent(
            warningDescription: description,
            onContinue: () => {
              resetRequests(),
            },
          ),
        ),
      );

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

      overlayView = FloatingContainerElement(
        child: Container(
          width: size.logicalWidth(),
          height: size.logicalHeight(),
          decoration: LayerBackingDecoration(
                  decorationVariant: decorationPriority.standard)
              .buildBacking(),
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(15.0),
          child: BottomActionSheetComponent(alertData: data),
        ),
      );

      _controller.forward();
    });
  }

  // Displays an alert controller over the current view.
  @override
  void showTextFieldAlertController(AlertControllerObject data) {
    setState(() {
      _offset = Tween<Offset>(
              begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: _controller, curve: Curves.ease));

      hasOverlayEnabled = true;

      overlayView = FloatingContainerElement(
        child: Container(
            width: size.logicalWidth(),
            height: size.logicalHeight(),
            decoration: LayerBackingDecoration(
                    decorationVariant: decorationPriority.standard)
                .buildBacking(),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(15.0),
            child: TextFieldAlertControllerComponent(
              alertData: data,
            )),
      );

      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Builds an overlay item to hold any items coming into the view
    return Material(
      child: SizedBox(
        width: size.logicalWidth(),
        height: size.logicalHeight(),
        child: Stack(
          children: [
            widget.child,
            Positioned(
                top: _offset.value.dy * (size.logicalWidth()),
                left: _offset.value.dx * (size.logicalHeight()),
                child: overlayView),
          ],
        ),
      ),
    );
  }
}
