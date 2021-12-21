import 'package:aureus/aureus.dart';

//
//Doc Link:

class SafetyPlanFunctionalityView extends StatefulWidget {
  const SafetyPlanFunctionalityView();

  @override
  _SafetyPlanFunctionalityViewState createState() =>
      _SafetyPlanFunctionalityViewState();
}

class _SafetyPlanFunctionalityViewState
    extends State<SafetyPlanFunctionalityView> {
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
