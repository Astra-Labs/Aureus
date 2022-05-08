import 'package:aureus/aureus.dart';

// This is a view that displays an article, and a checkbox.
// When the user agrees to the checkbox and moves forward, it calls
// the param onFinish.
// --------------------------------
// This should be used for legal documents that MUST be agreed to in order
// to use the software. e.g: terms of service, cookie policy, etc.
class CheckboxArticleView extends StatefulWidget {
  final String articleTitle;
  final String articleSubheader;
  final String articleBody;
  final String checkboxDescription;
  final VoidCallback onFinish;

  const CheckboxArticleView(
      {required this.articleTitle,
      required this.articleSubheader,
      required this.articleBody,
      required this.checkboxDescription,
      required this.onFinish});

  @override
  _CheckboxArticleViewState createState() => _CheckboxArticleViewState();
}

class _CheckboxArticleViewState extends State<CheckboxArticleView> {
  var isEnabled = false;

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        ArticleViewElement(
            title: widget.articleTitle,
            subheader: widget.articleSubheader,
            body: widget.articleBody),
        const Spacer(),
        const DividerElement(),
        Row(
          children: [
            BodyOneText(
                widget.checkboxDescription, decorationPriority.standard),
            SwitchComponent(() {
              isEnabled == true;
            }, () {
              isEnabled == false;
            })
          ],
        ),
        const SizedBox(height: 10),
        StandardIconButtonElement(
            decorationVariant: isEnabled == true
                ? decorationPriority.standard
                : decorationPriority.inactive,
            buttonTitle: "Continue",
            buttonIcon: Assets.next,
            buttonHint: "Confirms you agree, and then continues forward.",
            buttonAction: () {
              widget.onFinish();
            }),
        const Spacer(),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.important, builder: viewLayout);
  }
}
