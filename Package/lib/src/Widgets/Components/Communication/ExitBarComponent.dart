import 'package:aureus/aureus.dart';

//An exit bar that stays at the top of the user's screen and exits the screen when pressed.

class ExitBarComponent extends StatefulWidget {
  const ExitBarComponent();

  @override
  _ExitBarComponentState createState() => _ExitBarComponentState();
}

class _ExitBarComponentState extends State<ExitBarComponent> {
  @override
  Widget build(BuildContext context) {
    LayerBackingDecoration barBacking =
        LayerBackingDecoration(priority: decorationPriority.important);

    decorationPriority buttonVariant = decorationPriority.inactive;

    if (foundation.brightness == Brightness.dark) {
      buttonVariant = decorationPriority.inactive;
    } else if (foundation.brightness == Brightness.light) {
      buttonVariant = decorationPriority.standard;
    }

    return Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w1),
        alignment: Alignment.center,
        child: Padding(
            padding: size.universalPadding(),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              BodyTwoText('Tap the button to quickly exit.'),
              SmolButtonElement(
                  decorationVariant: buttonVariant,
                  buttonTitle: 'Exit',
                  buttonAction: () => {print('pressed exit')})
            ])),
        decoration: barBacking.buildBacking());
  }
}
