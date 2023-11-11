import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- CHANGE ACCOUNT ITEM VIEW ----------*/
/// A view for a user to change some item related to their account. The view
/// handles making sure the items match.

class ChangeAccountItemView extends StatefulWidget {
  /// The 'title' of what the user needs to change. E.G: Password, username.
  final String itemTitle;

  /// What to do when items match and you can 'finish'.
  final VoidCallback onFinish;

  /// A [TextEditingController] that will hold the 'value' of what
  /// the user changed something to.
  final TextEditingController textController;

  /// An input formatter for you to assert any specific regexs or patterns
  /// that the user needs to adhere to.
  final services.TextInputFormatter? inputFormatter;

  /// Whether the items should be 'secure text'. This is mostly used for passwords
  /// and such.
  final bool? isSecureTextEntry;

  const ChangeAccountItemView({
    required this.onFinish,
    required this.itemTitle,
    required this.textController,
    this.inputFormatter,
    this.isSecureTextEntry,
  });

  @override
  _ChangeAccountItemViewState createState() => _ChangeAccountItemViewState();
}

class _ChangeAccountItemViewState extends State<ChangeAccountItemView> {
  var secondItemTextController = TextEditingController();

  void resetTextFields() {
    widget.textController.text = "";
    secondItemTextController.text = "";

    notificationMaster.sendAlertNotificationRequest(
      widget.itemTitle + " doesn't match.",
      Assets.alertmessage,
    );
  }

  bool checkForMatch() {
    return widget.textController.text == secondItemTextController.text;
  }

  void testItems() {
    if (checkForMatch() == true) {
      widget.onFinish();
    } else {
      resetTextFields();
    }
  }

  @override
  Widget build(BuildContext context) {
    var headerText = Row(
      children: [
        HeadingOneText(
            data: "Change " + widget.itemTitle,
            textColor: decorationPriority.standard),
        const Spacer(),
        IconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.no,
            buttonHint: "Takes you to the previous page.",
            buttonAction: () => {
                  Navigator.pop(context),
                },
            buttonPriority: buttonSize.secondary)
      ],
    );

    var firstDraftText = StandardTextFieldComponent(
        hintText: 'Insert ' + widget.itemTitle,
        isEnabled: true,
        decorationVariant: decorationPriority.standard,
        textFieldController: widget.textController);

    var secondDraftText = StandardTextFieldComponent(
        hintText: 'Insert ' + widget.itemTitle,
        isEnabled: true,
        decorationVariant: decorationPriority.standard,
        textFieldController: secondItemTextController);

    var ctaButton = IconButtonElement(
        decorationVariant: decorationPriority.important,
        buttonIcon: Assets.next,
        buttonHint: 'Tests the items to see if they match.',
        buttonAction: testItems,
        buttonPriority: buttonSize.primary);

    var viewWrapper = ContainerWrapperElement(
      children: [
        headerText,
        const Spacer(),
        firstDraftText,
        const SizedBox(height: 20),
        secondDraftText,
        const Spacer(),
        Align(alignment: Alignment.bottomRight, child: ctaButton),
      ],
      containerVariant: wrapperVariants.fullScreen,
    );

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: viewWrapper,
    );
  }
}
