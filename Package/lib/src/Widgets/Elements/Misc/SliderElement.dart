import 'package:aureus/aureus.dart';

//A blank card that looks like a "pane" of glass
//Doc Link:

class SliderElement extends StatefulWidget {
  @override
  _SliderElementState createState() => _SliderElementState();
}

class _SliderElementState extends State<SliderElement> {
  var slideValue = 0.0;

  //MARK: - Overrides
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: coloration.contrastColor(),
          inactiveTrackColor: coloration.inactiveColor(),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 3.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: foundation.prodColor,
          overlayColor: foundation.prodColor,
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: coloration.contrastColor(),
          inactiveTickMarkColor: coloration.contrastColor(),
          valueIndicatorShape: SliderComponentShape.noOverlay),
      child: Slider(
        value: slideValue,
        min: 0,
        max: 100,
        divisions: 10,
        label: '$slideValue',
        onChanged: (value) {
          setState(
            () {
              slideValue = value;
            },
          );
        },
      ),
    );
  }
}
