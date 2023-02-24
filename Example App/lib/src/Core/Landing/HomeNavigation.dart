part of AureusTestingApp;

class ExplorationView extends StatefulWidget {
  @override
  _ExplorationViewState createState() => _ExplorationViewState();
}

class _ExplorationViewState extends State<ExplorationView> {
  List<ControllerTabObject> tabItems = [
    ControllerTabObject(
        tabController: AureusComponentsView(),
        tabTitle: "UI",
        accessibilityHint: "Shows you all of the UI Components in Aureus.",
        tabIcon: Assets.add),
    ControllerTabObject(
        tabController: AureusInteractionsView(),
        tabTitle: "Interact",
        accessibilityHint:
            "Lets you try the interactibility aspects of Aureus.",
        tabIcon: Assets.brain),
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
