import 'package:aureus/aureus.dart';

class StandardSwitchCardElement extends StatefulWidget {
  final String switchDescription;
  bool isSwitchEnabled = false;

  StandardSwitchCardElement({required this.switchDescription});

  @override
  _StandardSwitchCardElementState createState() =>
      _StandardSwitchCardElementState();
}

class _StandardSwitchCardElementState extends State<StandardSwitchCardElement> {
  void toggleSwitch(bool value) {
    if (widget.isSwitchEnabled == false) {
      setState(() {
        widget.isSwitchEnabled = true;
      });
    } else {
      setState(() {
        widget.isSwitchEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size minimumLabelTextSize = Accessibility.textStringSize(
        textInput: widget.switchDescription,
        textStyle: body1(),
        textDirection: TextDirection.ltr,
        query: MediaQuery.of(context));

    var screenSize = size.logicalScreenSize();

    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: FloatingContainerElement(
        child: SizedBox(
            width: size.layoutItemWidth(1, screenSize),
            height: minimumLabelTextSize.height * 6,
            child: Container(
                decoration: LayerBackingDecoration(
                        priority: decorationPriority.inactive)
                    .buildBacking(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: BodyOneText(widget.switchDescription,
                              decorationPriority.standard),
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: widget.isSwitchEnabled,
                          activeColor: coloration.contrastColor(),
                          activeTrackColor: coloration.accentColor(),
                          inactiveThumbColor: coloration.accentColor(),
                          inactiveTrackColor: coloration.inactiveColor(),
                        )
                      ]),
                ))),
      ),
    );
  }
}
