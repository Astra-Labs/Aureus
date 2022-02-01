import 'package:aureus/aureus.dart';

//A backing that acts as a timer.
//Doc Link:

// ignore: must_be_immutable
class PageHeaderElement extends StatelessWidget {
  final String pageTitle;
  final VoidCallback onPageExit;
  VoidCallback? onPageDetails;

  PageHeaderElement.withExit(
      {required this.pageTitle, required this.onPageExit});
  PageHeaderElement.withOptionsExit(
      {required this.pageTitle,
      required this.onPageDetails,
      required this.onPageExit});

  Widget build(BuildContext context) {
    Widget buttonOptions() {
      var exitButton = SecondaryIconButtonElement(
          decorationVariant: decorationPriority.standard,
          buttonIcon: Assets.no,
          buttonTooltip: 'Exit $pageTitle',
          buttonAction: onPageExit);

      if (onPageDetails != null) {
        //has been initialized with details & exit button.
        return Row(
          children: [
            SecondaryIconButtonElement(
                decorationVariant: decorationPriority.standard,
                buttonIcon: Assets.more1,
                buttonTooltip: '$pageTitle Options',
                buttonAction: onPageDetails!),
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

    return Container(
      constraints: BoxConstraints(
          minWidth: size.layoutItemWidth(1, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize),
          minHeight: labelSizing.height * 2),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              HeadingTwoText(pageTitle, decorationPriority.standard),
              Spacer(),
              buttonOptions()
            ],
          ),
          SizedBox(height: 12.0),
          DividerElement()
        ],
      ),
    );
  }
}
