import 'package:aureus/aureus.dart';

//A container that sets the size for the screen with QA-approved padding,
//and enables the exit bar at the top of the screen when enabled in the safety plan.

class ContainerView extends StatefulWidget {
  //determines if primary landing page (fluid decoration),
  //or just secondary page (blur decoration).
  final decorationPriority decorationVariant;
  final ContainerWrapperElement builder;
  final bool? takesFullWidth;

  ContainerView(
      {required this.decorationVariant,
      required this.builder,
      this.takesFullWidth = false});

  @override
  _ContainerViewState createState() => _ContainerViewState();
}

class _ContainerViewState extends State<ContainerView> {
  @override
  Widget build(BuildContext context) {
    //pull exit bar setting status from Safety Plan
    const bool hasExitBar = false;

    BoxDecoration containerBacking() {
      if (brightness() == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.lightFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
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
          return BoxDecoration(
            image: DecorationImage(
              image: apiVariables.darkFluidImage!.image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
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
            width: widget.takesFullWidth!
                ? size.widthOf(weight: sizingWeight.w10)
                : size.layoutItemWidth(1, size.logicalScreenSize),
            child: widget.builder));

    if (hasExitBar == true) {
      return Scaffold(
        body: SizedBox(
            height: size.physicalHeight,
            width: size.physicalWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [ExitBarComponent(), backingContainer],
            )),
      );
    } else if (hasExitBar == false) {
      return Scaffold(
          body: (SizedBox(
              height: size.physicalHeight,
              width: size.physicalWidth,
              child: backingContainer)));
    }

    throw ErrorDescription('Exit bar value not given.');
  }
}
