import 'package:flutter/material.dart';
import 'package:aureus/foundation.dart';

//A blank card that looks like a "pane" of glass
//Doc Link:

class SliderElement extends StatefulWidget {
  final variables = UDSVariables();

  @override
  _SliderElementState createState() => _SliderElementState();
}

class _SliderElementState extends State<SliderElement> {
  //MARK: - Variables
  var variables = UDSVariables();
  var slideValue = 0.0;

  //MARK: - Overrides
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: variables.prodColor,
          inactiveTrackColor: variables.melt(),
          trackShape: RoundedRectSliderTrackShape(),
          trackHeight: 3.0,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: variables.iron(),
          overlayColor: variables.melt(),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
          tickMarkShape: RoundSliderTickMarkShape(),
          activeTickMarkColor: variables.melt(),
          inactiveTickMarkColor: variables.melt(),
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
