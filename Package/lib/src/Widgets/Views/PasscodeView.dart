import 'package:aureus/aureus.dart';

class PasscodeView extends StatefulWidget {
  final VoidCallback onCorrectPasscode;
  final List<int> passcode;

  const PasscodeView({required this.onCorrectPasscode, required this.passcode});

  @override
  _PasscodeViewState createState() => _PasscodeViewState();
}

class _PasscodeViewState extends State<PasscodeView> {
  var entryText = '';
  var digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  @override
  void initState() {
    sensation.prepare();
    super.initState();
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  void resetScreen() {
    entryText = "";
  }

  void addDigit(String item) {
    entryText = entryText + item;
  }

  void tryPassword() {
    var correct = widget.passcode.toString();
    var given = entryText.toString();

    if (correct == given) {
      widget.onCorrectPasscode();
    } else {
      resetPassword();
    }
  }

  void resetPassword() {}

  Widget createNumberButton(int number) {
    return GestureDetector(
      onTap: () {
        setState(() {
          print("a tap has occured");
          if (entryText.length == widget.passcode.length) {
            tryPassword();
          } else {
            var newEntry = entryText + number.toString();
            entryText = newEntry;
          }
        });
      },
      child: Padding(
        padding: EdgeInsets.all(size.responsiveSize(17.0)),
        child: Container(
          width: size.responsiveSize(80.0),
          height: size.responsiveSize(80.0),
          decoration: ButtonBackingDecoration(
                  variant: buttonDecorationVariants.circle,
                  priority: decorationPriority.standard)
              .buildBacking(),
          child: Center(
            child: HeadingThreeText("$number", decorationPriority.standard),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    List<Widget> digitButtons = [];

    digits.forEach((element) {
      digitButtons.add(createNumberButton(element));
    });

    var entryFieldBox = FloatingContainerElement(
        child: Container(
            decoration: InputBackingDecoration().buildBacking(),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: HeadingFourText(entryText, decorationPriority.standard)));

    var viewLayout = ContainerWrapperElement(
      children: [
        const DividingHeaderElement(
            headerText: 'Passcode',
            subheaderText: 'Input your passcode below.'),
        const SizedBox(height: 40.0),
        entryFieldBox,
        const SizedBox(height: 40.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                createNumberButton(1),
                createNumberButton(2),
                createNumberButton(3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                createNumberButton(4),
                createNumberButton(5),
                createNumberButton(6),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                createNumberButton(7),
                createNumberButton(8),
                createNumberButton(9),
              ],
            ),
            Center(child: createNumberButton(0)),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SmolButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: "Clear",
                    buttonHint: "buttonHint",
                    buttonAction: () => {}),
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: "Finish",
                    buttonHint: "buttonHint",
                    buttonAction: () => {}),
              ],
            ),
          ],
        )
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: false,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      takesFullWidth: false,
    );
  }
}
