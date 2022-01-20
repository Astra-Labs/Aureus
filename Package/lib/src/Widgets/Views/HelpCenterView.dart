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
  ContainerWrapperElement helpCenterLandingView = ContainerWrapperElement(
    containerVariant: wrapperVariants.fullScreen,
    children: [],
  );

  //the container that draws the first screen that someone will see when they enter the Help Center.
  ContainerWrapperElement helpCenterGridView = ContainerWrapperElement(
    containerVariant: wrapperVariants.stackScroll,
    children: [],
  );

  //the container that draws the first screen that someone will see when they enter the Help Center.
  ContainerWrapperElement helpCenterListView = ContainerWrapperElement(
    containerVariant: wrapperVariants.stackScroll,
    children: [],
  );

  //the container that draws the first screen that someone will see when they enter the Help Center.
  ContainerWrapperElement helpCenterDetailView = ContainerWrapperElement(
    containerVariant: wrapperVariants.stackScroll,
    children: [],
  );

  @override
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
