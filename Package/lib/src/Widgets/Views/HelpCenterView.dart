import 'package:aureus/aureus.dart';

//
//Doc Link:

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenterView extends StatefulWidget {
  final HelpCenterObject helpCenter;
  final modeVariants viewMode;
  final deviceVariants deviceType;

  const HelpCenterView(
      {required this.helpCenter,
      required this.viewMode,
      required this.deviceType});

  @override
  _HelpCenterViewState createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterLandingView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterGridView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterListView() {
    return Expanded(child: Container());
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  Expanded helpCenterDetailView() {
    return Expanded(child: Container());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(
            size.widthOf(weight: sizingWeight.w0),
            size.heightOf(weight: sizingWeight.w1),
            size.widthOf(weight: sizingWeight.w0),
            size.heightOf(weight: sizingWeight.w0)),
        width: size.widthOf(weight: sizingWeight.w10),
        height: size.heightOf(weight: sizingWeight.w10),
        decoration:
            LayerBackingDecoration(priority: decorationPriority.standard)
                as Decoration,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: []));
  }
}
