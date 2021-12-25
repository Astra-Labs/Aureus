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
    //because the bar breaks from current backing build conventions due to safety reasons, we have a custom variable that simply returns a color instead of .buildBacking();
    Color barBacking() {
      if (foundation.brightness == Brightness.light) {
        return foundation.ice();
      } else if (foundation.brightness == Brightness.dark) {
        return foundation.onyx();
      }

      return foundation.white();
    }

    Size accessibilitySizing = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w5),
        textInput: 'Tap the button to quickly exit.',
        textStyle: foundation.body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: accessibilitySizing.height * 4,
        child: Padding(
          padding: size.universalPadding(),
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: BodyOneText('Tap the button to quickly exit.',
                      decorationPriority.standard),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SmolButtonElement(
                      decorationVariant: decorationPriority.important,
                      buttonTitle: 'Exit now.',
                      buttonAction: () => {print('Exit for user!')}),
                )
              ]),
        ),
        decoration: BoxDecoration(
          color: barBacking(),
          border: Border(
              bottom: BorderSide(
                  color: foundation.steel().withOpacity(0.6), width: 1)),
        ));
  }
}
