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
    return Switch(
      onChanged: toggleSwitch,
      value: isSwitchEnabled,
      activeColor: coloration.accentColor(),
      activeTrackColor: coloration.sameColor(),
      inactiveThumbColor: coloration.sameColor(),
      inactiveTrackColor: coloration.accentColor(),
    );
  }
}
