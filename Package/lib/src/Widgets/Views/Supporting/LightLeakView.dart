import 'package:aureus/aureus.dart';

class LightLeakView extends StatefulWidget {
  const LightLeakView();

  @override
  _LightLeakViewState createState() => _LightLeakViewState();
}

class _LightLeakViewState extends State<LightLeakView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _color1;
  late Animation<Color?> _color2;
  late Animation<Alignment?> _alignment1;
  late Animation<Alignment?> _alignment2;
  late Color colorItem1;
  late Color colorItem2;
  late Color colorItem3;
  late Color colorItem4;
  late Alignment alignmentItem1;
  late Alignment alignmentItem2;
  late Alignment alignmentItem3;
  late Alignment alignmentItem4;

  List<Alignment> alignmentList = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];
  List<Color> colorList = [
    coloration.accentColor().withOpacity(0.3),
    coloration.accentColor().withOpacity(0.6),
    coloration.accentColor().withOpacity(0.9),
    coloration.inactiveColor(),
    coloration.contrastColor().withOpacity(0.2)
  ];

  void resetAnimation() {
    print('indexes being generated!');

    _controller.reset();

    var randomizedColoration = colorList.toList();
    randomizedColoration.shuffle();

    var randomizedAlignment = alignmentList.toList();
    randomizedAlignment.shuffle();

    colorItem2 = randomizedColoration[1];
    colorItem4 = randomizedColoration[3];
    alignmentItem2 = randomizedAlignment[1];
    alignmentItem4 = randomizedAlignment[3];

    _color1 =
        ColorTween(begin: colorItem1, end: colorItem2).animate(_controller);
    _alignment1 = AlignmentTween(begin: alignmentItem1, end: alignmentItem2)
        .animate(_controller);
    _color2 =
        ColorTween(begin: colorItem3, end: colorItem4).animate(_controller);
    _alignment2 = AlignmentTween(begin: alignmentItem3, end: alignmentItem4)
        .animate(_controller);

    colorItem1 = randomizedColoration[0];
    colorItem3 = randomizedColoration[2];
    alignmentItem1 = randomizedAlignment[0];
    alignmentItem3 = randomizedAlignment[2];

    _controller.forward();
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          resetAnimation();
        }
      });

    resetAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Stack(children: [
      Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(color: coloration.sameColor())),
      Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  radius: 1.5,
                  colors: [_color1.value!, Colors.transparent],
                  center: _alignment1.value!))),
      Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
              gradient: RadialGradient(
                  radius: 1.5,
                  colors: [_color2.value!, Colors.transparent],
                  center: _alignment2.value!)))
    ]);
  }
}
