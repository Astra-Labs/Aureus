part of AureusTestingApp;

/*--------- VIEWS SUBVIEW ----------*/

class SensationsSubview extends StatefulWidget {
  const SensationsSubview();

  @override
  _SensationsSubviewState createState() => _SensationsSubviewState();
}

class _SensationsSubviewState extends State<SensationsSubview> {
  Widget returnCard(String title, VoidCallback action) {
    return GestureDetector(
      onTap: action,
      child: StandardCardElement(
        decorationVariant: decorationPriority.standard,
        cardLabel: title,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var interationsRow = [
      returnCard("Confirmation", () {
        sensation.createSensation(sensationType.confirmation);
      }),
      returnCard("Praise", () {
        sensation.createSensation(sensationType.praise);
      }),
      returnCard("Error", () {
        sensation.createSensation(sensationType.error);
      }),
      returnCard("attention", () {
        sensation.createSensation(sensationType.attention);
      }),
      returnCard("notification", () {
        sensation.createSensation(sensationType.notification);
      }),
      returnCard("urgent", () {
        sensation.createSensation(sensationType.urgent);
      }),
      returnCard("enable", () {
        sensation.createSensation(sensationType.enable);
      }),
      returnCard("disable", () {
        sensation.createSensation(sensationType.disable);
      }),
      returnCard("swipe", () {
        sensation.createSensation(sensationType.swipe);
      }),
      returnCard("press", () {
        sensation.createSensation(sensationType.press);
      }),
      returnCard("hold", () {
        sensation.createSensation(sensationType.hold);
      }),
    ];

    var viewBuilder = ContainerWrapperElement(
      children: [
        HeadingOneText("Sensations", decorationPriority.standard),
        SizedBox(height: 10),
        Wrap(
          alignment: WrapAlignment.start,
          runAlignment: WrapAlignment.spaceEvenly,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: 15,
          children: interationsRow,
        )
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
