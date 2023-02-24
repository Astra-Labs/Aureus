import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- CHECKBOX ARTICLE VIEW ----------*/
/// This is a view that displays an article, and a checkbox.
/// When the user agrees to the checkbox and moves forward, it calls
/// the param onFinish.

/// This should be used for legal documents that MUST be agreed to in order
/// to use the software. e.g: terms of service, cookie policy, etc.

class CheckboxArticleView extends StatefulWidget {
  /// The title of your article. E.G: Terms of Service, Privacy Policy.
  final String articleTitle;

  /// A subheader that gives a description of the article.
  final String articleSubheader;

  /// The entire content of the article body.
  final String articleBody;

  /// A label for the checkbox that a user must enable to move forward.
  final String checkboxDescription;

  /// An action that should happen when the user agrees and presses 'Finish'
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
  var screenSize = size.logicalScreenSize();

  @override
  Widget build(BuildContext context) {
    var switchComponent = SwitchComponent(() {
      setState(() {
        isEnabled == true;
      });
    }, () {
      setState(() {
        isEnabled == false;
      });
    });

    var floatingContainerElement = FloatingContainerElement(
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints:
            BoxConstraints(maxWidth: size.layoutItemWidth(1, screenSize)),
        decoration: CardBackingDecoration(
                decorationVariant: decorationPriority.inactive)
            .buildBacking(),
        child: Row(
          children: [
            BodyOneText(
                widget.checkboxDescription, decorationPriority.standard),
            const Spacer(),
            switchComponent
          ],
        ),
      ),
    );

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        ArticleViewElement(
            title: widget.articleTitle,
            subheader: widget.articleSubheader,
            body: widget.articleBody),
        floatingContainerElement,
        const SizedBox(height: 20),
        StandardIconButtonElement(
            decorationVariant: isEnabled == true
                ? decorationPriority.important
                : decorationPriority.inactive,
            buttonTitle: "Continue",
            buttonIcon: Assets.next,
            buttonHint: "Confirms you agree, and then continues forward.",
            buttonAction: () {
              widget.onFinish();
            }),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
