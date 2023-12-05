part of AureusTestingApp;

/*--------- VIEWS SUBVIEW ----------*/

class InteractionsSubview extends StatefulWidget {
  const InteractionsSubview();

  @override
  _InteractionsSubviewState createState() => _InteractionsSubviewState();
}

class _InteractionsSubviewState extends State<InteractionsSubview> {
  var interactions = InteractionBackings();

  @override
  Widget build(BuildContext context) {
    // Button
    var buttonColumn = Column(
      children: [
        TabSubheaderElement(title: "Buttons"),
        interactions.buttonBackingTest,
        DividerElement(),
      ],
    );

    // Layer
    var layerColumn = Column(
      children: [
        TabSubheaderElement(title: "Layers"),
        interactions.layerBackingTest,
        DividerElement(),
      ],
    );

    // Input
    var inputColumn = Column(
      children: [
        TabSubheaderElement(title: "Inputs"),
        interactions.inputBackingTest,
        DividerElement(),
      ],
    );

    // Tab
    var tabColumn = Column(
      children: [
        TabSubheaderElement(title: "Tabs"),
        interactions.tabBackingTest,
        DividerElement(),
      ],
    );

    var viewBuilder = ContainerWrapperElement(
      children: [
        HeadingOneText(
            data: "Interactions", textColor: decorationPriority.standard),
        SizedBox(height: 10),
        interactions.buttonBackingTest,
      ],
      containerVariant: wrapperVariants.stackScroll,
    );

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewBuilder,
      showQuickActionBar: false,
      shouldManageNotifications: false,
    );
  }
}
