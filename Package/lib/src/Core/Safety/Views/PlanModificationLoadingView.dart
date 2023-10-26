part of aureus_safety_plan;

/// A view used by Aureus to update the user's safety settings privately
/// in the Storage Layer.

class _PlanModificationLoadingView extends StatefulWidget {
  final Map<SafetyPlanOptions, bool> userEnabledSettings;
  final Widget exitPoint;

  const _PlanModificationLoadingView({
    required this.userEnabledSettings,
    required this.exitPoint,
  });

  @override
  _PlanModificationLoadingViewState createState() =>
      _PlanModificationLoadingViewState();
}

class _PlanModificationLoadingViewState
    extends State<_PlanModificationLoadingView> {
  @override
  Widget build(BuildContext context) {
    var futureViewLayout = ContainerWrapperElement(children: [
      FutureBuilder<void>(
        future:
            _SafetyPlanStorageLayer().writeSettings(widget.userEnabledSettings),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the screen and the alert controller confirmation.
            if (snapshot.hasData == true) {
              notificationMaster.sendAlertControllerRequest(
                AlertControllerObject.singleAction(
                  onCancellation: () => {},
                  alertTitle: "Safety Plan Enabled",
                  alertBody:
                      "Your safety plan settings have been enabled, encrypted, and saved.",
                  alertIcon: Assets.yes,
                  actions: [
                    AlertControllerAction(
                        actionName: "Ok!",
                        actionSeverity: AlertControllerActionSeverity.standard,
                        onSelection: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => widget.exitPoint,
                                  ))
                            })
                  ],
                ),
              );
            }
            return const Column(
              children: [],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: LoadingCircleElement());
          }
        },
      )
    ], containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: futureViewLayout,
    );
  }
}
