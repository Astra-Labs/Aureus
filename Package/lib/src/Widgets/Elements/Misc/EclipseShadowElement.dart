import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- ECLIPSE SHADOW ----------*/
/// Using the data provided from the AureusStylization class,
/// creates a moving eclipse that appears to eclipse and pass behind
/// the child object.

class EclipseShadowElement extends StatefulWidget {
  ///
  final Widget child;

  ///
  final bool isActive;

  ///
  final double eclipseWidth;

  const EclipseShadowElement(
      {required this.child,
      required this.isActive,
      required this.eclipseWidth});

  @override
  _EclipseShadowElementState createState() => _EclipseShadowElementState();
}

class _EclipseShadowElementState extends State<EclipseShadowElement>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _opacity;
  late Animation<Offset> _offset;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15))
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

    _offset = Tween<Offset>(
            begin: const Offset(0.5, 0.5), end: const Offset(0.6, 0.6))
        .animate(CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.3, 0.7, curve: Curves.decelerate)));
    _opacity = Tween(begin: 0.0, end: 0.2).animate(CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.2, 0.4, curve: Curves.decelerate)));

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
    //an oversized number to use to create padding around the eclipse
    var estimateSize = widget.eclipseWidth * 2.0;

    return SizedBox(
      width: estimateSize,
      height: estimateSize,
      child: Stack(children: [
        //First layer of the stack, aka the shadow.
        Positioned(
          top: _offset.value.dy * (estimateSize / 2),
          left: _offset.value.dx * (estimateSize / 2),
          child: Container(
            width: widget.eclipseWidth,
            height: widget.eclipseWidth,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: coloration.contrastColor().withOpacity(_opacity.value),
                  blurRadius: (30.0 * _opacity.value)),
            ]),
          ),
        ),
        //Second layer of the stack, the child widget.
        Center(child: widget.child)
      ]),
    );
  }
}
