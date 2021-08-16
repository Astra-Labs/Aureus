import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A notification card that describes a message to the user
//Doc Link:

class NotificationComponent extends StatefulWidget {
  final String notificationSubCategory;
  final DateTime notificationReceived;
  final String notificationHeader;
  final String notificationBody;
  final bool hasNotificationBeenRead;

  const NotificationComponent(
      {required this.notificationSubCategory,
      required this.notificationReceived,
      required this.notificationHeader,
      required this.notificationBody,
      required this.hasNotificationBeenRead});

  @override
  _NotificationComponentState createState() => _NotificationComponentState();
}

class _NotificationComponentState extends State<NotificationComponent> {
  @override
  Widget build(BuildContext context) {
    //variables that determine how the notification will be displayed
    BoxDecoration boxDecoration;
    BoxDecoration readIndicatorDecoration;
    Color textColor;

    //changes variables to show read variant
    if (widget.hasNotificationBeenRead) {
      boxDecoration = BoxDecoration(
          color: foundation.white(),
          border: Border.all(color: foundation.steel(), width: 1),
          borderRadius: BorderRadius.circular(10.0));
      readIndicatorDecoration =
          BoxDecoration(shape: BoxShape.circle, color: foundation.white());
      textColor = foundation.iron();

      //changes variables to show unread variant
    } else {
      boxDecoration = BoxDecoration(
          gradient: foundation.lightGradient(),
          border: Border.all(color: foundation.steel(), width: 1),
          borderRadius: BorderRadius.circular(10.0));
      readIndicatorDecoration =
          BoxDecoration(shape: BoxShape.circle, color: foundation.carbon());
      textColor = foundation.black();
    }

    return AspectRatio(
        aspectRatio: 3 / 1,
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(5),
            decoration: boxDecoration,
            width: 350,
            height: 125,
            child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  //first row, contains subcategory and time stamp
                  Row(
                    children: [
                      TagOneText(widget.notificationSubCategory, textColor),
                      TagOneText('$widget.notificationReceived', textColor)
                    ],
                  ),
                  //second row, contains subcategory header and read indicator
                  Row(children: [
                    HeadingTwoText(widget.notificationHeader, textColor),
                    Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.centerRight,
                        decoration: readIndicatorDecoration)
                  ]),
                  //third row, body text
                  Row(children: [
                    BodyTwoText(widget.notificationBody, textColor)
                  ])
                ]))));
  }
}
