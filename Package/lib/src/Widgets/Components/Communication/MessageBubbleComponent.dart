import 'package:aureus/aureus.dart';

//A bubble that contains a text message from a sender or a receiver
//Doc Link:

class MessageBubbleComponent extends StatefulWidget {
  final messagingVariants messageVariant;
  final String messageBody;
  final communicationStatus currentStatus;

  const MessageBubbleComponent(
      {required this.messageVariant,
      required this.messageBody,
      required this.currentStatus});

  @override
  _MessageBubbleComponentState createState() => _MessageBubbleComponentState();
}

class _MessageBubbleComponentState extends State<MessageBubbleComponent> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time

    decorationPriority bubblePriority = decorationPriority.standard;

    String returnMessageStatus(communicationStatus status) {
      switch (status) {
        case communicationStatus.delivered:
          return 'Delivered';
        case communicationStatus.failed:
          return 'Failed';
        case communicationStatus.sending:
          return 'Sending';
      }
    }

    if (widget.messageVariant == messagingVariants.receiver) {
      bubblePriority = decorationPriority.important;
    } else if (widget.messageVariant == messagingVariants.sender) {
      bubblePriority = decorationPriority.standard;
    }

    BoxDecoration backingDecoration =
        LayerBackingDecoration(priority: bubblePriority).buildBacking();

    Size bodyTextSizing = Accessibility.textStringSize(
        textInput: widget.messageBody,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              constraints: BoxConstraints(
                  minHeight: bodyTextSizing.height * 2.5,
                  maxWidth: size.layoutItemWidth(2, size.physicalScreenSize)),
              padding: EdgeInsets.all(12.0),
              decoration: backingDecoration,
              child: Center(
                  child: SizedBox(
                      width: bodyTextSizing.width,
                      height: bodyTextSizing.height,
                      child: BodyTwoText(widget.messageBody, bubblePriority)))),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TagTwoText(
                widget.messageVariant == messagingVariants.sender
                    ? returnMessageStatus(widget.currentStatus)
                    : '',
                decorationPriority.standard),
          )
        ]);
  }
}
