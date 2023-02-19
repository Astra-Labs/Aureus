import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- PAGE HEADER ELEMENT ----------*/

// ignore: must_be_immutable
class PageHeaderElement extends StatelessWidget {
  ///
  final String pageTitle;

  ///
  final VoidCallback onPageExit;

  ///
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
    var screenSize = size.logicalScreenSize();

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
