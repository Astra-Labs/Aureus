import 'package:aureus/aureus.dart';

//
//Doc Link:

class TFAVerificationView extends StatefulWidget {
  final modeVariants modeVariant;
  final deviceVariants deviceType;

  const TFAVerificationView({required this.modeVariant, required this.deviceType});

  @override
  _TFAVerificationViewState createState() => _TFAVerificationViewState();
}

class _TFAVerificationViewState extends State<TFAVerificationView> {
  @override
  Widget build(BuildContext context) {
    return ContainerView(
        modeVariant: widget.modeVariant,
        decorationVariant: decorationPriority.standard,
        childrenWidgets: [],
        hasExitBar: );
  }
}
