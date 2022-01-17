import 'package:aureus/aureus.dart';

//
//Doc Link:

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenterView extends StatefulWidget {
  final HelpCenterObject helpCenter;

  const HelpCenterView({required this.helpCenter});

  @override
  _HelpCenterViewState createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  //the container that draws the first screen that someone will see when they enter the Help Center.
  LayoutBuilder helpCenterLandingView() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  LayoutBuilder helpCenterGridView() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  LayoutBuilder helpCenterListView() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });
  }

  //the container that draws the first screen that someone will see when they enter the Help Center.
  LayoutBuilder helpCenterDetailView() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });
  }

  @override
  Widget build(BuildContext context) {
    LayoutBuilder viewLayout = LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Container();
    });

    return viewLayout;
  }
}
