import 'package:aureus/aureus.dart';

/*--------- ICON BADGE ----------*/
// A circle with an icon that is meant to act as a category
// label, but not as a button.

class IconBadge extends StatelessWidget {
  final IconData badgeIcon;
  final decorationPriority badgePriority;

  const IconBadge({required this.badgeIcon, required this.badgePriority});

  @override
  Widget build(BuildContext context) {
    var responsiveBadgeSize = size.responsiveSize(50.0);
    var responsiveIconSize = size.responsiveSize(35.0);

    Decoration customBadgeBacking() {
      var baseDecoration =
          BaseBackingDecoration(priority: decorationPriority.standard);
      Gradient backingGradient = const LinearGradient(colors: []);
      BoxShadow backingHaze = const BoxShadow();
      baseDecoration.decorationCornerRadius = BorderRadius.circular(60.0);

      switch (badgePriority) {
        case decorationPriority.inactive:
          {
            /*

            Since the badges are supposed to be used on top of 
            important elements, inactive elements will show
            as the fill of the opposite mode's fill color to 
            preserve contrast (since layering the mode's fill)
            on an important priority item will lead to the 
            background looking invisible. 
            
             */

            baseDecoration.decorationFill =
                palette.brightness() == Brightness.light
                    ? palette.lightModeFill()
                    : palette.darkModeFill();

            break;
          }
        case decorationPriority.important:
          {
            backingGradient = palette.brightness() == Brightness.light
                ? palette.lightGradient()
                : palette.darkGradient();

            backingHaze = palette.brightness() == Brightness.light
                ? palette.pastelShadow()
                : palette.darkShadow();

            baseDecoration.decorationGradient = backingGradient;
            baseDecoration.decorationHaze = backingHaze;
            break;
          }

        case decorationPriority.standard:
          {
            baseDecoration.decorationFill = coloration.inactiveColor();
            break;
          }

        case decorationPriority.inverted:
          {
            backingGradient = palette.brightness() == Brightness.light
                ? palette.lightGradient()
                : palette.darkGradient();

            backingHaze = palette.brightness() == Brightness.light
                ? palette.pastelShadow()
                : palette.darkShadow();

            baseDecoration.decorationGradient = backingGradient;
            baseDecoration.decorationHaze = backingHaze;
            break;
          }

        case decorationPriority.active:
          {
            throw ("BadgeElement cannot be decorationPriority.active, that priority is meant for interactable elements being highlighted and BadgeElement is non-interactable.");
          }
      }

      return baseDecoration.buildBacking();
    }

    return Semantics.fromProperties(
      properties: SemanticsWrapper.ignorable(),
      child: SizedBox(
        width: responsiveBadgeSize,
        height: responsiveBadgeSize,
        child: Container(
          alignment: Alignment.center,
          decoration: customBadgeBacking(),
          child: Icon(
            badgeIcon,
            color: badgePriority == decorationPriority.standard ||
                    badgePriority == decorationPriority.inverted
                ? coloration.contrastColor()
                : coloration.sameColor(),
            size: responsiveIconSize,
          ),
        ),
      ),
    );
  }
}
