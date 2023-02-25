part of AureusTestingApp;

//FILLER DATA
var fillerTextHeader = 'Header';
var fillerTextSubheader = 'Subheader';
var fillerTextBody =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
var fillerTextButton = 'Press here.';
var fillerTextAlert = 'Action completed.';
var fillerTextMissionLabel = 'How can I help?';
var fillerTextCardName = 'Card Item';
var fillerPlaceholder = 'Item';

var fillerIcon1 = Icons.abc;
var fillerIcon2 = Icons.view_day;
var fillerIcon3 = Icons.accessible;
var fillerIcon4 = Icons.balance_sharp;
var fillerIcon5 = Icons.dangerous;

var fillerLabels = ['Label 1', 'Label 2', 'Label 3', 'Label 4', 'Label 5'];
var fillerIcons = [
  fillerIcon1,
  fillerIcon2,
  fillerIcon3,
  fillerIcon4,
  fillerIcon5
];

void fillerAction() {
  notificationMaster.sendAlertNotificationRequest(
      "Filler action completed.", Icons.ac_unit);
}
