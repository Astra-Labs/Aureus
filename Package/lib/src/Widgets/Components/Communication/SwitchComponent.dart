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

  SwitchComponent(
    this.onEnable,
    this.onDisable, {
    this.isSwitchEnabled = false,
  });

  @override
  _SwitchComponentState createState() => _SwitchComponentState();
}

class _SwitchComponentState extends State<SwitchComponent> {
  bool isOn = false;

  @override
  void initState() {
    sensation.prepare();
    super.initState();

    isOn = widget.isSwitchEnabled;
  }

  @override
  void dispose() {
    sensation.dispose();
    super.dispose();
  }

  void toggleSwitch(bool value) {
    setState(() {
      widget.isSwitchEnabled = value;
      isOn = value;
    });

    if (value == true) {
      setState(() {
        if (widget.onEnable != null) {
          widget.onEnable!();
        }
        sensation.createSensation(sensationType.enable);
      });
    } else if (value == false) {
      setState(() {
        if (widget.onDisable != null) {
          widget.onDisable!();
        }
        sensation.createSensation(sensationType.disable);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      onChanged: (bool value) {
        toggleSwitch(value);
      },
      value: isOn,
      activeColor: coloration.contrastColor(),
      activeTrackColor: coloration.accentColor(),
      inactiveThumbColor: coloration.accentColor(),
      inactiveTrackColor: coloration.inactiveColor(),
    );
  }
}
