part of AureusTestingApp;

class AureusInteractionsView extends StatefulWidget {
  const AureusInteractionsView();

  @override
  _AureusInteractionsViewState createState() => _AureusInteractionsViewState();
}

class _AureusInteractionsViewState extends State<AureusInteractionsView> {
  List<Widget> viewGridCards = [];

  @override
  Widget build(BuildContext context) {
    Widget returnCard(String title, VoidCallback action) {
      return StandardCardElement(
        decorationVariant: decorationPriority.standard,
        cardLabel: "",
      );
    }

    var actionsRow = [
      returnCard("Show Alert Controller", () {}),
      returnCard("Show Content Warning", () {}),
      returnCard("Show Alert Notification Request", () {}),
      returnCard("Show Bottom Action Sheet", () {}),
    ];

    var interationsRow = [
      returnCard("Confirmation", () {}),
      returnCard("Praise", () {}),
      returnCard("Error", () {}),
      returnCard("attention", () {}),
      returnCard("notification", () {}),
      returnCard("urgent", () {}),
      returnCard("enable", () {}),
      returnCard("disable", () {}),
      returnCard("swipe", () {}),
      returnCard("press", () {}),
      returnCard("hold", () {}),
    ];

    var backingsRow = [];

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          HeadingOneText("Interactions", decorationPriority.standard),
        ]);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      showQuickActionBar: false,
    );
  }
}
