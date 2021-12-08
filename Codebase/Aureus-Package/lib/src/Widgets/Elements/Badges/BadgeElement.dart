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

      
    }

    Color badgeFill() {

      return 
    }
    Gradient badgeGradient() {
      return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.purple, Colors.blue]);
    }

    BoxShadow badgeShadow() {
      return foundation.darkShadow();
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
              color: badgeFill,
              gradient: badgeGradient),
          child: Icon(badgeIcon, color: iconColor),
        ));
  }
}
