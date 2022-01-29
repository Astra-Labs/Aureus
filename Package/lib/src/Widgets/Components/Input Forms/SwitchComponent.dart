import 'package:aureus/aureus.dart';

//An icon tabbing bar and card that acts as an onboarding walkthrough
//Doc Link:

class SwitchComponent extends StatefulWidget {
  @override
  _SwitchComponentState createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
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
    return Switch(
      onChanged: toggleSwitch,
      value: isSwitchEnabled,
      activeColor: coloration.contrastColor(),
      activeTrackColor: coloration.accentColor(),
      inactiveThumbColor: coloration.accentColor(),
      inactiveTrackColor: coloration.inactiveColor(),
    );
  }
}
