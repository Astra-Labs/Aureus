import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- PASSCODE VIEW ----------*/

class PasscodeView extends StatefulWidget {
  ///
  final VoidCallback onCorrectPasscode;

  /// A List that contains the passcode. Keeping
  /// items in a list as opposed to one int solves
  /// issues with numbers between web / mobile
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
    setState(() {
      entryText = "";
    });
  }

  void addDigit(String item) {
    setState(() {
      entryText = entryText + item;
    });
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

  void resetPassword() {
    notificationMaster.sendAlertNotificationRequest(
        "Incorrect passcode.", Assets.alert);
    resetScreen();
  }

  Widget createNumberButton(int number) {
    var numberButton = Padding(
      padding: EdgeInsets.all(size.responsiveSize(17.0)),
      child: Container(
        width: size.responsiveSize(80.0),
        height: size.responsiveSize(80.0),
        decoration: ButtonBackingDecoration(
                variant: buttonDecorationVariants.circle,
                decorationVariant: decorationPriority.standard)
            .buildBacking(),
        child: Center(
          child: HeadingThreeText("$number", decorationPriority.standard),
        ),
      ),
    );

    return GestureDetector(
      onTap: () {
        setState(() {
          if (entryText.length == widget.passcode.length) {
            tryPassword();
          } else {
            var newEntry = entryText + number.toString();
            entryText = newEntry;
          }
        });
      },
      child: numberButton,
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> digitButtons = [];

    for (var element in digits) {
      digitButtons.add(createNumberButton(element));
    }

    var entryFieldBox = FloatingContainerElement(
        child: Container(
            decoration: InputBackingDecoration().buildBacking(),
            padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: HeadingFourText(entryText, decorationPriority.standard)));

    var row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SmolButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonTitle: "Clear",
            buttonHint: "Clears the password field.",
            buttonAction: resetScreen),
        const Spacer(),
        SmolButtonElement(
            decorationVariant: decorationPriority.important,
            buttonTitle: "Finish",
            buttonHint: "Finishes inputting the password.",
            buttonAction: tryPassword),
      ],
    );

    var column = Column(
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
        row,
      ],
    );

    var mobileViewLayout = ContainerWrapperElement(
      children: [
        const DividingHeaderElement(
            headerText: 'Passcode',
            subheaderText: 'Input your passcode below.'),
        const SizedBox(height: 40.0),
        entryFieldBox,
        const SizedBox(height: 40.0),
        column
      ],
      containerVariant: wrapperVariants.fullScreen,
      takesFullWidth: false,
    );

    var desktopContentBox = SizedBox(
      height: size.layoutItemHeight(1, size.logicalScreenSize()),
      width: size.layoutItemWidth(2, size.logicalScreenSize()) * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          const DividingHeaderElement(
              headerText: 'Passcode',
              subheaderText: 'Input your passcode to continue.'),
          const SizedBox(height: 40.0),
          entryFieldBox,
          const Spacer(),
        ],
      ),
    );

    var desktopPasscodeInputBox = SizedBox(
      height: size.layoutItemHeight(1, size.logicalScreenSize()),
      width: size.layoutItemWidth(2, size.logicalScreenSize()) * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          column,
          const Spacer(),
        ],
      ),
    );

    var desktopViewLayout = ContainerWrapperElement(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            desktopContentBox,
            const Spacer(),
            desktopPasscodeInputBox,
          ],
        ),
      ],
      containerVariant: wrapperVariants.fullScreen,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: size.isDesktopDisplay() == true
          ? desktopViewLayout
          : mobileViewLayout,
      takesFullWidth: false,
    );
  }
}
