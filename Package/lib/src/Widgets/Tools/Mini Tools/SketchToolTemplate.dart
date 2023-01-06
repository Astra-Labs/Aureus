import 'package:aureus/aureus.dart';

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
  List<Offset> points = <Offset>[];
  var canvas = Container();
  Color activeColor = Colors.amber;

  GestureDetector buildCurrentPath(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return GestureDetector(
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: RepaintBoundary(
        child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: size.layoutItemHeight(2, screenSize),
            child: CustomPaint(painter: PainterCanvas as CustomPainter)),
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
    Color colorOne = brightness() == Brightness.light
        ? const Color.fromRGBO(176, 9, 9, 1.0)
        : const Color.fromRGBO(255, 203, 203, 1.0);

    Color colorTwo = brightness() == Brightness.light
        ? const Color.fromRGBO(212, 126, 46, 1.0)
        : const Color.fromRGBO(255, 188, 126, 1.0);

    Color colorThree = brightness() == Brightness.light
        ? const Color.fromRGBO(195, 179, 32, 1.0)
        : const Color.fromRGBO(255, 246, 165, 1.0);

    Color colorFour = brightness() == Brightness.light
        ? const Color.fromRGBO(51, 151, 16, 1.0)
        : const Color.fromRGBO(183, 255, 157, 1.0);

    Color colorFive = brightness() == Brightness.light
        ? const Color.fromRGBO(39, 93, 175, 1.0)
        : const Color.fromRGBO(173, 209, 255, 1.0);

    Color colorSix = brightness() == Brightness.light
        ? const Color.fromRGBO(121, 12, 172, 1.0)
        : const Color.fromRGBO(228, 171, 255, 1.0);

    var colorCircle1 = GestureDetector(
        onTap: () => {changeColor(colorOne)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorOne,
                border: activeColor == colorOne
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var colorCircle2 = GestureDetector(
        onTap: () => {changeColor(colorTwo)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorTwo,
                border: activeColor == colorTwo
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var colorCircle3 = GestureDetector(
        onTap: () => {changeColor(colorThree)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorThree,
                border: activeColor == colorThree
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var colorCircle4 = GestureDetector(
        onTap: () => {changeColor(colorFour)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorFour,
                border: activeColor == colorFour
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var colorCircle5 = GestureDetector(
        onTap: () => {changeColor(colorFive)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorFive,
                border: activeColor == colorFive
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var colorCircle6 = GestureDetector(
        onTap: () => {changeColor(colorSix)},
        child: Container(
            width: size.responsiveSize(35.0),
            height: size.responsiveSize(35.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: colorSix,
                border: activeColor == colorSix
                    ? universalBorder()
                    : Border.all(color: Colors.transparent))));

    var circleScroll = SizedBox(
        height: size.responsiveSize(65.0),
        width: size.layoutItemWidth(1, size.logicalScreenSize()) * 0.6,
        child: Container(
          decoration:
              CardBackingDecoration(priority: decorationPriority.inactive)
                  .buildBacking(),
          padding: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                colorCircle1,
                const SizedBox(width: 5.0),
                colorCircle2,
                const SizedBox(width: 5.0),
                colorCircle3,
                const SizedBox(width: 5.0),
                colorCircle4,
                const SizedBox(width: 5.0),
                colorCircle5,
                const SizedBox(width: 5.0),
                colorCircle6
              ],
            ),
          ),
        ));

    return Column(
      children: [
        const SizedBox(height: 10.0),
        const DividerElement(),
        const SizedBox(height: 10.0),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              circleScroll,
              const Spacer(),
              SmolButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'Clear',
                  buttonHint: 'Clears the canvas',
                  buttonAction: () => {points.clear()}),
            ]),
        const SizedBox(height: 10.0),
        Container(
            height: size.layoutItemHeight(1, size.logicalScreenSize()),
            width: size.layoutItemWidth(1, size.logicalScreenSize()),
            decoration:
                CardBackingDecoration(priority: decorationPriority.standard)
                    .buildBacking(),
            child: Stack(
              children: const [
                //buildCurrentPath(context),
              ],
            ))
      ],
    );
  }
}

class PainterCanvas extends CustomPainter {
  final Color stroke;
  const PainterCanvas({required this.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint toolPaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = stroke;
  }

  @override
  bool shouldRepaint(PainterCanvas oldDelegate) {
    return true;
  }
}
