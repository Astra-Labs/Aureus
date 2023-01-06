import 'package:aureus/aureus.dart';
import 'package:sensors_plus/sensors_plus.dart';

/*
-------------------------------
IN BETA DEVELOPMENT - DO NOT USE
-------------------------------
*/

class GyroscopeDirectionToolTemplate extends ToolCardTemplate {
  GyroscopeDirectionToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

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
        toolChildren: const [_GyroscopeDirectionCard()]);
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
  double x = 0.0;
  double y = 0.0;
  var quadrantActive = 0;

  @override
  void initState() {
    /*gyroscopeEvents.listen((event) {
      calculateQuadrantPosition(event.x * 10, event.y * 10);
    });*/

    gyroscopeEvents.listen((event) {
      calculateQuadrantPosition(event.x, event.y);
    });

    super.initState();
  }

  void calculateQuadrantPosition(double x, double y) {
    // looking for a range of x = -1...0 & y = -1...0
    if ((x <= -0.2) && (y <= -0.2)) {
      setState(() {
        quadrantActive = 2;
      });
    } else if ((x > -0.2 || x < 0.2) && (y > -0.2 || y < 0.2)) {
      setState(() {
        quadrantActive = 3;
      });
    } else if ((x <= -0.2) && (y <= 0.2)) {
      setState(() {
        quadrantActive = 4;
      });
    }
    /* top row completed */
    /*} else if ((x <= -0.26) && (y >= -0.5 || y <= 0.5)) {
      setState(() {
        quadrantActive = 1;
      });
    } else if ((x >= -0.25 || x <= 0.25) && (y >= -0.25 || y <= 0.25)) {
      setState(() {
        quadrantActive = 0;
      });
    } else if ((x <= 0.26) && (y >= -0.5 || y <= 0.5)) {
      setState(() {
        quadrantActive = 5;
      });
      /* middle row  */
    } else if ((x >= -0.5 || x <= 0.5) && (y >= -0.5 || y <= 0.5)) {
      setState(() {
        quadrantActive = 8;
      });
    } else if ((x >= -0.5 || x <= 0.5) && (y >= -0.25 || y <= 0.25)) {
      setState(() {
        quadrantActive = 7;
      });
    } else if ((x >= -0.5 || x <= 0.5) && (y >= -0.5 || y <= 0.5)) {
      setState(() {
        quadrantActive = 6;
      });
    }*/

    print('quadrant is $quadrantActive'); /* bottom row */
  }

  @override
  Widget build(BuildContext context) {
    var shakerBall = Container(
      decoration: BoxDecoration(
          color: coloration.inactiveColor(), shape: BoxShape.circle),
      padding: const EdgeInsets.all(10),
      child: Positioned.fill(
          child: Container(
              width: 30.0,
              height: 30.0,
              decoration: BoxDecoration(
                  color: coloration.inactiveColor(), shape: BoxShape.circle))),
    );

    var topRow = Row(
      children: [
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 135,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 2
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 222,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 3
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 225,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 4
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
      ],
    );

    var middleRow = Row(
      children: [
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 180,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 1
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 0,
                    child: Icon(Assets.babycarriage,
                        size: 60,
                        color: quadrantActive == 0
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 0,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 5
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
      ],
    );

    var bottomRow = Row(
      children: [
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: -10,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 8
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: 270,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 7
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
        const Spacer(),
        SizedBox(
            width: 75,
            height: 75,
            child: Container(
                decoration: BoxDecoration(
                    color: coloration.inactiveColor().withOpacity(0.2),
                    shape: BoxShape.circle),
                padding: const EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: -5,
                    child: Icon(Assets.next,
                        size: 60,
                        color: quadrantActive == 6
                            ? coloration.accentColor()
                            : coloration.inactiveColor())))),
      ],
    );

    return
        //Center shaker ball quadrant arrow
        SizedBox(
      width: 300,
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // top row of items (quadrant 2,3,4)
          const Spacer(),
          topRow,
          // middle row of items (quadrant 1,0,5)
          const Spacer(),
          middleRow,
          // bottom row of items (quadrant 8,7,6)
          const Spacer(),
          bottomRow
        ],
      ),
    );
  }
}
