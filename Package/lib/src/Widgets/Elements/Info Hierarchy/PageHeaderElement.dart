import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PAGE HEADER ELEMENT ----------*/
/// A page header with a title, exit button, and optional details button
/// to allow users to take extra actions on a page.

// ignore: must_be_immutable
class PageHeaderElement extends StatelessWidget {
  /// The title of the page
  final String pageTitle;

  /// An action to run when the user wants to exit the page.
  /// This is typically where you would set Navigator.pop() to
  /// go back to the previous screen, or add code to save any data that's
  /// been modified on the page.
  final VoidCallback onPageExit;

  /// If you want a details button to show up, this is where
  /// you write the action that should happen on 'more details'.
  /// This would be potentially showing an action sheet, or a
  /// pop up that shows information.
  VoidCallback? onPageDetails;

  PageHeaderElement.withExit(
      {Key? key, required this.pageTitle, required this.onPageExit})
      : super(key: key);
  PageHeaderElement.withOptionsExit(
      {Key? key,
      required this.pageTitle,
      required this.onPageDetails,
      required this.onPageExit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buttonOptions() {
      var exitButton = IconButtonElement(
        decorationVariant: decorationPriority.standard,
        buttonIcon: Assets.no,
        buttonHint: 'Exit $pageTitle',
        buttonAction: onPageExit,
        buttonPriority: buttonSize.secondary,
      );

      if (onPageDetails != null) {
        //has been initialized with details & exit button.
        return Row(
          children: [
            IconButtonElement(
              decorationVariant: decorationPriority.standard,
              buttonIcon: Assets.more1,
              buttonHint: 'Shows options for $pageTitle',
              buttonAction: onPageDetails!,
              buttonPriority: buttonSize.secondary,
            ),
            const SizedBox(width: 15.0),
            exitButton
          ],
        );
      } else if (onPageDetails == null) {
        //has only been initialized with exit button.

        return exitButton;
      }

      throw ('An error has occured with button options.');
    }

    var labelSizing = Accessibility.textStringSize(
        textInput: pageTitle,
        textStyle: heading2(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));
    var screenSize = MediaQuery.of(context).size;

    var pageHeaderContent = Column(
      children: [
        const SizedBox(height: 10.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Flexible(
                child: HeadingTwoText(pageTitle, decorationPriority.standard)),
            buttonOptions()
          ],
        ),
        const SizedBox(height: 12.0),
      ],
    );

    var pageHeaderContainer = Container(
      constraints: BoxConstraints(
          minWidth: size.layoutItemWidth(1, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize),
          minHeight: labelSizing.height * 2),
      child: pageHeaderContent,
    );

    return pageHeaderContainer;
  }
}
