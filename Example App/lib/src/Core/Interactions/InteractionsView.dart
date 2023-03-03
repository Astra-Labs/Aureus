part of AureusTestingApp;

class AureusInteractionsView extends NavBarComponent {
  AureusInteractionsView()
      : super(
          shouldManageNotifications: false,
          tabItems: [
            ControllerTabObject(
                tabTitle: 'Actions',
                tabController: ActionsSubview(),
                accessibilityHint: 'Changes selected tab to "Actions" page.',
                tabIcon: Assets.paperplane),
            /*ControllerTabObject(
                tabTitle: 'Interactions',
                tabController: InteractionsSubview(),
                accessibilityHint:
                    'Changes selected tab to "Interactions" page.',
                tabIcon: Assets.paperplane),*/
            ControllerTabObject(
                tabTitle: 'Sensations',
                tabController: SensationsSubview(),
                accessibilityHint: 'Changes selected tab to "Sensations" page.',
                tabIcon: Assets.paperplane),
          ],
        );
}
