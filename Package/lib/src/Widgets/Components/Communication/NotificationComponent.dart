import 'package:aureus/aureus.dart';

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

    decorationPriority notificationPriority = widget.hasNotificationBeenRead
        ? decorationPriority.standard
        : decorationPriority.important;

    BoxDecoration boxDecoration =
        LayerBackingDecoration(priority: notificationPriority).buildBacking();
    BoxDecoration readIndicatorDecoration = widget.hasNotificationBeenRead
        ? LayerBackingDecoration(priority: decorationPriority.important)
            .buildBacking()
        : BoxDecoration(color: foundation.white().withOpacity(0.0));

    return Container(
        alignment: Alignment.center,
        padding: size.universalPadding(),
        decoration: boxDecoration,
        child: Center(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //first row, contains subcategory and time stamp
          Row(
            children: [
              TagOneText(widget.notificationSubCategory, notificationPriority),
              TagOneText('$widget.notificationReceived', notificationPriority)
            ],
          ),
          //second row, contains subcategory header and read indicator
          Row(children: [
            HeadingTwoText(widget.notificationHeader, notificationPriority),
            Container(
                width: 10,
                height: 10,
                alignment: Alignment.center,
                decoration: readIndicatorDecoration)
          ]),
          //third row, body text
          Row(children: [
            BodyTwoText(widget.notificationBody, notificationPriority)
          ])
        ])));
  }
}
