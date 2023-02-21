import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- 2FA VERIFICATION VIEW ----------*/

class TFAVerificationView extends StatefulWidget {
  ///
  final List<int> userPhoneNumber;

  ///
  final TextEditingController textEditingController;

  ///
  final VoidCallback onUserSubmission;

  ///
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
