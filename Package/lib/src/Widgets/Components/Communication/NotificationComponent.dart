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

    BoxDecoration boxDecoration = LayerBackingDecoration(
            priority: widget.hasNotificationBeenRead
                ? decorationPriority.inactive
                : decorationPriority.important)
        .buildBacking();
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
              TagOneText(widget.notificationSubCategory),
              TagOneText('$widget.notificationReceived')
            ],
          ),
          //second row, contains subcategory header and read indicator
          Row(children: [
            HeadingTwoText(widget.notificationHeader),
            Container(
                width: 25,
                height: 25,
                alignment: Alignment.centerRight,
                decoration: readIndicatorDecoration)
          ]),
          //third row, body text
          Row(children: [BodyTwoText(widget.notificationBody)])
        ])));
  }
}
