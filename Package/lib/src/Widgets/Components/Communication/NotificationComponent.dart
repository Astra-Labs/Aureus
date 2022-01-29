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
        ? BoxDecoration(color: white().withOpacity(0.0))
        : BoxDecoration(color: coloration.sameColor(), shape: BoxShape.circle);

    var screenSize = size.logicalScreenSize();

    Column notificationContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                TagTwoText(
                    widget.notificationSubCategory, notificationPriority),
                TagTwoText(
                    '${widget.notificationReceived.month}/${widget.notificationReceived.day}/${widget.notificationReceived.year}',
                    notificationPriority)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  HeadingFourText(
                      widget.notificationHeader, notificationPriority),
                  Center(
                    child: Container(
                        width: 10,
                        height: 10,
                        alignment: Alignment.center,
                        decoration: readIndicatorDecoration),
                  )
                ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: BodyOneText(widget.notificationBody, notificationPriority),
          )
        ]);
    return FloatingContainerElement(
      child: Container(
          constraints: BoxConstraints(
              minHeight: size.layoutItemHeight(6, screenSize),
              maxHeight: size.layoutItemHeight(3, screenSize),
              minWidth: size.layoutItemWidth(1, screenSize),
              maxWidth: size.layoutItemWidth(1, screenSize)),
          alignment: Alignment.center,
          padding: size.universalPadding(),
          decoration: boxDecoration,
          child: Center(child: notificationContent)),
    );
  }
}
