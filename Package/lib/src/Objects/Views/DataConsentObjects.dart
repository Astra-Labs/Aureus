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
        permissionIcon: Icons.camera_outlined,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject microphoneAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Microphone',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.mic_external_on_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject locationAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Location',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.location_on_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject bluetoothAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Bluetooth',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.bluetooth_audio_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject healthInformationAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Health Information',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.health_and_safety_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject trackingAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Tracking',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.track_changes_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject pushNotificationsAccessPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'Push Notifications',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.notification_add_rounded,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject emailSubscriptionPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'E-mail Promotions',
        permissionDescription: permissionUsage,
        permissionIcon: Icons.email_rounded,
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
