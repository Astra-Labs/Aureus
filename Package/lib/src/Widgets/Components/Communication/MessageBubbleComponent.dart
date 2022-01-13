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

    if (widget.messageVariant == messagingVariants.receiver) {
      bubblePriority = decorationPriority.important;
    } else if (widget.messageVariant == messagingVariants.sender) {
      bubblePriority = decorationPriority.inactive;
    }

    BoxDecoration backingDecoration =
        LayerBackingDecoration(priority: bubblePriority).buildBacking();

    Size bodyTextSizing = Accessibility.textStringSize(
        textInput: widget.messageBody,
        textStyle: body2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context),
        widthLimit: 270);

    return Column(children: [
      Container(
          alignment: Alignment.centerLeft,
          width: 300,
          padding: size.universalPadding(),
          decoration: backingDecoration,
          child: Center(
              child: SizedBox(
                  width: bodyTextSizing.width,
                  height: bodyTextSizing.height,
                  child: BodyTwoText(widget.messageBody, bubblePriority)))),
      Container(
          alignment: Alignment.centerLeft,
          padding: size.universalPadding(),
          width: 300,
          child:
              TagOneText('$widget.currentStatus', decorationPriority.standard))
    ]);
  }
}
