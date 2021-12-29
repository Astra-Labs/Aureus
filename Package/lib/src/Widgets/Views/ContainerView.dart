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
    const bool hasExitBar = true;

    BoxDecoration containerBacking() {
      if (foundation.brightness == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid

          return BoxDecoration(
            image: DecorationImage(
              image: aureusVariables.lightFluidImage.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
          return BoxDecoration(
            image: DecorationImage(
              image: aureusVariables.lightBlurImage.image,
              fit: BoxFit.cover,
            ),
          );
        }
      } else if (foundation.brightness == Brightness.dark) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns dark fluid

          return BoxDecoration(
            image: DecorationImage(
              image: aureusVariables.darkFluidImage.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
          return BoxDecoration(
            image: DecorationImage(
              image: aureusVariables.darkBlurImage.image,
              fit: BoxFit.cover,
            ),
          );
        }
      }
      return BoxDecoration();
    }

    Container backingContainer = Container(
        padding: size.containerPadding(),
        alignment: Alignment.center,
        width: size.widthOf(weight: sizingWeight.w10),
        decoration: containerBacking(),
        child: Center(child: widget.builder));

    if (hasExitBar == true) {
      return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [ExitBarComponent(), Expanded(child: backingContainer)],
      ));
    } else if (hasExitBar == false) {
      return Scaffold(body: Expanded(child: backingContainer));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
