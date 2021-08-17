import 'package:flutter/cupertino.dart';
import 'package:aureus/foundation.dart';

//A bubble that contains a text message from a sender or a receiver
//Doc Link:

class MessageBubbleComponent extends StatefulWidget {
  final messagingVariants currentVariant;
  final String messageBody;
  final communicationStatus currentStatus;

  const MessageBubbleComponent(
      {required this.currentVariant,
      required this.messageBody,
      required this.currentStatus});

  @override
  _MessageBubbleComponentState createState() => _MessageBubbleComponentState();
}

class _MessageBubbleComponentState extends State<MessageBubbleComponent> {
  @override
  Widget build(BuildContext context) {
    //variables that change how the variants are displayed in build time
    BoxDecoration backingDecoration;
    Alignment boxAlignment;
    String deliveryStatus;

    switch (widget.currentVariant) {
      case messagingVariants.receiver:
        {
          //variables that define the variant 'receiver' for message bubble component
          backingDecoration = BoxDecoration();
          boxAlignment = Alignment.bottomLeft;
          deliveryStatus = '';

          break;
        }

      case messagingVariants.sender:
        {
          //variables that define the variant 'sender' for message bubble component
          backingDecoration = BoxDecoration();
          boxAlignment = Alignment.bottomLeft;
          deliveryStatus = '$widget.currentStatus';
          break;
        }
    }

    return Container(width: 300, height: , decoration: , child: Center(child: BodyTwoText(widget.messageBody, foundation.black())));
  }
}
