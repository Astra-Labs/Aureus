import 'package:aureus/aureus.dart';

//A circle with an icon that is meant to act as a category label, but not as a button.

class IconBadge extends StatelessWidget {
  final IconData badgeIcon;
  final decorationPriority badgePriority;

  const IconBadge({required this.badgeIcon, required this.badgePriority});

  @override
  Widget build(BuildContext context) {
    Decoration customBadgeBacking() {
      var baseDecoration =
          BaseBackingDecoration(priority: decorationPriority.standard);
      Gradient backingGradient = LinearGradient(colors: []);
      BoxShadow backingHaze = BoxShadow();
      baseDecoration.decorationCornerRadius = BorderRadius.circular(10.0);

      switch (badgePriority) {
        case decorationPriority.standard:
          {
            baseDecoration.decorationFill = coloration.inactiveColor();
            break;
          }
        case decorationPriority.important:
          {
            if (brightness() == Brightness.dark) {
              backingGradient = lightGradient();
              backingHaze = pastelShadow();
            } else if (brightness() == Brightness.light) {
              backingGradient = darkGradient();
              backingHaze = darkShadow();
            }

            baseDecoration.decorationGradient = backingGradient;
            baseDecoration.decorationHaze = backingHaze;
            break;
          }

        case decorationPriority.inactive:
          {
            baseDecoration.decorationFill = coloration.accentColor();
            break;
          }
      }

      return baseDecoration.buildBacking();
    }

    return SizedBox(
      width: 40.0,
      height: 40.0,
      child: Container(
        alignment: Alignment.center,
        decoration: customBadgeBacking(),
        child: Icon(
          badgeIcon,
          color: badgePriority == decorationPriority.inactive
              ? coloration.contrastColor()
              : coloration.sameColor(),
          size: 35,
        ),
      ),
    );
  }
}
