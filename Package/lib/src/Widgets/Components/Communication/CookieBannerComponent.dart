import 'package:aureus/aureus.dart';

class CookieBannerComponent extends StatefulWidget {
  final String cookieMessage;
  final VoidCallback onCookieAccept;
  final VoidCallback onCookieDeny;
  const CookieBannerComponent(
      {required this.cookieMessage,
      required this.onCookieAccept,
      required this.onCookieDeny});

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
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              const IconBadge(
                  badgeIcon: Assets.alertmessage,
                  badgePriority: decorationPriority.important),
              const SizedBox(height: 10.0),
              TagTwoText('Cookie Usage', decorationPriority.important),
              const SizedBox(height: 5.0),
              BodyOneText(widget.cookieMessage, decorationPriority.important),
              const SizedBox(height: 10.0),
              StandardButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonTitle: 'Accept',
                  buttonAction: widget.onCookieAccept),
              const SizedBox(height: 5.0),
              StandardButtonElement(
                  decorationVariant: decorationPriority.important,
                  buttonTitle: 'Deny',
                  buttonAction: widget.onCookieDeny),
              const SizedBox(height: 20.0),
            ],
          ),
        ));
  }
}
