import 'package:aureus/aureus.dart';

//
//Doc Link:

class TFAVerificationView extends StatefulWidget {
  final double userPhoneNumber;
  final VoidCallback onUserSubmission;
  final VoidCallback issueVerificationCode;

  const TFAVerificationView(
      {required this.userPhoneNumber,
      required this.issueVerificationCode,
      required this.onUserSubmission});

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

    var singleDataTypeUserInputElement =
        SingleDataTypeUserInputElement(dataPlaceholder: 'Type code here.');

    var containerWrapper = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Two Factor Authentication',
            subheaderText: hiddenUserPhoneNumber()),
        Spacer(),
        singleDataTypeUserInputElement,
        SizedBox(
          height: 20,
        ),
        Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              BodyOneText(
                  "Didn't receieve a code?", decorationPriority.standard),
              SmolButtonElement(
                  decorationVariant: decorationPriority.standard,
                  buttonTitle: 'Resend code',
                  buttonAction: () => {})
            ]),
        Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Assets.next,
              buttonTooltip: 'Finish submitting verification code',
              buttonAction: () => {
                    userSubmittedCode = singleDataTypeUserInputElement
                        .itemTextEditingController.text,
                    widget.onUserSubmission
                  }),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: containerWrapper);
  }
}
