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

  void updateEntryField(String item) {}
  void tryPassword() {}
  void resetPassword() {}

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
        DividingHeaderElement(headerText: 'Passcode', subheaderText: ''),
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
