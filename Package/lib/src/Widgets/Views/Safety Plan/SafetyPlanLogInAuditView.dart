import 'package:aureus/aureus.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- SAFETY PLAN LOG IN AUDIT VIEW ----------*/
///
class SafetyPlanLogInAuditView extends StatefulWidget {
  const SafetyPlanLogInAuditView();

  @override
  _SafetyPlanLogInAuditViewState createState() =>
      _SafetyPlanLogInAuditViewState();
}

class _SafetyPlanLogInAuditViewState extends State<SafetyPlanLogInAuditView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: []);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
