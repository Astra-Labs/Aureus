// ignore_for_file: must_be_immutable
/// @nodoc
import 'package:flutter/material.dart';

import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Components}
/// {@image <image alt='' src=''>}

/*--------- SWITCH COMPONENT ----------*/
/// A simple switch to represent an on/off state.

class SwitchComponent extends StatefulWidget {
  bool isSwitchEnabled = false;
  VoidCallback? onEnable;
  VoidCallback? onDisable;

  SwitchComponent(this.onEnable, this.onDisable);

  @override
  _SwitchComponentState createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  @override
  void initState() {
    sensation.prepare();
    super.initState();
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  void toggleSwitch(bool value) {
    if (widget.isSwitchEnabled == false) {
      if (widget.onEnable != null) {
        widget.onEnable!();
      }
      setState(() {
        widget.isSwitchEnabled = true;
        //uses the sensory library to make an enabled noise.
        sensation.createSensation(sensationType.enable);
      });
    } else {
      if (widget.onDisable != null) {
        widget.onDisable!();
      }
      setState(() {
        widget.isSwitchEnabled = false;
        //uses the sensory library to make an disable noise.
        sensation.createSensation(sensationType.disable);
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
