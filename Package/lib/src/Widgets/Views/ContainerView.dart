import 'package:aureus/aureus.dart';

//A container that sets the size for the screen with QA-approved padding, and enables the exit bar at the top of the screen when enabled in the safety plan.
//Doc Link:

class ContainerView extends StatefulWidget {
  final decorationPriority decorationVariant;
  final ContainerWrapperElement builder;

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
      if (brightness() == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid

          print('should show light fluid');
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.lightFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
          print('should show light blur');
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.lightBlurImage!.image,
              fit: BoxFit.cover,
            ),
          );
        }
      } else if (brightness() == Brightness.dark) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns dark fluid

          print('should show dark fluid');
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.darkFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
          print('should show dark blur');
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.darkBlurImage!.image,
              fit: BoxFit.cover,
            ),
          );
        }
      }
      return BoxDecoration();
    }

    Container backingContainer = Container(
        alignment: Alignment.center,
        width: size.widthOf(weight: sizingWeight.w10),
        decoration: containerBacking(),
        padding: EdgeInsets.fromLTRB(
            0.0,
            size.heightOf(weight: sizingWeight.w0),
            0.0,
            size.heightOf(weight: sizingWeight.w0)),
        child: Container(
            width: size.layoutItemWidth(1, size.logicalScreenSize),
            child: widget.builder));

    if (hasExitBar == true) {
      return SizedBox(
          height: size.logicalHeight,
          width: size.logicalWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [ExitBarComponent(), Expanded(child: backingContainer)],
          ));
    } else if (hasExitBar == false) {
      return SizedBox(
          height: size.logicalHeight,
          width: size.logicalWidth,
          child: Expanded(child: backingContainer));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
