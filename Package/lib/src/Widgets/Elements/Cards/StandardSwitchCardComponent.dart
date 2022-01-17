import 'package:aureus/aureus.dart';

//A 80% width button that acts as a standard button for the UDS
//Doc Link:

class StandardSwitchCard extends StatefulWidget {
  final String switchDescription;

  const StandardSwitchCard({required this.switchDescription});

  @override
  _StandardSwitchCardState createState() => _StandardSwitchCardState();
}

class _StandardSwitchCardState extends State<StandardSwitchCard> {
  bool isSwitchEnabled = false;

  void toggleSwitch(bool value) {
    if (isSwitchEnabled == false) {
      setState(() {
        isSwitchEnabled = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitchEnabled = false;
      });
      print('Switch Button is OFF');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size minimumLabelTextSize = Accessibility.textStringSize(
        textInput: widget.switchDescription,
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    return SizedBox(
        width: size.layoutItemWidth(1, size.logicalScreenSize),
        height: minimumLabelTextSize.height * 5,
        child: Container(
            decoration: LayerBackingDecoration(
                    priority: isSwitchEnabled
                        ? decorationPriority.important
                        : decorationPriority.inactive)
                .buildBacking(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 10.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    BodyOneText(
                        widget.switchDescription,
                        isSwitchEnabled
                            ? decorationPriority.important
                            : decorationPriority.inactive),
                    SwitchComponent()
                  ]),
            )));
  }
}
