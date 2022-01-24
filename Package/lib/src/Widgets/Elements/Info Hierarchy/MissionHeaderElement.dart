import 'package:aureus/aureus.dart';

class MissionHeaderElement extends StatelessWidget {
  Widget build(BuildContext context) {
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
                child: coloration.resourceLogo())),
      ],
    );
  }
}
