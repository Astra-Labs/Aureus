part of AureusTestingApp;

/*--------- VIEWS SUBVIEW ----------*/

class SensationsSubview extends StatefulWidget {
  const SensationsSubview();

  @override
  _SensationsSubviewState createState() => _SensationsSubviewState();
}

class _SensationsSubviewState extends State<SensationsSubview> {
  Widget returnCard(String title, VoidCallback action) {
    return StandardCardElement(
      decorationVariant: decorationPriority.standard,
      cardLabel: title,
      onTap: action,
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
      returnCard("Attention", () {
        sensation.createSensation(sensationType.attention);
      }),
      returnCard("Notification", () {
        sensation.createSensation(sensationType.notification);
      }),
      returnCard("Urgent", () {
        sensation.createSensation(sensationType.urgent);
      }),
      returnCard("Enable", () {
        sensation.createSensation(sensationType.enable);
      }),
      returnCard("Disable", () {
        sensation.createSensation(sensationType.disable);
      }),
      returnCard("Swipe", () {
        sensation.createSensation(sensationType.swipe);
      }),
      returnCard("Press", () {
        sensation.createSensation(sensationType.press);
      }),
      returnCard("Hold", () {
        sensation.createSensation(sensationType.hold);
      }),
    ];

    var viewBuilder = ContainerWrapperElement(
      children: [
        HeadingOneText(
            data: "Sensations", textColor: decorationPriority.standard),
        SizedBox(height: 10),
        DividerElement(),
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
