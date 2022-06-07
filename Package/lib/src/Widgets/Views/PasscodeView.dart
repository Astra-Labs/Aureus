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
        if (entryText.length == widget.passcode.length) {
          tryPassword();
        } else {
          entryText = entryText + number.toString();
        }
      },
      child: Container(
        width: size.responsiveSize(80.0),
        height: size.responsiveSize(80.0),
        decoration: ButtonBackingDecoration(
                variant: buttonDecorationVariants.circle,
                priority: decorationPriority.standard)
            .buildBacking(),
        child: Center(
          child: BodyOneText("$number", decorationPriority.standard),
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
        const SizedBox(height: 20.0),
        Wrap(
          runSpacing: 10,
          spacing: 10,
          children: digitButtons,
        ),
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
