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
        return carbon();
      }

      return white();
    }

    Size accessibilitySizing = Accessibility.textStringSize(
        widthLimit: size.widthOf(weight: sizingWeight.w5),
        textInput: 'Tap the button to quickly exit.',
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.layoutItemHeight(6, size.logicalScreenSize),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Align(
            alignment: Alignment.bottomCenter,
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
        decoration: BoxDecoration(
          color: barBacking(),
          border: Border(
              bottom: BorderSide(color: steel().withOpacity(0.3), width: 1)),
        ));
  }
}
