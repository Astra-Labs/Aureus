// An observer pattern that links to the main scaffold
// of the container view in order to show alert controllers,
// in-app notifications, and more.

import 'package:aureus/aureus.dart';

var notificationMaster = AureusNotificationMaster();

class AureusNotificationMaster {
  AureusNotificationObserver? _currentObserver;

  void registerObserver(AureusNotificationObserver observer) {
    print('registering observer');
    _currentObserver = observer;
  }

  void unregisterObserver(AureusNotificationObserver observer) {
    print('unregistering observer');
    _currentObserver = null;
  }

  void throwUnregisteredObserverError() {
    throw ("A current observer has not been registered.");
  }

  void resetRequests() {
    _currentObserver != null
        ? _currentObserver!.resetRequests()
        : throwUnregisteredObserverError();
  }

  //Shows an alert controller over the container view.
  void sendAlertControllerRequest(AlertControllerObject data) {
    // Checks that a current observer is registered before moving
    _currentObserver != null
        ? _currentObserver!.showAlertController(data)
        : throwUnregisteredObserverError();
  }

  // Shows a content warning request
  void sendContentWarningRequest(String description, IconData icon) {
    print('sending content warning request');

    _currentObserver != null
        ? _currentObserver!.showContentWarning(description, icon)
        : throwUnregisteredObserverError();
  }

  // Sends an alert notification request
  void sendAlertNotificationRequest(String description, IconData icon) {
    _currentObserver != null
        ? _currentObserver!.showDropdownNotification(description, icon)
        : throwUnregisteredObserverError();
  }

  void showBottomActionController(AlertControllerObject data) {
    _currentObserver != null
        ? _currentObserver!.showBottomActionController(data)
        : throwUnregisteredObserverError();
  }
}

mixin AureusNotificationObserver {
  void resetRequests() {}
  void showAlertController(AlertControllerObject data) {}
  void showContentWarning(String description, IconData icon) {}
  void showDropdownNotification(String description, IconData icon) {}
  void showBottomActionController(AlertControllerObject data) {}
}
