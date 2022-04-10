import 'package:aureus/aureus.dart';

class SensoryMapToolTemplate extends ToolCardTemplate {
  SensoryMapToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          const _SensoryMapInputCard(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card',
                    buttonAction: () => {onNextCard()}),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Used the Sensory Map tool', decorationPriority.standard)
        ]);
  }
}

class _SensoryMapInputCard extends StatefulWidget {
  const _SensoryMapInputCard();

  @override
  _SensoryMapInputCardState createState() => _SensoryMapInputCardState();
}

class _SensoryMapInputCardState extends State<_SensoryMapInputCard> {
  Offset itemOffset = Offset.zero;

  Container createMapCircle(double diameter) {
    return Container(
      width: diameter,
      height: diameter,
      decoration:
          BoxDecoration(border: universalBorder(), shape: BoxShape.circle),
    );
  }

  void onPanStart(DragStartDetails details) {
    print('User started drawing');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    setState(() {
      itemOffset = point;
    });

    print(point);
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);

    setState(() {
      itemOffset = point;
    });

    print(point);
  }

  void onPanEnd(DragEndDetails details) {
    print('User ended drawing');
  }

  @override
  Widget build(BuildContext context) {
    var sensoryMarker = PulseShadowElement(
        isActive: true,
        pulseWidth: size.responsiveSize(40),
        child: Container(
          width: size.responsiveSize(40),
          height: size.responsiveSize(40),
          decoration: ButtonBackingDecoration(
                  variant: buttonDecorationVariants.circle,
                  priority: decorationPriority.important)
              .buildBacking(),
          child: Icon(
            Icons.circle_outlined,
            color: coloration.sameColor(),
          ),
        ));

    var mappingCircles = SizedBox(
        width: 250,
        height: 250,
        child: Stack(
          alignment: Alignment.center,
          children: [
            createMapCircle(size.responsiveSize(275)),
            createMapCircle(size.responsiveSize(250)),
            createMapCircle(size.responsiveSize(225)),
            createMapCircle(size.responsiveSize(200)),
            createMapCircle(size.responsiveSize(175)),
            createMapCircle(size.responsiveSize(150)),
            createMapCircle(size.responsiveSize(125)),
            createMapCircle(size.responsiveSize(100)),
            createMapCircle(size.responsiveSize(75)),
            createMapCircle(size.responsiveSize(50)),
            createMapCircle(size.responsiveSize(25)),
            const Positioned(
                top: 0.0, child: TabSubheaderElement(title: "Top")),
            const Positioned(
                right: 0.0, child: TabSubheaderElement(title: "Right")),
            const Positioned(
                bottom: 0.0, child: TabSubheaderElement(title: "Bottom")),
            const Positioned(
                left: 0.0, child: TabSubheaderElement(title: "Left")),
            Positioned(
                left: itemOffset.dx, top: itemOffset.dy, child: sensoryMarker),
          ],
        ));

    return GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: mappingCircles);
  }
}
