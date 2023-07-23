part of AureusTestingApp;

/*  TOOLS  */

var testingTool = CoreTool(
    toolName: "Test Tool",
    toolDescription:
        "This is a tool meant to show you all of the card options available in Aureus, and to give you a code example of what building and implementing a tool looks like.",
    toolDetails: {
      "Android": Assets.android,
      "iOS": Assets.apple,
      "Web": Assets.window,
    },
    toolIcon: Assets.medicine,
    toolCards: [
      DatePickerInputToolTemplate(
          templatePrompt: "I'm the DatePickerInputToolTemplate.",
          badgeIcon: Assets.add),
      DualColumnInputToolTemplate(
          prompt1: "Prompt 1",
          prompt2: "Prompt 2",
          templatePrompt: "I'm the DualColumnInputToolTemplate.",
          badgeIcon: Assets.add),
      PromptListUserInputToolTemplate(
          templatePrompt: "I'm the PromptListUserInputToolTemplate.",
          badgeIcon: Assets.add),
      SingleInputToolTemplate(
          templatePrompt: "I'm the SingleInputToolTemplate.",
          badgeIcon: Assets.add),
      SingleSliderToolTemplate(
          templatePrompt: "I'm the SingleSliderToolTemplate.",
          badgeIcon: Assets.add),
      TimePickerInputToolTemplate(
          templatePrompt: "I'm the TimePickerInputToolTemplate.",
          badgeIcon: Assets.add),
      TriInputToolTemplate(
          textPrompt1: "text prompt 1",
          textPrompt2: "text prompt 2",
          textPrompt3: "text prompt 3",
          templatePrompt: "I'm the TriInputToolTemplate.",
          badgeIcon: Assets.add),
      AdaptiveInputSelectionToolTemplate(),
      AdaptiveInputToolTemplate(
          templatePrompt: "I'm the AdaptiveInputToolTemplate.",
          badgeIcon: Assets.add),
      CameraInputToolTemplate(
          templatePrompt: "I'm the CameraInputToolTemplate.",
          badgeIcon: Assets.add),
      ColorSpectrumInputToolTemplate(
          templatePrompt: "I'm the ColorSpectrumInputToolTemplate.",
          badgeIcon: Assets.add),
      MicrophoneInputToolTemplate(
          templatePrompt: "I'm the MicrophoneInputToolTemplate.",
          badgeIcon: Assets.add),
      SensoryMapToolTemplate(
          templatePrompt: "I'm the SensoryMapToolTemplate.",
          badgeIcon: Assets.add),
      SketchToolTemplate(
          templatePrompt: "I'm the SketchToolTemplate.", badgeIcon: Assets.add),
      TimerToolTemplate(
          allotment: Duration(seconds: 10),
          onFinish: () => {
                notificationMaster.sendAlertNotificationRequest(
                    "Timer finished!", Assets.apple)
              },
          templatePrompt: "I'm the TimerToolTemplate.",
          badgeIcon: Assets.add),
      VideoInputToolTemplate(
          templatePrompt: "I'm the VideoInputToolTemplate.",
          badgeIcon: Assets.add),
      GridCardSelectToolTemplate(
          templatePrompt: "I'm the .",
          badgeIcon: Assets.add,
          cardItems: ["Card 1", "Card 2", "Card 3"]),
      ListViewButtonSelectToolTemplate(
          listItems: {
            "I'll show you a notification.": () => {
                  notificationMaster.sendAlertNotificationRequest(
                      "Notification sent!", Assets.camera)
                },
            "I'll bring up an alert controller.": () => {
                  notificationMaster.sendAlertControllerRequest(
                      AlertControllerObject.singleAction(
                          onCancellation: () {
                            notificationMaster.resetRequests();
                          },
                          alertTitle: "Alert Controller!",
                          alertBody: "Hi!",
                          alertIcon: Assets.android,
                          actions: [
                        AlertControllerAction(
                            actionName: "Dismiss",
                            actionSeverity:
                                AlertControllerActionSeverity.standard,
                            onSelection: () => {})
                      ]))
                }
          },
          templatePrompt: "I'm the ListViewButtonSelectToolTemplate.",
          badgeIcon: Assets.add),
      ListViewPickerSelectToolTemplate(
          pickerOptions: [
            "List Item 1",
            "List Item 2",
            "List Item 3",
            "List Item 4"
          ],
          templatePrompt: "I'm the ListViewPickerSelectToolTemplate.",
          badgeIcon: Assets.add),
      YesNoButtonSelectToolTemplate(
          templatePrompt: "I'm the YesNoButtonSelectToolTemplate.",
          badgeIcon: Assets.add)
    ],
    nextSteps: {
      "Show an action bar": () => {},
      "Send a notification": () => {
            notificationMaster.sendAlertNotificationRequest(
                "Notification sent!", Assets.camera)
          },
    });
