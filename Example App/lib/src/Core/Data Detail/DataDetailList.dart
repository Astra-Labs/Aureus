part of AureusTestingApp;

// These UI components are under development, so are not public for use
// as of right now.

class DataDetailList {
  var addressCard = AddressDataCardElement(
    dataLabel: "Address",
    onFinishEditing: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Done editing address", Assets.body),
    },
  );

  /* var photoCard = PhotoDataCardElement(
    Image.network(
        'https://images.unsplash.com/photo-1526934709557-35f3777499c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2069&q=80'),
    dataLabel: "Photo",
    onFinishEditing: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Done editing photo", Assets.body),
    },
  ); */

  var textFieldCard = TextFieldDataCardElement(
    dataLabel: "Text Field",
    textEditingController: TextEditingController(),
    onFinishEditing: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Done editing text field", Assets.body),
    },
  );

  var textViewCard = TextViewDataCardElement(
      dataLabel: "Text View",
      onFinishEditing: () => {
            notificationMaster.sendAlertNotificationRequest(
                "Done editing text view", Assets.body),
          },
      textEditingController: TextEditingController());

  var promptListCard = PromptSelectionCardList(
    dataLabel: "Prompt List",
    isMutuallyExclusive: false,
    onFinishEditing: () => {},
    allOptions: [
      "It's me",
      "Hi",
      "I'm the problem",
      "It's me!",
    ],
    selectedOptions: [
      "I'm the problem",
    ],
  );

  var timerCard = TimePickerDataCardElement(
      dataLabel: "Date",
      onFinishEditing: () => {},
      mode: CupertinoDatePickerMode.date);

  /* var videoCard = VideoRecordingDataCardElement(
    dataLabel: "Video Card",
    onFinishEditing: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Done editing video", Assets.camera),
    },
  );

  var voiceRecordingCard = VoiceRecordingDataCardElement(
    dataLabel: "Voice Recording",
    onFinishEditing: () => {
      notificationMaster.sendAlertNotificationRequest(
          "Done editing video", Assets.camera),
    },
  );*/
}
