part of AureusTestingApp;

/*  COMPONENTS  */

class AureusComponentsView extends NavBarComponent {
  AureusComponentsView()
      : super(
          shouldManageNotifications: false,
          tabItems: [
            ControllerTabObject(
                tabTitle: 'Components',
                tabController: ComponentsSubview(),
                accessibilityHint: 'Changes selected tab to "Components" page.',
                tabIcon: Assets.paperplane),
            ControllerTabObject(
                tabTitle: 'Elements',
                tabController: ElementsSubview(),
                accessibilityHint: 'Changes selected tab to "Elements" page.',
                tabIcon: Assets.paperplane),
            ControllerTabObject(
                tabTitle: 'Views',
                tabController: ViewsSubview(),
                accessibilityHint: 'Changes selected tab to "Views" page.',
                tabIcon: Assets.paperplane),
          ],
        );
}
