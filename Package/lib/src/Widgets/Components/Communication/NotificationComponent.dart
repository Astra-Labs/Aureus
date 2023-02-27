import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- NOTIFICATION COMPONENT ----------*/
/// A notification card that describes a message to the user

class NotificationComponent extends StatelessWidget {
  /// A 'sub category' of the notification. E.G: Someone's contact name under a text notification
  final String notificationSubCategory;

  /// When it was received
  final DateTime notificationReceived;

  /// The header
  final String notificationHeader;

  /// The notification body
  final String notificationBody;

  /// Whether or not the notification has been read. This is something you
  /// will have to implement on the developer side.
  final bool hasNotificationBeenRead;

  const NotificationComponent(
      {required this.notificationSubCategory,
      required this.notificationReceived,
      required this.notificationHeader,
      required this.notificationBody,
      required this.hasNotificationBeenRead});

  @override
  Widget build(BuildContext context) {
    //variables that determine how the notification will be displayed

    decorationPriority notificationPriority = hasNotificationBeenRead
        ? decorationPriority.standard
        : decorationPriority.important;

    BoxDecoration boxDecoration =
        CardBackingDecoration(decorationVariant: notificationPriority)
            .buildBacking();
    BoxDecoration readIndicatorDecoration = hasNotificationBeenRead
        ? BoxDecoration(color: palette.white().withOpacity(0.0))
        : BoxDecoration(color: coloration.sameColor(), shape: BoxShape.circle);

    var screenSize = size.logicalScreenSize();

    var notificationTopContent = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TagTwoText(notificationSubCategory, notificationPriority),
          TagTwoText(
              '${notificationReceived.month}/${notificationReceived.day}/${notificationReceived.year}',
              notificationPriority)
        ],
      ),
    );

    var notificationMidContent = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            HeadingFourText(notificationHeader, notificationPriority),
            Center(
              child: Container(
                  width: 10,
                  height: 10,
                  alignment: Alignment.center,
                  decoration: readIndicatorDecoration),
            )
          ]),
    );

    var notificationBottomContent = Padding(
      padding: const EdgeInsets.all(8.0),
      child: BodyOneText(notificationBody, notificationPriority),
    );

    Column notificationContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          notificationTopContent,
          notificationMidContent,
          notificationBottomContent
        ]);

    var notificationComponentContainer = FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minHeight: size.layoutItemHeight(6, screenSize),
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize)),
          alignment: Alignment.center,
          padding: size.universalPadding(),
          decoration: boxDecoration,
          child: Center(child: notificationContent)),
    );

    return notificationComponentContainer;
  }
}
