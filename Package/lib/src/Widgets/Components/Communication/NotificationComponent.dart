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
        CardBackingDecoration(priority: notificationPriority).buildBacking();
    BoxDecoration readIndicatorDecoration = widget.hasNotificationBeenRead
        ? BoxDecoration(color: foundation.white().withOpacity(0.0))
        : BoxDecoration(color: coloration.sameColor(), shape: BoxShape.circle);

    ListView notificationContent =
        ListView(shrinkWrap: true, children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            TagOneText(widget.notificationSubCategory, notificationPriority),
            TagOneText(
                '${widget.notificationReceived.month}/${widget.notificationReceived.day}/${widget.notificationReceived.year}',
                notificationPriority)
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              HeadingThreeText(widget.notificationHeader, notificationPriority),
              Container(
                  width: 10,
                  height: 10,
                  alignment: Alignment.center,
                  decoration: readIndicatorDecoration)
            ]),
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              BodyTwoText(widget.notificationBody, notificationPriority)
            ]),
      )
    ]);
    return Container(
        constraints: BoxConstraints(
            maxHeight: size.layoutItemHeight(4, size.logicalScreenSize),
            maxWidth: size.layoutItemWidth(1, size.logicalScreenSize)),
        alignment: Alignment.center,
        padding: size.universalPadding(),
        decoration: boxDecoration,
        child: Center(child: notificationContent));
  }
}
