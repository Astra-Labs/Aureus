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
      if (brightness() == Brightness.light) {
        return melt();
      } else if (brightness() == Brightness.dark) {
        return onyx();
      }

      return white();
    }

    Size accessibilitySizing = Accessibility.textStringSize(
        textInput: 'Tap the button to quickly exit.',
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        constraints: BoxConstraints(
            minHeight: accessibilitySizing.height * 4,
            minWidth: size.widthOf(weight: sizingWeight.w10)),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: accessibilitySizing.height * 3,
                minWidth: size.layoutItemWidth(1, size.logicalScreenSize),
                maxWidth: size.layoutItemWidth(1, size.logicalScreenSize)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BodyOneText(
                        'Tap the button to exit.', decorationPriority.standard),
                    SmolButtonElement(
                        decorationVariant: decorationPriority.important,
                        buttonTitle: 'Exit now.',
                        buttonAction: () => {print('Exit for user!')})
                  ]),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: barBacking(),
          border: Border(
              bottom: BorderSide(color: steel().withOpacity(0.3), width: 1)),
        ));
  }
}
