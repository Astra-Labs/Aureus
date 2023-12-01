import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- ONBOARDING LANDING VIEW ----------*/
/// A view where you can ask a user to share your resource.

class OnboardingSimpSharingView extends StatefulWidget {
  /// The message where you ask them to share the resource.
  final String simpMessage;

  /// What happens if they agree to share.
  final VoidCallback onSimpAgree;

  /// What happens if they decline. You should probably let them go.
  final VoidCallback onSimpDeny;

  const OnboardingSimpSharingView({
    required this.simpMessage,
    required this.onSimpAgree,
    required this.onSimpDeny,
  });

  @override
  _OnboardingSimpSharingViewState createState() =>
      _OnboardingSimpSharingViewState();
}

class _OnboardingSimpSharingViewState extends State<OnboardingSimpSharingView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: const []);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
