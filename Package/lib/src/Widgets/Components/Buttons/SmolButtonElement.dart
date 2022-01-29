import 'package:aureus/aureus.dart';

//A small, rounded tab button
//Doc Link:

class SmolButtonElement extends StatefulWidget {
  final decorationPriority decorationVariant;
  final String buttonTitle;
  final VoidCallback buttonAction;

  const SmolButtonElement(
      {required this.decorationVariant,
      required this.buttonTitle,
      required this.buttonAction});

  @override
  _SmolButtonElementState createState() => _SmolButtonElementState();
}

class _SmolButtonElementState extends State<SmolButtonElement>
    with AureusResourceObserver {
  final master = AureusResourceMaster();

  @override
  void initState() {
    master.registerObserver(_SmolButtonElementState());
    super.initState();
  }

  @override
  void dispose() {
    master.unregisterObserver(_SmolButtonElementState());
    super.dispose();
  }

  @override
  void updateEnvironment() {
    build(context);
  }

  @override
  Widget build(BuildContext context) {
    bool isButtonEnabled =
        widget.decorationVariant == decorationPriority.inactive ? false : true;

    BoxDecoration buttonDecoration = ButtonBackingDecoration(
            variant: buttonDecorationVariants.roundedPill,
            priority: widget.decorationVariant)
        .buildBacking();

    Size minimumButtonTextSize = Accessibility.textStringSize(
        textInput: widget.buttonTitle,
        textStyle: tag1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return InkWell(
        onTap: () {
          if (isButtonEnabled == true) {
            widget.buttonAction();
          }
        },
        child: FloatingContainerElement(
          child: Container(
              constraints: BoxConstraints(
                  minHeight: minimumButtonTextSize.height * 1.8,
                  maxHeight: minimumButtonTextSize.height * 2,
                  maxWidth: minimumButtonTextSize.width * 1.6,
                  minWidth: minimumButtonTextSize.width * 1.4),
              decoration: buttonDecoration,
              child: Center(
                  child: TagOneText(
                      widget.buttonTitle, widget.decorationVariant))),
        ));
  }
}
