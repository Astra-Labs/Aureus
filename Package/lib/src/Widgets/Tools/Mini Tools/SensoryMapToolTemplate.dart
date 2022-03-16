import 'package:aureus/aureus.dart';
import 'dart:ui' as ui;

class SensoryMapToolTemplate extends ToolCardTemplate {
  SensoryMapToolTemplate()
      : super(templatePrompt: 'Sensory Map', badgeIcon: const IconData(0));

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
          BodyOneText('Drag the dot to where you feel xyz in your body.',
              decorationPriority.standard),
          _SensoryMapInputCard(),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Skip',
                    buttonHint:
                        'Skips the current card, and goes to the next one.',
                    buttonAction: () => {onNextCard()}),
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
  @override
  Widget build(BuildContext context) {
    return FloatingContainerElement(
      child: SizedBox(
        width: 200,
        height: 200,
        child: CustomPaint(
          size: const Size(195, 195),
          painter: SensoryMapPainter(),
        ),
      ),
    );
  }
}

class SensoryMapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const pointMode = ui.PointMode.polygon;
    final points = [
      const Offset(50, 100),
      const Offset(150, 75),
      const Offset(250, 250),
      const Offset(130, 200),
      const Offset(270, 100),
    ];
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }

  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}
