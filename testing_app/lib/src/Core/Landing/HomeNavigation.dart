part of AureusTestingApp;

class ExplorationView extends StatefulWidget {
  @override
  _ExplorationViewState createState() => _ExplorationViewState();
}

class _ExplorationViewState extends State<ExplorationView> {
  List<ControllerTabObject> tabItems = [
    ControllerTabObject(
        tabController: AureusElementsView(),
        tabTitle: "Elements",
        accessibilityHint: "Shows you the elements page",
        tabIcon: Assets.add),
    ControllerTabObject(
        tabController: AureusComponentsView(),
        tabTitle: "Components",
        accessibilityHint: "Shows you the components",
        tabIcon: Assets.babycarriage),
    ControllerTabObject(
        tabController: AureusViewsView(),
        tabTitle: "Views",
        accessibilityHint: "Shows you the views",
        tabIcon: Assets.hamburgermenu),
    ControllerTabObject(
        tabController: ToolDetailView(
          parentTool: testingTool,
        ),
        tabTitle: "Tools",
        accessibilityHint: "Shows you the tools",
        tabIcon: Assets.settings),
    ControllerTabObject(
        tabController: AureusSafetyView(),
        tabTitle: "Safety",
        accessibilityHint: "Shows you the safety features within Aurues",
        tabIcon: Assets.person),
    ControllerTabObject(
        tabController: AureusDataDetailView(),
        tabTitle: "Data",
        accessibilityHint: "Lets you try the data detail view",
        tabIcon: Assets.settings),
    ControllerTabObject(
        tabController: TestingView(),
        tabTitle: "Testing",
        accessibilityHint: "Shows you the testing page",
        tabIcon: Assets.pencil)
  ];

  @override
  Widget build(BuildContext context) {
    return VerticalSideNavBarComponent(tabItems: tabItems);
  }
}

class TestingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var containerViewHolder = ContainerWrapperElement(children: [
      AddressDataCardElement(
        dataLabel: "Address",
      ).returnEditDataCard(),
    ], containerVariant: wrapperVariants.fullScreen);

    return ContainerView(
      decorationVariant: decorationPriority.standard,
      builder: containerViewHolder,
      showQuickActionBar: true,
    );
  }
}
