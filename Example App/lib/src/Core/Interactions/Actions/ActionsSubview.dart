part of AureusTestingApp;

/*--------- VIEWS SUBVIEW ----------*/

class ActionsSubview extends StatefulWidget {
  const ActionsSubview();

  @override
  _ActionsSubviewState createState() => _ActionsSubviewState();
}

class _ActionsSubviewState extends State<ActionsSubview> {
  var actionsList = ContainerActionsList();

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
    var actionsRow = [
      returnCard("Show Alert Controller", () {
        actionsList.callAlertControllerRequest();
      }),
      returnCard("Show Content Warning", () {
        actionsList.callContentWarningRequest();
      }),
      returnCard("Show Alert Notification", () {
        actionsList.callAlertNotificationRequest();
      }),
      returnCard("Show Bottom Action Sheet", () {
        actionsList.callBottomActionSheetRequest();
      }),
      returnCard("Show Text Field Alert Controller", () {
        actionsList.callTextFieldAlertControllerRequest();
      }),
    ];

    var viewBuilder = ContainerWrapperElement(children: [
      HeadingOneText("Actions", decorationPriority.standard),
      SizedBox(height: 10),
      DividerElement(),
      SizedBox(height: 10),
      Wrap(
        alignment: WrapAlignment.start,
        runAlignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 10,
        runSpacing: 15,
        children: actionsRow,
      )
    ], containerVariant: wrapperVariants.stackScroll);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewBuilder,
      showQuickActionBar: false,
      shouldManageNotifications: false,
    );
  }
}
