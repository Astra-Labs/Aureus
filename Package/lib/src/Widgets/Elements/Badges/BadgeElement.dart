import 'package:aureus/aureus.dart';

//A circle with an icon that is meant to act as a category label, but not as a button.
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Badges/All.md

class IconBadge extends StatelessWidget {
  final IconData badgeIcon;
  final decorationPriority badgePriority;

  const IconBadge({required this.badgeIcon, required this.badgePriority});

  @override
  Widget build(BuildContext context) {
    var customBadgeBacking =
        BaseBackingDecoration(priority: decorationPriority.standard);

    Gradient backingGradient = LinearGradient(colors: []);
    BoxShadow backingHaze = BoxShadow();

    if (brightness() == Brightness.dark) {
      backingGradient = lightGradient();
      backingHaze = pastelShadow();
    } else if (brightness() == Brightness.light) {
      backingGradient = darkGradient();
      backingHaze = darkShadow();
    }

    customBadgeBacking.decorationCornerRadius = BorderRadius.circular(10.0);
    customBadgeBacking.decorationGradient = backingGradient;
    customBadgeBacking.decorationBorder = universalBorder();
    customBadgeBacking.decorationHaze = backingHaze;

    Size priorityBadge = Size(80.0, 80.0);
    Size standardBadge = Size(40.0, 40.0);

    Size badgeSizing = badgePriority == decorationPriority.important
        ? priorityBadge
        : standardBadge;

    return SizedBox(
      width: badgeSizing.width,
      height: badgeSizing.height,
      child: Container(
        decoration: customBadgeBacking
            .buildBacking()
            .copyWith(borderRadius: BorderRadius.circular(40)),
        child: Icon(
          badgeIcon,
          color: coloration.sameColor(),
          size: badgeSizing.width * 0.7,
        ),
      ),
    );
  }
}
