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
        width: size.responsiveSize(50.0),
        height: size.responsiveSize(50.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: coloration.accentColor()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var entryFieldBox = FloatingContainerElement(
        child: Container(
            decoration: InputBackingDecoration().buildBacking(),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: HeadingFourText(entryText, decorationPriority.standard)));

    var viewLayout = const ContainerWrapperElement(
      children: [
        DividingHeaderElement(
            headerText: 'Passcode',
            subheaderText: 'Input your passcode below.'),
        SizedBox(height: 20.0),
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: true,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      takesFullWidth: true,
    );
  }
}
