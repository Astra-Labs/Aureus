import 'package:aureus/aureus.dart';

class StandardSwitchCardComponent extends StatefulWidget {
  final String switchDescription;

  const StandardSwitchCardComponent({required this.switchDescription});

  @override
  _StandardSwitchCardComponentState createState() =>
      _StandardSwitchCardComponentState();
}

class _StandardSwitchCardComponentState
    extends State<StandardSwitchCardComponent> {
  bool isSwitchEnabled = false;

  void toggleSwitch(bool value) {
    if (isSwitchEnabled == false) {
      setState(() {
        isSwitchEnabled = true;
      });
    } else {
      setState(() {
        isSwitchEnabled = false;
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

    return FloatingContainerElement(
      child: SizedBox(
          width: size.layoutItemWidth(1, size.logicalScreenSize),
          height: minimumLabelTextSize.height * 5,
          child: Container(
              decoration: LayerBackingDecoration(
                      priority: isSwitchEnabled
                          ? decorationPriority.important
                          : decorationPriority.inactive)
                  .buildBacking(),
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      BodyOneText(
                          widget.switchDescription,
                          isSwitchEnabled
                              ? decorationPriority.important
                              : decorationPriority.standard),
                      SwitchComponent()
                    ]),
              ))),
    );
  }
}
