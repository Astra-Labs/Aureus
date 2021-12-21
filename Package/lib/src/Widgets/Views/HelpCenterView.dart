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
    LayoutBuilder viewLayout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
