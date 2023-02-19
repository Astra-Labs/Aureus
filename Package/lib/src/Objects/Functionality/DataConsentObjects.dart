import 'package:aureus/aureus.dart';
import 'package:permission_handler/permission_handler.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// The data consent objects request permissions across operating systems on your behalf,
/// and keep them managed. However, you must still go into the native codebase
/// for Android / iOS and manually input what permissions you will be asking for ahead
/// of time, to avoid a crash. Read more about this on the permission handler documentation
/// under setup here: https://pub.dev/packages/permission_handler

/*--------- DATA CONSENT --------*/
/// A class that manages Data consent objects
class DataConsent {
  const DataConsent();

  /// A function that checks permissions on behalf of the user, and runs code if enabled,
  /// shows alert controller to user if not enabled.

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

  /// A DPO that represents camera access.
  DataPermissionObject cameraAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Camera',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.camera,
        onPermissionOptIn: () => {Permission.camera.request()});
  }

  /// A DPO that represents microphone access.
  DataPermissionObject microphoneAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Microphone',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.play,
        onPermissionOptIn: () => {Permission.microphone.request()});
  }

  /// A DPO that represents location access.
  DataPermissionObject locationAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Location',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.location,
        onPermissionOptIn: () => {Permission.location.request()});
  }

  /// A DPO that represents bluetooth access.
  DataPermissionObject bluetoothAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Bluetooth',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.settings,
        onPermissionOptIn: () => {Permission.bluetooth.request()});
  }

  /// A DPO that represents health information access.
  DataPermissionObject healthInformationAccessPermission(
      String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Health Information',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.stethoscope,
        onPermissionOptIn: () => {Permission.activityRecognition.request()});
  }

  /// A DPO that represents tracking access.
  DataPermissionObject trackingAccessPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Tracking',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.window,
        onPermissionOptIn: () =>
            {Permission.appTrackingTransparency.request()});
  }

  /// A DPO that represents push notification access.
  DataPermissionObject pushNotificationsAccessPermission(
      String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Push Notifications',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.alertmessage,
        onPermissionOptIn: () => {Permission.notification.request()});
  }

  /// A DPO that represents email subscription access.
  DataPermissionObject emailSubscriptionPermission(
      String permissionUsage, VoidCallback onPermissionOptIn) {
    return DataPermissionObject(
        permissionName: 'E-mail Promotions',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.mail,
        onPermissionOptIn: onPermissionOptIn);
  }

  /// A DPO that represents sensor data access.
  DataPermissionObject sensorsPermission(String permissionUsage) {
    return DataPermissionObject(
        permissionName: 'Device Sensors',
        permissionDescription: permissionUsage,
        permissionIcon: Assets.mail,
        onPermissionOptIn: () => {Permission.sensors.request()});
  }
}

/// A class that represents the metadata of a Data Permission Object.

class DataPermissionObject {
  /// What the name of the permission is
  final String permissionName;

  /// The description of what you're asking for access of.
  final String permissionDescription;

  /// An icon that describes the permission
  final IconData permissionIcon;

  /// A function that should be called when the user opts in
  final VoidCallback onPermissionOptIn;

  const DataPermissionObject(
      {required this.permissionName,
      required this.permissionDescription,
      required this.permissionIcon,
      required this.onPermissionOptIn});
}
