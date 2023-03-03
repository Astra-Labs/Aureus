part of AureusTestingApp;

/*  CONTAINER ACTIONS  

Actions that the container view supports. 
This can be things like showing an alert controller, 
a content warning view, a drop down notification, etc. 

*/

class ContainerActionsList {
  void callAlertControllerRequest() {
    var alertControllerData = AlertControllerObject.singleAction(
        onCancellation: () => {},
        alertTitle: "I'm an Alert Controller",
        alertBody: "Use me when users only have 1 or 2 choices :-)",
        alertIcon: Assets.alertmessage,
        actions: [
          AlertControllerAction(
              actionName: "Action 1",
              actionSeverity: AlertControllerActionSeverity.cancel,
              onSelection: () => {
                    notificationMaster.resetRequests(),
                  })
        ]);
    notificationMaster.sendAlertControllerRequest(alertControllerData);
  }

  void callAlertNotificationRequest() {
    notificationMaster.sendAlertNotificationRequest(
        "I'm an alert notification!", Assets.snowflake);
  }

  void callBottomActionSheetRequest() {
    var alertControllerData = AlertControllerObject.multipleActions(
        onCancellation: () => {
              notificationMaster.resetRequests(),
            },
        alertTitle: "I'm a bottom action sheet.",
        alertBody:
            "You should use me when you want your user to have more than 3 options.",
        alertIcon: Assets.alertmessage,
        actions: [
          AlertControllerAction(
              actionName: "Action 1",
              actionSeverity: AlertControllerActionSeverity.cancel,
              onSelection: () => {
                    notificationMaster.resetRequests(),
                  }),
          AlertControllerAction(
              actionName: "Action 2",
              actionSeverity: AlertControllerActionSeverity.cancel,
              onSelection: () => {
                    notificationMaster.resetRequests(),
                  }),
          AlertControllerAction(
              actionName: "Action 3",
              actionSeverity: AlertControllerActionSeverity.cancel,
              onSelection: () => {
                    notificationMaster.resetRequests(),
                  }),
        ]);

    notificationMaster.showBottomActionController(alertControllerData);
  }

  void callContentWarningRequest() {
    notificationMaster.sendContentWarningRequest(
        "I'm a content warning request.", Assets.alertmessage);
  }

  void callTextFieldAlertControllerRequest() {
    notificationMaster.showTextFieldAlertController(
      AlertControllerObject.textField(
        onCancellation: () => {},
        alertTitle: "Text Field",
        alertBody: "Howdy! Enter stuff into the text field.",
        alertIcon: Assets.babycarriage,
        controller: TextEditingController(),
        hintText: "Enter text here.",
        onFinish: () => {
          notificationMaster.resetRequests(),
        },
      ),
    );
  }
}
