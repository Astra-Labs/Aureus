import 'package:aureus/aureus.dart';

class SafetyPlanLogInAuditView extends StatefulWidget {
  const SafetyPlanLogInAuditView();

  @override
  _SafetyPlanLogInAuditViewState createState() =>
      _SafetyPlanLogInAuditViewState();
}

class _SafetyPlanLogInAuditViewState extends State<SafetyPlanLogInAuditView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = const ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: []);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
