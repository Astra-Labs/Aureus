import 'package:aureus/aureus.dart';

/*--------- CONTENT WARNING COMPONENT ----------*/
// Shows a content warning with a blur over the content behind the item.

class ContentWarningComponent extends StatelessWidget {
  final String warningDescription;
  // The description about the content (e.g: why a warning is being shown)
  // ------------------------------
  final VoidCallback onContinue;
  // A function that determines what to do if the user wants to
  // continue and see the content.
  // ------------------------------

  const ContentWarningComponent(
      {required this.warningDescription, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    var warningLayout = Container(
        constraints: BoxConstraints(
            minHeight: size.layoutItemHeight(2, screenSize),
            maxHeight: size.layoutItemHeight(2, screenSize),
            minWidth: size.layoutItemWidth(1, screenSize),
            maxWidth: size.layoutItemWidth(1, screenSize)),
        decoration: CardBackingDecoration(priority: decorationPriority.inverted)
            .buildBacking(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 10.0),
                const Spacer(),
                const IconBadge(
                    badgeIcon: Assets.alertmessage,
                    badgePriority: decorationPriority.important),
                const SizedBox(height: 10.0),
                const Spacer(),
                HeadingThreeText(
                    "Content Warning", decorationPriority.standard),
                const SizedBox(height: 10.0),
                const Spacer(),
                BodyOneText(warningDescription, decorationPriority.standard),
                const SizedBox(height: 20.0),
                const Spacer(),
                const DividerElement(),
                const SizedBox(height: 20.0),
                const Spacer(),
                StandardIconButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Continue',
                    buttonHint: "Clears the content warning, and continues.",
                    buttonIcon: Assets.next,
                    buttonAction: () => {onContinue()}),
                const SizedBox(height: 15.0),
                const Spacer(),
                StandardIconButtonElement(
                    decorationVariant: decorationPriority.standard,
                    buttonTitle: 'Go back',
                    buttonHint: "Takes you to the previous screen.",
                    buttonIcon: Assets.no,
                    buttonAction: () => {
                          Navigator.pop(context),
                          notificationMaster.resetRequests()
                        }),
                const Spacer(),
              ]),
        ));

    return warningLayout;
  }
}
