import 'package:aureus/aureus.dart';

//A circle with an icon that is meant to act as a category label, but not as a button.
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Badges/All.md

class IconBadge extends StatelessWidget {
  final IconData badgeIcon;
  final decorationPriority badgePriority;
  final modeVariants modeVariant;

  const IconBadge(
      {required this.badgeIcon,
      required this.badgePriority,
      required this.modeVariant});

  @override
  Widget build(BuildContext context) {
    Color iconColor() {
      if (modeVariant == modeVariants.light) {
        return foundation.white();
      } else if (modeVariant == modeVariants.dark) {
        return foundation.black();
      }

      return foundation.white();
    }

    Color badgeFill() {
      if (modeVariant == modeVariants.light) {
        return foundation.carbon();
      } else if (modeVariant == modeVariants.dark) {
        return foundation.melt();
      }

      return foundation.white();
    }

    Gradient badgeGradient() {
      if (modeVariant == modeVariants.light) {
        return foundation.darkGradient();
      } else if (modeVariant == modeVariants.dark) {
        return foundation.lightGradient();
      }

      return LinearGradient(colors: []);
    }

    BoxShadow badgeShadow() {
      if (modeVariant == modeVariants.light &&
          badgePriority == decorationPriority.important) {
        return foundation.darkShadow();
      } else if (modeVariant == modeVariants.dark &&
          badgePriority == decorationPriority.important) {
        return foundation.lightShadow();
      }

      return BoxShadow();
    }

    return AspectRatio(
        aspectRatio: 1 / 1,
        child: Container(
          constraints: BoxConstraints(
              //sets minimum size of 25x25 and max size of 40% of screen width.
              minHeight: 25,
              minWidth: 25,
              maxHeight: size.widthOf(weight: sizingWeight.w4),
              maxWidth: size.widthOf(weight: sizingWeight.w4)),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: badgeFill(),
              gradient: badgeGradient(),
              boxShadow: [badgeShadow()]),
          child: Icon(badgeIcon, color: iconColor()),
        ));
  }
}
