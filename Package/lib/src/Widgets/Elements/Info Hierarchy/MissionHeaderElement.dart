import 'package:aureus/aureus.dart';

class MissionHeaderElement extends StatelessWidget {
  const MissionHeaderElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var responsiveSize = size.responsiveTextSize(50.0);

    return Semantics.fromProperties(
      properties: SemanticsWrapper.header(label: 'How can I help?'),
      child: Column(
        children: [
          SizedBox(height: size.responsiveTextSize(30.0)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              HeadingOneText('How can I help?', decorationPriority.standard),
              const Spacer(),
              SizedBox(
                  width: responsiveSize,
                  height: responsiveSize,
                  child: coloration.resourceLogo()),
            ],
          ),
        ],
      ),
    );
  }
}
