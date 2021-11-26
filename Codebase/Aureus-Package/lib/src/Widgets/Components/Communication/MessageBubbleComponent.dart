import 'package:aureus/aureus.dart';

//A bubble that contains a text message from a sender or a receiver
//Doc Link:

class MessageBubbleComponent extends StatefulWidget {
  final modeVariants modeVariant;
  final messagingVariants messageVariant;
  final String messageBody;
  final communicationStatus currentStatus;

  const MessageBubbleComponent(
      {required this.modeVariant,
      required this.messageVariant,
      required this.messageBody,
      required this.currentStatus});

  @override
  _MessageBubbleComponentState createState() => _MessageBubbleComponentState();
}

class _MessageBubbleComponentState extends State<MessageBubbleComponent> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time

    BoxDecoration backingDecoration = BoxDecoration();
    Color textColor = foundation.black();
    String deliveryStatus = '';

    //if the message bubble is being received by the user on light mode
    if (widget.modeVariant == modeVariants.light &&
        widget.messageVariant == messagingVariants.receiver) {
      backingDecoration = BoxDecoration(
          color: foundation.frost(), borderRadius: BorderRadius.circular(20.0));
      deliveryStatus = '';
      textColor = foundation.black();

      //if the message bubble is being received by the user on dark mode
    } else if (widget.modeVariant == modeVariants.dark &&
        widget.messageVariant == messagingVariants.receiver) {
      backingDecoration = BoxDecoration(
          color: foundation.carbon(),
          borderRadius: BorderRadius.circular(20.0));
      deliveryStatus = '';
      textColor = foundation.frost();

      //if the message bubble is being sent by the user on light mode
    } else if (widget.modeVariant == modeVariants.light &&
        widget.messageVariant == messagingVariants.sender) {
      backingDecoration = BoxDecoration(
          gradient: foundation.lightGradient(),
          borderRadius: BorderRadius.circular(20.0));
      deliveryStatus = '$widget.currentStatus';
      textColor = foundation.black();

      //if the message bubble is being received by the user on dark mode
    } else if (widget.modeVariant == modeVariants.light &&
        widget.messageVariant == messagingVariants.sender) {
      backingDecoration = BoxDecoration(
          gradient: foundation.darkGradient(),
          borderRadius: BorderRadius.circular(20.0));
      deliveryStatus = '$widget.currentStatus';
      textColor = foundation.frost();
    }

    Size bodyTextSizing = Accessibility.textStringSize(
        textInput: widget.messageBody,
        textStyle: foundation.body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context),
        widthLimit: 270);

    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          width: 300,
          padding: EdgeInsets.all(10),
          decoration: backingDecoration,
          child: Center(
              child: SizedBox(
                  width: bodyTextSizing.width,
                  height: bodyTextSizing.height,
                  child: BodyTwoText(widget.messageBody, modeVariants.light)))),
      Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          width: 300,
          child: TagOneText(deliveryStatus, modeVariants.light))
    ]);
  }
}
