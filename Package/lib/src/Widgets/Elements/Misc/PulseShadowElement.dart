import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PULSE SHADOW ----------*/
///  Using the data provided from the AureusStylization class,
/// creates a 'pulse' that breathes behind an object.

class PulseShadowElement extends StatefulWidget {
  ///
  final Widget child;

  ///
  final bool isActive;

  ///
  final double pulseWidth;

  const PulseShadowElement(
      {required this.child, required this.isActive, required this.pulseWidth});

  @override
  _PulseShadowElementState createState() => _PulseShadowElementState();
}

class _PulseShadowElementState extends State<PulseShadowElement>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacity;
  late Animation _pulse;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          });
    _pulse = Tween(begin: 25.0, end: 50.0).animate(_controller);
    _opacity = Tween(begin: 0.1, end: 0.5).animate(_controller);

    if (widget.isActive == true) {
      _controller.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pulseShadowContainer = Container(
        width: widget.pulseWidth,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.pulseWidth / 2),
            boxShadow: [
              BoxShadow(
                  color: coloration.accentColor().withOpacity(_opacity.value),
                  blurRadius: _pulse.value),
            ]),
        child: widget.child);

    return widget.isActive == true ? pulseShadowContainer : widget.child;
  }
}
