import 'package:aureus/aureus.dart';
import 'package:sensors_plus/sensors_plus.dart';

/*

*/

class GyroscopeDirectionToolTemplate extends ToolCardTemplate {
  GyroscopeDirectionToolTemplate()
      : super(templatePrompt: '', badgeIcon: const IconData(0));

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: const []);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Moved device with Gyroscope Direction Tool',
              decorationPriority.standard)
        ]);
  }
}

class _GyroscopeDirectionCard extends StatefulWidget {
  const _GyroscopeDirectionCard();

  @override
  _GyroscopeDirectionCardState createState() => _GyroscopeDirectionCardState();
}

class _GyroscopeDirectionCardState extends State<_GyroscopeDirectionCard> {
  late double x, y;
  var currentOffset = const Offset(0, 0);
  var quadrantActive = 0;

  @override
  void initState() {
    gyroscopeEvents.listen((event) {
      setState(() {
        x = event.x;
        y = event.y;
      });
    });

    super.initState();
  }

  Offset calculateQuadrantPosition() {
    return const Offset(0.0, 0.0);
  }

  int findActiveQuadrant(Offset rect) {
    if (Rect.fromPoints(const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 2;
    } else if (Rect.fromPoints(
            const Offset(101.0, 100.0), const Offset(200.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 3;
    } else if (Rect.fromPoints(
            const Offset(201.0, 100.0), const Offset(300.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 4;
    } else if (Rect.fromPoints(
            const Offset(0.0, 101.0), const Offset(0.0, 200.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 1;
    } else if (Rect.fromPoints(
            const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 0;
    } else if (Rect.fromPoints(
            const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 5;
    } else if (Rect.fromPoints(
            const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 8;
    } else if (Rect.fromPoints(
            const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 7;
    } else if (Rect.fromPoints(
            const Offset(0.0, 100.0), const Offset(0.0, 100.0))
        .contains(rect)) {
      //user is dead centered, no quadrant.
      return 6;
    }

    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Center shaker ball quadrant arrow
        Positioned(
            child: SizedBox(
          width: 300,
          height: 300,
          child: Container(
            decoration: BoxDecoration(
                color: coloration.inactiveColor(), shape: BoxShape.circle),
            padding: const EdgeInsets.all(10),
            child: Positioned.fill(
                child: Container(
                    width: 30.0,
                    height: 30.0,
                    decoration: BoxDecoration(
                        color: coloration.inactiveColor(),
                        shape: BoxShape.circle))),
          ),
        )),
        //left quadrant arrow
        Positioned(
            child: Icon(Assets.next,
                color: quadrantActive == 0
                    ? coloration.accentColor()
                    : coloration.inactiveColor())),
        //top quadrant arrow
        Positioned(
            child: Icon(Assets.next,
                color: quadrantActive == 0
                    ? coloration.accentColor()
                    : coloration.inactiveColor())),
        //right quadrant arrow
        Positioned(
            child: Icon(Assets.next,
                color: quadrantActive == 0
                    ? coloration.accentColor()
                    : coloration.inactiveColor())),
        //bottom quadrant arrow
        Positioned(
            child: Icon(Assets.next,
                color: quadrantActive == 0
                    ? coloration.accentColor()
                    : coloration.inactiveColor())),
      ],
    );
  }
}
