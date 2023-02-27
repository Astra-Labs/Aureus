import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- SLIDER ELEMENT ----------*/
/// A simple slider to represent a scale of values.

// ignore: must_be_immutable
class SliderElement extends StatefulWidget {
  /// The slide value from 1-100 (aka how far the slide is).
  var slideValue = 0.0;

  @override
  _SliderElementState createState() => _SliderElementState();
}

class _SliderElementState extends State<SliderElement> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var slider = Slider(
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
    );

    var sliderTheme = SliderTheme(
      data: SliderTheme.of(context).copyWith(
          activeTrackColor: coloration.contrastColor(),
          inactiveTrackColor: coloration.inactiveColor(),
          trackShape: const RoundedRectSliderTrackShape(),
          trackHeight: 6.0,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
          thumbColor: coloration.contrastColor(),
          overlayColor: coloration.contrastColor(),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
          tickMarkShape: const RoundSliderTickMarkShape(),
          activeTickMarkColor: coloration.contrastColor(),
          inactiveTickMarkColor: coloration.contrastColor(),
          valueIndicatorShape: SliderComponentShape.noOverlay),
      child: slider,
    );

    var constrainedBox = ConstrainedBox(
      constraints:
          BoxConstraints(maxWidth: size.layoutItemWidth(1, screenSize)),
      child: sliderTheme,
    );

    return constrainedBox;
  }
}
