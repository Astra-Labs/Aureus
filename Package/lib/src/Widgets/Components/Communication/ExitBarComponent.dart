import 'package:aureus/aureus.dart';

//An exit bar that stays at the top of the user's screen and exits the screen when pressed.

class ExitBarComponent extends StatefulWidget {
  final modeVariants modeVariant;

  const ExitBarComponent({required this.modeVariant});

  @override
  _ExitBarComponentState createState() => _ExitBarComponentState();
}

class _ExitBarComponentState extends State<ExitBarComponent> {
  @override
  Widget build(BuildContext context) {
    LayerBackingDecoration barBacking = LayerBackingDecoration(
        variant: layerDecorationVariants.edged,
        mode: modeVariants.dark,
        priority: decorationPriority.important);

    buttonVariants buttonVariant = buttonVariants.inactive;

    if (widget.modeVariant == modeVariants.dark) {
      buttonVariant = buttonVariants.darkActive;
    } else if (widget.modeVariant == modeVariants.light) {
      buttonVariant = buttonVariants.lightActive;
    }

    return Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w1),
        alignment: Alignment.center,
        child: Padding(
            padding: size.universalPadding(),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              BodyTwoText(
                  'Tap the button to quickly exit.', widget.modeVariant),
              SmolButtonElement(
                  currentVariant: buttonVariant,
                  buttonTitle: 'Exit',
                  buttonAction: () => {print('pressed exit')})
            ])),
        decoration: barBacking.buildBacking());
  }
}
