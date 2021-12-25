import 'package:aureus/aureus.dart';

//A circle with an icon that is meant to act as a category label, but not as a button.
//Doc Link: https://github.com/Astra-Labs/Aureus/blob/main/Documentation/Aureus-Docs/4%20-%20Elements%20(Materials)/Badges/All.md

class IconBadge extends StatelessWidget {
  final IconData badgeIcon;
  final decorationPriority badgePriority;

  const IconBadge({required this.badgeIcon, required this.badgePriority});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60,
        height: 60,
        child: Container(
          decoration: LayerBackingDecoration(priority: badgePriority)
              .buildBacking()
              .copyWith(borderRadius: BorderRadius.circular(40)),
          child: Icon(badgeIcon,
              color:
                  coloration.decorationColor(decorationVariant: badgePriority),
              size: 35.0),
        ));
  }
}
