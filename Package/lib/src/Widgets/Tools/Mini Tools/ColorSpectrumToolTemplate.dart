import 'package:aureus/aureus.dart';
import 'dart:async';
import 'dart:math';

typedef ColorCodeBuilder = Widget Function(BuildContext context, Color color);

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class ColorSpectrumInputToolTemplate extends ToolCardTemplate {
  ColorSpectrumInputToolTemplate({required templatePrompt, required badgeIcon})
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
        toolChildren: const [
          _ColorSpectrumInputCard(),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Selected a color with Color Spectrum tool',
              decorationPriority.standard)
        ]);
  }
}

// This tool is based off of flutter_circle_color_picker,
// a pub.dev package that you can find here.
// https://github.com/itome/flutter_circle_color_picker
// It's been modified to fit Aureus' needs within
// the legal context of the MIT license, but credit
// should be 100% given to them for creating this.

class _ColorSpectrumInputCard extends StatefulWidget {
  const _ColorSpectrumInputCard();

  @override
  _ColorSpectrumInputCardState createState() => _ColorSpectrumInputCardState();
}

class _ColorSpectrumInputCardState extends State<_ColorSpectrumInputCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    return CircleColorPicker(
        size: Size(size.layoutItemWidth(1, screenSize) * 0.6,
            size.layoutItemWidth(1, screenSize) * 0.6));
  }
}

class CircleColorPickerController extends ChangeNotifier {
  CircleColorPickerController({
    Color initialColor = const Color.fromARGB(255, 255, 0, 0),
  }) : _color = initialColor;

  Color _color;
  Color get color => _color;
  set color(Color color) {
    _color = color;
    notifyListeners();
  }
}

class CircleColorPicker extends StatefulWidget {
  const CircleColorPicker({
    Key? key,
    this.onChanged,
    this.onEnded,
    this.size = const Size(200, 200),
    this.strokeWidth = 6,
    this.thumbSize = 32,
    this.controller,
    this.colorCodeBuilder,
  }) : super(key: key);

  /// Called during a drag when the user is selecting a color.
  ///
  /// This callback called with latest color that user selected.
  final ValueChanged<Color>? onChanged;

  /// Called when drag ended.
  ///
  /// This callback called with latest color that user selected.
  final ValueChanged<Color>? onEnded;

  /// An object to controll picker color dynamically.
  ///
  /// Provide initialColor if needed.
  final CircleColorPickerController? controller;

  /// The size of widget.
  /// Draggable area is thumb widget is included to the size,
  /// so circle is smaller than the size.

  final Size size;

  /// The width of circle border.
  final double strokeWidth;

  /// The size of thumb for circle picker.
  final double thumbSize;

  /// Widget builder that show color code section.
  /// This functions is called every time color changed.
  ///
  /// Default is Text widget that shows rgb strings;
  final ColorCodeBuilder? colorCodeBuilder;

  Color get initialColor => controller?.color ?? coloration.accentColor();

  double get initialLightness => HSLColor.fromColor(initialColor).lightness;

  double get initialHue => HSLColor.fromColor(initialColor).hue;

  @override
  _CircleColorPickerState createState() => _CircleColorPickerState();
}

