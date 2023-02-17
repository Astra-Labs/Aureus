part of AureusTestingApp;

/*  COMPONENTS  */

class AureusComponentsView extends NavBarComponent {
  AureusComponentsView()
      : super(tabItems: [
          ControllerTabObject(
              tabTitle: 'Components',
              tabController: ComponentsSubview(),
              accessibilityHint: 'Changes selected tab to "For You" page.',
              tabIcon: Assets.paperplane),
          ControllerTabObject(
              tabTitle: 'Elements',
              tabController: ElementsSubview(),
              accessibilityHint: 'Changes selected tab to "Explore" page.',
              tabIcon: Assets.paperplane),
          ControllerTabObject(
              tabTitle: 'Views',
              tabController: ViewsSubview(),
              accessibilityHint: 'Changes selected tab to "Launch" page.',
              tabIcon: Assets.paperplane),
        ]);
}
