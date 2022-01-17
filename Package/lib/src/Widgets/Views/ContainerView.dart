import 'package:aureus/aureus.dart';

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
      if (brightness() == Brightness.light) {
        if (widget.decorationVariant == decorationPriority.important) {
          //returns light fluid

          print('should show light fluid');
          return BoxDecoration(
            image: DecorationImage(
              image: Image.network(
                      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Fluid%20-%20Portrait.png?raw=true')
                  .image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns light blur
          print('should show light blur');
          return BoxDecoration(
            image: DecorationImage(
              image: Image.network(
                      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Light%20Blur%20-%20Portrait.png?raw=true')
                  .image,
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
              image: Image.network(
                      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Fluid%20-%20Portrait.png?raw=true')
                  .image,
              fit: BoxFit.cover,
            ),
          );
        } else if (widget.decorationVariant == decorationPriority.standard) {
          //returns dark blur
          print('should show dark blur');
          return BoxDecoration(
            image: DecorationImage(
              image: Image.network(
                      'https://github.com/Astra-Labs/Aureus/blob/Amanda-Stable/Package/lib/assets/Dark%20Blur%20-%20Portrait.png?raw=true')
                  .image,
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
        child: SizedBox(
            width: size.layoutItemWidth(1, size.logicalScreenSize),
            child: Center(child: widget.builder)));

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
