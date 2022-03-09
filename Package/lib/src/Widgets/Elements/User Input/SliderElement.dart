import 'package:aureus/aureus.dart';

// ignore: must_be_immutable
class SliderElement extends StatefulWidget {
  var slideValue = 0.0;

  @override
  _SliderElementState createState() => _SliderElementState();
}

class _SliderElementState extends State<SliderElement> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: size.layoutItemWidth(1, screenSize)),
      child: SliderTheme(
        data: SliderTheme.of(context).copyWith(
            activeTrackColor: coloration.contrastColor(),
            inactiveTrackColor: coloration.inactiveColor(),
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 6.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: coloration.contrastColor(),
            overlayColor: coloration.contrastColor(),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: coloration.contrastColor(),
            inactiveTickMarkColor: coloration.contrastColor(),
            valueIndicatorShape: SliderComponentShape.noOverlay),
        child: Slider(
          value: widget.slideValue,
          min: 0,
          max: 100,
          divisions: 10,
          label: '$widget.slideValue',
          onChanged: (value) {
            setState(
              () {
                widget.slideValue = value;
              },
            );
          },
        ),
      ),
    );
  }
}
