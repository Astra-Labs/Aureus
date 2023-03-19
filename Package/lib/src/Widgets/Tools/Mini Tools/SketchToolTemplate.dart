import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';
import 'dart:async';

/// {@category Widgets}
/// {@subCategory Tools}
/// {@image <image alt='' src=''>}

/*--------- SKETCH TOOL ----------*/
/// A Tool template that allows the user to sketch a drawing in response to a prompt.
/// Credit to KodeCo for creating an amazing and in-depth tutorial that allowed this
/// to be made: https://www.kodeco.com/25237210-building-a-drawing-app-in-flutter

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
        toolChildren: const [_SketchInputCard()]);
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
  final _globalKey = GlobalKey();
  List<_Line> lines = <_Line>[];
  var line = _Line([], Colors.black, 1.0);
  Color activeColor = Colors.black;
  double selectedWidth = 2.0;

  StreamController<List<_Line>> linesStreamController =
      StreamController<List<_Line>>.broadcast();
  StreamController<_Line> currentLineStreamController =
      StreamController<_Line>.broadcast();

  @override
  void dispose() {
    clear();
    super.dispose();
  }

  Future<void> clear() async {
    setState(() {
      lines = [];
      line = _Line([], Colors.transparent, 0.0);
    });
  }

  Widget returnColorCircle(Color color) {
    return GestureDetector(
      onTap: () => {
        setState(() {
          activeColor = color;
        }),
      },
      child: Container(
        width: size.responsiveSize(35.0),
        height: size.responsiveSize(35.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: activeColor == color
              ? Border.all(color: coloration.contrastColor(), width: 2.0)
              : Border.all(color: Colors.transparent),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color colorOne = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(176, 9, 9, 1.0)
        : const Color.fromRGBO(255, 203, 203, 1.0);

    Color colorTwo = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(212, 126, 46, 1.0)
        : const Color.fromRGBO(255, 188, 126, 1.0);

    Color colorThree = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(195, 179, 32, 1.0)
        : const Color.fromRGBO(255, 246, 165, 1.0);

    Color colorFour = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(51, 151, 16, 1.0)
        : const Color.fromRGBO(183, 255, 157, 1.0);

    Color colorFive = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(39, 93, 175, 1.0)
        : const Color.fromRGBO(173, 209, 255, 1.0);

    Color colorSix = palette.brightness() == Brightness.light
        ? const Color.fromRGBO(121, 12, 172, 1.0)
        : const Color.fromRGBO(228, 171, 255, 1.0);

    Color colorSeven = Colors.white;
    Color colorEight = Colors.black;

    var colorCircles = [
      const Spacer(),
      returnColorCircle(colorOne),
      const Spacer(),
      returnColorCircle(colorTwo),
      const Spacer(),
      returnColorCircle(colorThree),
      const Spacer(),
      returnColorCircle(colorFour),
      const Spacer(),
      returnColorCircle(colorFive),
      const Spacer(),
      returnColorCircle(colorSix),
      const Spacer(),
      returnColorCircle(colorSeven),
      const Spacer(),
      returnColorCircle(colorEight),
      const Spacer(),
    ];

    var circleScroll = SizedBox(
        height: size.responsiveSize(65.0),
        width: size.layoutItemWidth(1, size.logicalScreenSize()),
        child: Container(
          decoration: CardBackingDecoration(
                  decorationVariant: decorationPriority.inactive)
              .buildBacking(),
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: colorCircles,
            ),
          ),
        ));

    var row = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SmolButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'Clear',
              buttonHint: 'Clears the canvas',
              buttonAction: () => {
                    clear(),
                  }),
          const Spacer(),
          SmolButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'Finish',
              buttonHint: 'Finishes your drawing',
              buttonAction: () => {
                    toolTemplateMaster.notifyObserverForward(),
                  }),
        ]);

    var container = Container(
      height: size.layoutItemHeight(3, size.logicalScreenSize()),
      width: size.layoutItemWidth(1, size.logicalScreenSize()),
      decoration:
          CardBackingDecoration(decorationVariant: decorationPriority.standard)
              .buildBacking(),
      child: Stack(children: [
        buildAllPaths(context),
        buildCurrentPath(context),
      ]),
    );

    return Column(
      children: [
        const SizedBox(height: 10.0),
        const DividerElement(),
        const SizedBox(height: 10.0),
        circleScroll,
        const SizedBox(height: 10.0),
        container,
        const SizedBox(height: 10.0),
        row
      ],
    );
  }

  Widget buildCurrentPath(BuildContext context) {
    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: Container(
          height: size.layoutItemHeight(3, size.logicalScreenSize()),
          width: size.layoutItemWidth(1, size.logicalScreenSize()),
          padding: const EdgeInsets.all(4.0),
          color: Colors.transparent,
          alignment: Alignment.topLeft,
          child: StreamBuilder<_Line>(
            stream: currentLineStreamController.stream,
            builder: (context, snapshot) {
              return CustomPaint(
                painter: _Sketcher(
                  lines: [line],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildAllPaths(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        height: size.layoutItemHeight(3, size.logicalScreenSize()),
        width: size.layoutItemWidth(1, size.logicalScreenSize()),
        color: Colors.transparent,
        padding: const EdgeInsets.all(4.0),
        alignment: Alignment.topLeft,
        child: StreamBuilder<List<_Line>>(
          stream: linesStreamController.stream,
          builder: (context, snapshot) {
            return CustomPaint(
              painter: _Sketcher(
                lines: lines,
              ),
            );
          },
        ),
      ),
    );
  }

  void onPanStart(DragStartDetails details) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);
    line = _Line([point], activeColor, selectedWidth);
  }

  void onPanUpdate(DragUpdateDetails details) {
    RenderBox? box = context.findRenderObject() as RenderBox;
    Offset point = box.globalToLocal(details.globalPosition);

    List<Offset> path = List.from(line.path)..add(point);
    line = _Line(path, activeColor, selectedWidth);
    currentLineStreamController.add(line);
  }

  void onPanEnd(DragEndDetails details) {
    lines = List.from(lines)..add(line);
    linesStreamController.add(lines);
  }
}

/// A class that holds metadata for the sketch tool template.
class _Line {
  final List<Offset> path;
  final Color color;
  final double width;

  _Line(this.path, this.color, this.width);
}

/// A custom painter that manages drawing lines on the canvas.
class _Sketcher extends CustomPainter {
  final List<_Line> lines;

  _Sketcher({required this.lines});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.redAccent
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; ++i) {
      if (lines[i] == null) continue;
      for (int j = 0; j < lines[i].path.length - 1; ++j) {
        if (lines[i].path[j] != null && lines[i].path[j + 1] != null) {
          paint.color = lines[i].color;
          paint.strokeWidth = lines[i].width;
          canvas.drawLine(lines[i].path[j], lines[i].path[j + 1], paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(_Sketcher oldDelegate) {
    return true;
  }
}
