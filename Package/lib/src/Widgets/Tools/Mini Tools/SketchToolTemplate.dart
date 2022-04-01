import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class SketchToolTemplate extends ToolCardTemplate {
  SketchToolTemplate({required templatePrompt, required badgeIcon})
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
        toolChildren: []);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText(
              'Drew with the Sketch Input Tool', decorationPriority.standard)
        ]);
  }
}

class _SketchInputCard extends StatefulWidget {
  const _SketchInputCard();

  @override
  _SketchInputCardState createState() => _SketchInputCardState();
}

class _SketchInputCardState extends State<_SketchInputCard> {
  List<Offset> points = <Offset>[];
  var canvas = Container();
  Color activeColor = Colors.amber;

  GestureDetector buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          color: Colors.transparent,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // CustomPaint widget will go here
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    print('User started drawing');
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    print(point);
  }

  void onPanUpdate(DragUpdateDetails details) {
    final box = context.findRenderObject() as RenderBox;
    final point = box.globalToLocal(details.globalPosition);
    print(point);
  }

  void onPanEnd(DragEndDetails details) {
    print('User ended drawing');
  }

  void changeColor(Color color) {
    setState(() {
      activeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*var colorCircle1 = GestureDetector(
        onTap: () => {changeColor(Colors.amber)},
        child: Container(
            width: size.responsiveSize(50.0),
            height: size.responsiveSize(50.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
                border: activeColor == Colors.amber
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));
    var colorCircle2 = Container();
    var colorCircle3 = Container();
    var colorCircle4 = Container();
    var colorCircle5 = Container();*/

    //var circleScroll = SizedBox(height: size.responsiveSize(65.0), width: size.layoutItemWidth(2, area))

    return Container(
      child: Column(
        children: [
          const SizedBox(height: 10.0),
          const DividerElement(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Clear',
                    buttonHint: 'Clears the canvas',
                    buttonAction: () => {points.clear()}),
                const Spacer(),
              ]),
        ],
      ),
    );
  }
}

class SketchCanvas extends CustomPainter {
  final Color stroke;
  const SketchCanvas({required this.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint toolPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = stroke;
  }

  @override
  bool shouldRepaint(SketchCanvas delegate) {
    return true;
  }
}
