import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Components/Communication/ExitBarComponent.dart';
import 'package:flutter/rendering.dart';

//A container that sets the size for the screen with QA-approved padding, and enables the exit bar at the top of the screen when enabled in the safety plan.
//Doc Link:

class ContainerView extends StatefulWidget {
  final modeVariants modeVariant;
  final bool hasExitBar;

  const ContainerView({required this.modeVariant, required this.hasExitBar});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  @override
  Widget build(BuildContext context) {
    Container defaultContainer = Container(
        padding: size.containerPadding(),
        alignment: Alignment.center,
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10),
        color: coloration.modeColor(widget.modeVariant));

    Container exitBarContainer = Container(
      width: size.widthOf(weight: sizingWeight.w10),
      height: size.heightOf(weight: sizingWeight.w10),
      alignment: Alignment.center,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ExitBarComponent(modeVariant: widget.modeVariant),
        defaultContainer
      ]),
      decoration: LayerBackingDecoration(
              variant: layerDecorationVariants.edged,
              mode: widget.modeVariant,
              priority: decorationPriority.inactive)
          .buildBacking(),
    );

    // A bug in flutter is preventing this from being a ternary operator. At a later date, switch to ternary.
    if (widget.hasExitBar == true) {
      return exitBarContainer;
    } else if (widget.hasExitBar == false) {
      return defaultContainer;
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
