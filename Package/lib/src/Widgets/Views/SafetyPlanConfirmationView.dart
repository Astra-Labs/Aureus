import 'package:aureus/aureus.dart';

//
//Doc Link:

class SafetyPlanConfirmationView extends StatefulWidget {
  const SafetyPlanConfirmationView();

  @override
  _SafetyPlanConfirmationViewState createState() =>
      _SafetyPlanConfirmationViewState();
}

class _SafetyPlanConfirmationViewState
    extends State<SafetyPlanConfirmationView> {
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
