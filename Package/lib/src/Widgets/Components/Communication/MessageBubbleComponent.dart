import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- MESSAGE BUBBLE ----------*/
/// A bubble that contains a text message from a sender or a receiver

class MessageBubbleComponent extends StatefulWidget {
  /// An enum that describes whether this message is from the sender or reciever
  final messagingVariants messageVariant;

  /// The body of the message
  final String messageBody;

  /// The delivery status of the message.
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
        LayerBackingDecoration(decorationVariant: bubblePriority)
            .buildBacking();

    Size bodyTextSizing = Accessibility.textStringSize(
        textInput: widget.messageBody,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

    var messageBubbleContent = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              constraints: BoxConstraints(
                  minHeight: bodyTextSizing.height + 20,
                  maxWidth: size.layoutItemWidth(1, screenSize) * 0.7),
              padding: const EdgeInsets.all(20.0),
              decoration: backingDecoration,
              child: Center(
                  child: Flexible(
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

    return Align(
      alignment: widget.messageVariant == messagingVariants.sender
          ? Alignment.topRight
          : Alignment.topLeft,
      child: messageBubbleContent,
    );
  }
}