class _CircleColorPickerState extends State<CircleColorPicker>
    with TickerProviderStateMixin {
  late AnimationController _lightnessController;
  late AnimationController _hueController;

  Color get _color {
    return HSLColor.fromAHSL(
      1,
      _hueController.value,
      1,
      _lightnessController.value,
    ).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width + 40,
      height: widget.size.height + 80,
      child: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Container(
                      decoration: CardBackingDecoration(
                              priority: decorationPriority.inactive)
                          .buildBacking(),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5.0),
                      child: _HuePicker(
                        hue: _hueController.value,
                        size: Size(
                          widget.size.width - 25,
                          widget.size.height - 25,
                        ),
                        strokeWidth: widget.strokeWidth,
                        thumbSize: widget.thumbSize,
                        onEnded: _onEnded,
                        onChanged: (hue) {
                          setState(() {
                            _hueController.value = hue;
                          });
                        },
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _hueController,
                      builder: (context, child) {
                        return AnimatedBuilder(
                          animation: _lightnessController,
                          builder: (context, _) {
                            return Center(
                              child: Container(
                                width: widget.size.width - 100,
                                height: widget.size.height - 100,
                                decoration: BoxDecoration(
                                  color: _color,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 3,
                                    color: HSLColor.fromColor(_color)
                                        .withLightness(
                                          _lightnessController.value * 4 / 5,
                                        )
                                        .toColor(),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  decoration: CardBackingDecoration(
                          priority: decorationPriority.inactive)
                      .buildBacking(),
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: RotatedBox(
                      quarterTurns: 1,
                      child: _LightnessSlider(
                        width: widget.size.width - 25,
                        thumbSize: 26,
                        hue: _hueController.value,
                        lightness: _lightnessController.value,
                        onEnded: _onEnded,
                        onChanged: (lightness) {
                          _lightnessController.value = lightness;
                        },
                      )),
                ),
              ],
            ),
            const SizedBox(height: 30.0),
            StandardButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonTitle: 'Finish picking color',
                buttonHint: 'Goes to the next card',
                buttonAction: () =>
                    {toolTemplateMaster.notifyObserverForward()})
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    sensation.prepare();
    _hueController = AnimationController(
      vsync: this,
      value: widget.initialHue,
      lowerBound: 0,
      upperBound: 360,
    )..addListener(_onColorChanged);
    _lightnessController = AnimationController(
      vsync: this,
      value: widget.initialLightness,
      lowerBound: 0,
      upperBound: 1,
    )..addListener(_onColorChanged);
    widget.controller?.addListener(_setColor);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_setColor);
    sensation.dispose();
    super.dispose();
  }

  void _onColorChanged() {
    setState(() {
      widget.onChanged?.call(_color);
      widget.controller?.color = _color;
    });
  }

  void _onEnded() {
    setState(() {
      widget.onEnded?.call(_color);
    });
  }

  void _setColor() {
    if (widget.controller != null && widget.controller!.color != _color) {
      final hslColor = HSLColor.fromColor(widget.controller!.color);
      setState(() {
        _hueController.value = hslColor.hue;
        _lightnessController.value = hslColor.lightness;
      });
    }
  }
}

class _LightnessSlider extends StatefulWidget {
  const _LightnessSlider({
    Key? key,
    required this.hue,
    required this.lightness,
    required this.width,
    required this.onChanged,
    required this.onEnded,
    required this.thumbSize,
  }) : super(key: key);

  final double hue;
  final double lightness;
  final double width;
  final ValueChanged<double> onChanged;
  final VoidCallback onEnded;
  final double thumbSize;

  @override
  _LightnessSliderState createState() => _LightnessSliderState();
}

class _LightnessSliderState extends State<_LightnessSlider>
    with TickerProviderStateMixin {
  late AnimationController _scaleController;
  Timer? _cancelTimer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: _onDown,
      onPanCancel: _onCancel,
      onHorizontalDragStart: _onStart,
      onHorizontalDragUpdate: _onUpdate,
      onHorizontalDragEnd: _onEnd,
      onVerticalDragStart: _onStart,
      onVerticalDragUpdate: _onUpdate,
      onVerticalDragEnd: _onEnd,
      child: SizedBox(
        width: widget.width,
        height: widget.thumbSize,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 12,
              margin: EdgeInsets.symmetric(
                horizontal: widget.thumbSize / 3,
              ),
              decoration: BoxDecoration(
                border: palette.universalBorder(),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                gradient: LinearGradient(
                  stops: const [0, 0.4, 1],
                  colors: [
                    HSLColor.fromAHSL(1, widget.hue, 1, 0).toColor(),
                    HSLColor.fromAHSL(1, widget.hue, 1, 0.5).toColor(),
                    HSLColor.fromAHSL(1, widget.hue, 1, 0.9).toColor(),
                  ],
                ),
              ),
            ),
            Positioned(
              left: widget.lightness * (widget.width - widget.thumbSize),
              child: ScaleTransition(
                scale: _scaleController,
                child: _Thumb(
                  size: widget.thumbSize,
                  color: HSLColor.fromAHSL(
                    1,
                    widget.hue,
                    1,
                    widget.lightness,
                  ).toColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scaleController = AnimationController(
      vsync: this,
      value: 1,
      lowerBound: 0.9,
      upperBound: 1,
      duration: const Duration(milliseconds: 50),
    );
  }

  void _onDown(DragDownDetails details) {
    _scaleController.reverse();
    widget.onChanged(details.localPosition.dx / widget.width);
  }

  void _onStart(DragStartDetails details) {
    _cancelTimer?.cancel();
    _cancelTimer = null;
    sensation.createSensation(sensationType.press);
    widget.onChanged(details.localPosition.dx / widget.width);
  }

  void _onUpdate(DragUpdateDetails details) {
    widget.onChanged(details.localPosition.dx / widget.width);
  }

  void _onEnd(DragEndDetails details) {
    sensation.createSensation(sensationType.confirmation);
    _scaleController.forward();
    widget.onEnded();
  }

  void _onCancel() {
    // ScaleDown Animation cancelled if onDragStart called immediately
    _cancelTimer = Timer(
      const Duration(milliseconds: 5),
      () {
        _scaleController.forward();
        widget.onEnded();
      },
    );
  }
}

class _HuePicker extends StatefulWidget {
  const _HuePicker({
    Key? key,
    required this.hue,
    required this.onChanged,
    required this.onEnded,
    required this.size,
    required this.strokeWidth,
    required this.thumbSize,
  }) : super(key: key);

  final double hue;
  final ValueChanged<double> onChanged;
  final VoidCallback onEnded;
  final Size size;
  final double strokeWidth;
  final double thumbSize;

  @override
  _HuePickerState createState() => _HuePickerState();
}

class _HuePickerState extends State<_HuePicker> with TickerProviderStateMixin {
  late AnimationController _scaleController;
  Timer? _cancelTimer;

  @override
  Widget build(BuildContext context) {
    final minSize = min(widget.size.width, widget.size.height);
    final offset = _CircleTween(
      minSize / 2 - widget.thumbSize / 2,
    ).lerp(widget.hue * pi / 180);
    return GestureDetector(
      onPanDown: _onDown,
      onPanCancel: _onCancel,
      onHorizontalDragStart: _onStart,
      onHorizontalDragUpdate: _onUpdate,
      onHorizontalDragEnd: _onEnd,
      onVerticalDragStart: _onStart,
      onVerticalDragUpdate: _onUpdate,
      onVerticalDragEnd: _onEnd,
      child: SizedBox(
        width: widget.size.width,
        height: widget.size.height,
        child: Stack(
          children: <Widget>[
            SizedBox.expand(
              child: Padding(
                padding: EdgeInsets.all(
                  widget.thumbSize / 2 - widget.strokeWidth,
                ),
                child: CustomPaint(
                  painter: _CirclePickerPainter(widget.strokeWidth),
                ),
              ),
            ),
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: ScaleTransition(
                scale: _scaleController,
                child: _Thumb(
                  size: widget.thumbSize,
                  color: HSLColor.fromAHSL(1, widget.hue, 1, 0.5).toColor(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      value: 1,
      lowerBound: 0.9,
      upperBound: 1,
      duration: const Duration(milliseconds: 50),
    );
  }

  void _onDown(DragDownDetails details) {
    _scaleController.reverse();
    _updatePosition(details.localPosition);
  }

  void _onStart(DragStartDetails details) {
    sensation.createSensation(sensationType.press);
    _cancelTimer?.cancel();
    _cancelTimer = null;
    _updatePosition(details.localPosition);
  }

  void _onUpdate(DragUpdateDetails details) {
    _updatePosition(details.localPosition);
  }

  void _onEnd(DragEndDetails details) {
    sensation.createSensation(sensationType.confirmation);
    _scaleController.forward();
    widget.onEnded();
  }

  void _onCancel() {
    // ScaleDown Animation cancelled if onDragStart called immediately
    _cancelTimer = Timer(
      const Duration(milliseconds: 5),
      () {
        _scaleController.forward();
        widget.onEnded();
      },
    );
  }

  void _updatePosition(Offset position) {
    final radians = atan2(
      position.dy - widget.size.height / 2,
      position.dx - widget.size.width / 2,
    );
    widget.onChanged(radians % (2 * pi) * 180 / pi);
  }
}

class _CircleTween extends Tween<Offset> {
  _CircleTween(this.radius)
      : super(
          begin: _radiansToOffset(0, radius),
          end: _radiansToOffset(2 * pi, radius),
        );

  final double radius;

  @override
  Offset lerp(double t) => _radiansToOffset(t, radius);

  static Offset _radiansToOffset(double radians, double radius) {
    return Offset(
      radius + radius * cos(radians),
      radius + radius * sin(radians),
    );
  }
}

class _CirclePickerPainter extends CustomPainter {
  const _CirclePickerPainter(
    this.strokeWidth,
  );

  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = Offset(size.width / 2, size.height / 2);
    double radio = min(size.width, size.height) / 2 - strokeWidth;

    const sweepGradient = SweepGradient(
      colors: [
        Color.fromARGB(255, 255, 0, 0),
        Color.fromARGB(255, 255, 255, 0),
        Color.fromARGB(255, 0, 255, 0),
        Color.fromARGB(255, 0, 255, 255),
        Color.fromARGB(255, 0, 0, 255),
        Color.fromARGB(255, 255, 0, 255),
        Color.fromARGB(255, 255, 0, 0),
      ],
    );

    final sweepShader = sweepGradient.createShader(
      Rect.fromCircle(center: center, radius: radio),
    );

    canvas.drawCircle(
      center,
      radio,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth * 2
        ..shader = sweepShader,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class _Thumb extends StatelessWidget {
  const _Thumb({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: palette.steel(),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(16, 0, 0, 0),
            blurRadius: 4,
            spreadRadius: 4,
          )
        ],
      ),
      alignment: Alignment.center,
      child: Container(
        width: size - 6,
        height: size - 6,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
