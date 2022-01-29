import 'package:aureus/aureus.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const StandardButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _StandardButtonElementState createState() => _StandardButtonElementState();
}

class _StandardButtonElementState extends State<StandardButtonElement>
    with AureusResourceObserver {
  final master = AureusResourceMaster();

  @override
  void initState() {
    master.registerObserver(_StandardButtonElementState());
    super.initState();
  }

  @override
  void dispose() {
    master.unregisterObserver(_StandardButtonElementState());
    super.dispose();
  }

  @override
  void updateEnvironment() {
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedRectangle,
            priority: widget.decorationVariant)
        .buildBacking();

    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: button2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

    return InkWell(
        onTap: () {
          print('button tapped!');
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: FloatingContainerElement(
          child: SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: minimumButtonTextSize.height * 4,
              child: Container(
                  decoration: buttonDecoration,
                  child: Center(
                      child: ButtonTwoText(
                          widget.buttonTitle, widget.decorationVariant)))),
        ));
  }
}
