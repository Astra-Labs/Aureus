import 'package:aureus/aureus.dart';

//An icon tabbing bar and card that acts as an onboarding walkthrough
//Doc Link:

class SwitchComponent extends StatefulWidget {
  bool isSwitchEnabled = false;
  VoidCallback? onEnable;
  VoidCallback? onDisable;

  SwitchComponent(this.onEnable, this.onDisable);

  @override
  _SwitchComponentState createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  void toggleSwitch(bool value) {
    if (widget.isSwitchEnabled == false) {
      if (widget.onEnable != null) {
        widget.onEnable!();
      }
      setState(() {
        widget.isSwitchEnabled = true;
      });
    } else {
      if (widget.onDisable != null) {
        widget.onDisable!();
      }
      setState(() {
        widget.isSwitchEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: toggleSwitch,
      value: widget.isSwitchEnabled,
      activeColor: coloration.contrastColor(),
      activeTrackColor: coloration.accentColor(),
      inactiveThumbColor: coloration.accentColor(),
      inactiveTrackColor: coloration.inactiveColor(),
    );
  }
}
