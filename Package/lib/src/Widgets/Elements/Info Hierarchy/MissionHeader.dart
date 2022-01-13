import 'package:aureus/aureus.dart';

//A backing that acts as a timer.
//Doc Link:

class MissionHeader extends StatelessWidget {
  Widget build(BuildContext context) {
    Image resourceLogo() {
      if (brightness() == Brightness.light) {
        return apiVariables.darkLogo!;
      } else if (brightness() == Brightness.dark) {
        return apiVariables.lightLogo!;
      }

      throw ('Brightness is having issues');
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        HeadingOneText('How can I help?', decorationPriority.standard),
        AspectRatio(
            aspectRatio: 1 / 1,
            child: Container(
                constraints: BoxConstraints(
                    minHeight: size.heightOf(weight: sizingWeight.w0),
                    maxHeight: size.heightOf(weight: sizingWeight.w2),
                    minWidth: size.widthOf(weight: sizingWeight.w0),
                    maxWidth: size.widthOf(weight: sizingWeight.w2)),
                child: resourceLogo())),
      ],
    );
  }
}
