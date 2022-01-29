import 'package:aureus/aureus.dart';

/*--------- LEVEL 0 --------*/
/*

Description: 
The top level class that contains all of the onboarding detail objects

Details:
-A minimum of 2 onboarding details are required to build an onboarding object. 

*/

class DataConsent {
  const DataConsent();

  DataPermissionObject cameraAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Camera',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.camera,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject microphoneAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Microphone',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.play,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject locationAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Location',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.location,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject bluetoothAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Bluetooth',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.settings,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject healthInformationAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Health Information',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.stethoscope,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject trackingAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Tracking',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.window,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject pushNotificationsAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Push Notifications',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.alertmessage,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject emailSubscriptionPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'E-mail Promotions',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.mail,
        onPermissionOptIn: onPermissionOptIn);
  }
}

/*--------- LEVEL 1 --------*/
/*

Description: 
The top level class that contains all of the onboarding detail objects

Details:
-A minimum of 2 onboarding details are required to build an onboarding object. 

*/

class DataPermissionObject {
  final String permissionName;
  final String permissionDescription;
  final IconData permissionIcon;
  final VoidCallback onPermissionOptIn;

  const DataPermissionObject(
      {required this.permissionName,
      required this.permissionDescription,
      required this.permissionIcon,
      required this.onPermissionOptIn});
}
