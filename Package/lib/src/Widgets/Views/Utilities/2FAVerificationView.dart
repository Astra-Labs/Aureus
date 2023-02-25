import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- 2FA VERIFICATION VIEW ----------*/
/// A view for a user to fill out their 2FA code.

class TFAVerificationView extends StatefulWidget {
  /// A list with the user's phone number. We use this list to show the users
  /// the last 4 digits of their number.
  final List<int> userPhoneNumber;

  /// The [TextEditingController] that should be connected to the verification code
  /// text field. You'll use this text editing controller to read the code in the other
  /// actions below.
  final TextEditingController textEditingController;

  /// A [VoidCallback] to run when the user presses the submit button. This is where
  /// you'll check the verification code, and perform success / error handling.
  final VoidCallback onUserSubmission;

  /// A [VoidCallback] to run when the user requests another verification code.
  final VoidCallback issueVerificationCode;

  const TFAVerificationView(
      {required this.userPhoneNumber,
      required this.issueVerificationCode,
      required this.onUserSubmission,
      required this.textEditingController});

  @override
  _TFAVerificationViewState createState() => _TFAVerificationViewState();
}

class _TFAVerificationViewState extends State<TFAVerificationView> {
  String userSubmittedCode = '';

  @override
  Widget build(BuildContext context) {
    String hiddenUserPhoneNumber() {
      String numberToString = widget.userPhoneNumber.toString();

      return 'Please enter the code we sent to your phone number ending in ${numberToString.substring(numberToString.length - 4)}';
    }

    var singleDataTypeUserInputElement = StandardTextFieldComponent(
      hintText: 'Type code here.',
      textFieldController: widget.textEditingController,
      decorationVariant: decorationPriority.standard,
      isEnabled: true,
    );

    var align = Align(
      alignment: Alignment.bottomRight,
      child: IconButtonElement(
        decorationVariant: decorationPriority.important,
        buttonIcon: Assets.next,
        buttonHint: 'Finish submitting verification code',
        buttonAction: () => {
          userSubmittedCode =
              singleDataTypeUserInputElement.textFieldController.text,
          widget.onUserSubmission
        },
        buttonPriority: buttonSize.primary,
      ),
    );

    var row = Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          BodyOneText("Didn't receieve a code?", decorationPriority.standard),
          SmolButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonTitle: 'Resend code',
              buttonHint: 'Sends a new verification code to your number.',
              buttonAction: () => {})
        ]);

    var containerWrapper = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Two Factor Authentication',
            subheaderText: hiddenUserPhoneNumber()),
        const Spacer(),
        singleDataTypeUserInputElement,
        const SizedBox(
          height: 20,
        ),
        row,
        const Spacer(),
        align
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: containerWrapper);
  }
}
