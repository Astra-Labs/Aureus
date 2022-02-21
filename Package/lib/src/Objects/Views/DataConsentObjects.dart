import 'package:aureus/aureus.dart';
import 'package:permission_handler/permission_handler.dart';

/*---IMPORTANT---*/
/*
  The data consent objects request permissions across operating systems on your behalf, 
  and keep them managed. However, you must still go into the native codebase 
  for Android / iOS and manually input what permissions you will be asking for ahead
  of time, to avoid a crash. Read more about this on the permission handler documentation
  under setup here: https://pub.dev/packages/permission_handler 
*/

/*--------- DATA CONSENT --------*/
/*
*/

class DataConsent {
  const DataConsent();

  // checks permissions on behalf of the user, and runs code if enabled,
  // shows alert controller to user if not enabled.

  Future<void> consentHandler(VoidCallback onConsent, dataAccess item) async {
    switch (item) {
      case dataAccess.camera:
        {
          if (await Permission.camera.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.bluetooth:
        {
          if (await Permission.bluetooth.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.contacts:
        {
          if (await Permission.contacts.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.health:
        {
          if (await Permission.activityRecognition.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.location:
        {
          if (await Permission.location.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.microphone:
        {
          if (await Permission.microphone.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.photos:
        {
          if (await Permission.photos.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.pushNotifications:
        {
          if (await Permission.notification.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.tracking:
        {
          if (await Permission.appTrackingTransparency.request().isGranted) {
            onConsent();
          }
          break;
        }
      case dataAccess.sensors:
        {
          if (await Permission.sensors.request().isGranted) {
            onConsent();
          }
          break;
        }
    }
  }

  DataPermissionObject cameraAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Camera',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.camera,
        onPermissionOptIn: () => {Permission.camera.request()});
  }

  DataPermissionObject microphoneAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Microphone',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.play,
        onPermissionOptIn: () => {Permission.microphone.request()});
  }

  DataPermissionObject locationAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Location',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.location,
        onPermissionOptIn: () => {Permission.location.request()});
  }

  DataPermissionObject bluetoothAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Bluetooth',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.settings,
        onPermissionOptIn: () => {Permission.bluetooth.request()});
  }

  DataPermissionObject healthInformationAccessPermission(
      String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Health Information',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.stethoscope,
        onPermissionOptIn: () => {Permission.activityRecognition.request()});
  }

  DataPermissionObject trackingAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Tracking',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.window,
        onPermissionOptIn: () =>
            {Permission.appTrackingTransparency.request()});
  }

  DataPermissionObject pushNotificationsAccessPermission(
      String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Push Notifications',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.alertmessage,
        onPermissionOptIn: () => {Permission.notification.request()});
  }

  DataPermissionObject emailSubscriptionPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'E-mail Promotions',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.mail,
        onPermissionOptIn: onPermissionOptIn);
  }

  DataPermissionObject sensorsPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Device Sensors',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.mail,
        onPermissionOptIn: () => {Permission.sensors.request()});
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
