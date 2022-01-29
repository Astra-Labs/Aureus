# Data Consent Objects
#### Last Updated: 1/20/2022
--------------------

### Description 

--------------------

#### Usage 

~~~

DataPermissionObject cameraObject = DataConsent().cameraAccessPermission(
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
() {
print('asking for camera!');
});

DataPermissionObject microphoneObject = DataConsent().cameraAccessPermission(
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
() {
print('asking for microphone!');
});

DataPermissionObject locationObject = DataConsent().cameraAccessPermission(
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
() {
print('asking for location!');
});

DataPermissionObject bluetoothObject = DataConsent().bluetoothAccessPermission(
'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
() {
print('asking for bluetooth!');
});

~~~