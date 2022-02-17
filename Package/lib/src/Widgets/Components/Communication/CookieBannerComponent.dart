import 'package:aureus/aureus.dart';
//An exit bar that stays at the top of the user's screen and exits the screen when pressed.

class CookieBannerComponent extends StatefulWidget {
  const CookieBannerComponent();

  @override
  _CookieBannerComponentState createState() => _CookieBannerComponentState();
}

class _CookieBannerComponentState extends State<CookieBannerComponent> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
        constraints: BoxConstraints(
            minWidth: size.layoutItemWidth(3, screenSize),
            maxWidth: size.layoutItemWidth(2, screenSize),
            minHeight: size.layoutItemHeight(4, screenSize),
            maxHeight: size.layoutItemHeight(3, screenSize)),
        decoration:
            CardBackingDecoration(priority: decorationPriority.important)
                .buildBacking(),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            IconBadge(
                badgeIcon: Assets.alertmessage,
                badgePriority: decorationPriority.important),
            TagTwoText('data', decorationPriority.important),
            BodyOneText('data', decorationPriority.important),
            Spacer(),
            StandardButtonElement(
                decorationVariant: decorationPriority.important,
                buttonTitle: 'buttonTitle',
                buttonAction: () => {}),
            StandardButtonElement(
                decorationVariant: decorationPriority.important,
                buttonTitle: 'buttonTitle',
                buttonAction: () => {}),
            SizedBox(height: 20.0),
          ],
        ));
  }
}
