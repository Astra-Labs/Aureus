import 'package:aureus/aureus.dart';
import 'package:aureus/src/Widgets/Components/Communication/ExitBarComponent.dart';
import 'package:flutter/rendering.dart';

//A container that sets the size for the screen with QA-approved padding, and enables the exit bar at the top of the screen when enabled in the safety plan.
//Doc Link:

class ContainerView extends StatefulWidget {
  final decorationPriority decorationVariant;
  final LayoutBuilder builder;

  const ContainerView({required this.decorationVariant, required this.builder});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  @override
  Widget build(BuildContext context) {
    //pull exit bar setting status from Safety Plan
    const bool hasExitBar = false;

    BoxDecoration containerBacking() {
      if (foundation.brightness == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid

          return BoxDecoration(
            image: DecorationImage(
              image: foundation.lightFluidImage.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
          return BoxDecoration(gradient: foundation.lightGradient());
        }
      } else if (foundation.brightness == Brightness.dark) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns dark fluid

          return BoxDecoration(
            image: DecorationImage(
              image: foundation.darkFluidImage.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
          return BoxDecoration(gradient: foundation.darkGradient());
        }
      }
      return BoxDecoration();
    }

    Container defaultContainer = Container(
        padding: size.containerPadding(),
        alignment: Alignment.center,
        width: size.widthOf(weight: sizingWeight.w10),
        decoration: containerBacking());

    Container exitBarContainer = Container(
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10),
        alignment: Alignment.center,
        decoration: containerBacking(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ExitBarComponent(), defaultContainer]));

    if (hasExitBar == true) {
      return SizedBox(
          width: size.widthOf(weight: sizingWeight.w10),
          height: size.heightOf(weight: sizingWeight.w10),
          child: exitBarContainer);
    } else if (hasExitBar == false) {
      return SizedBox(
          width: size.widthOf(weight: sizingWeight.w10),
          height: size.heightOf(weight: sizingWeight.w10),
          child: defaultContainer);
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
