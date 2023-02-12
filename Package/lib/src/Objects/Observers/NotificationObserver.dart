// An observer pattern that links to the main scaffold
// of the container view in order to show alert controllers,
// in-app notifications, and more.

import 'package:aureus/aureus.dart';

var notificationMaster = AureusNotificationMaster();

class AureusNotificationMaster {
  final List<AureusNotificationObserver> _observers = [];

  void registerObserver(AureusNotificationObserver observer) {
    print('registering observer');
    print('-----------------------------------');
    _observers.add(observer);
  }

  void unregisterObserver(AureusNotificationObserver observer) {
    print('unregistering observer');
    print('-----------------------------------');
    observer.resetRequests();
    _observers.remove(observer);
  }

  void resetRequests() {
    print('removes requests');
    print('-----------------------------------');
    for (var observer in _observers) {
      observer.resetRequests();
    }
  }

  //Shows an alert controller over the container view.
  void sendAlertControllerRequest(AlertControllerObject data) {
    print('sending alert controller request');
    print('observers are $_observers');
    for (var observer in _observers) {
      observer.showAlertController(data);
    }
  }

  void sendContentWarningRequest(String description, IconData icon) {
    print('sending content warning request');
    print('observers are $_observers');
    for (var observer in _observers) {
      observer.showContentWarning(description, icon);
    }
  }

  void sendAlertNotificationRequest(String description, IconData icon) {
    print('sending notification request');
    print('observers are $_observers');
    for (var observer in _observers) {
      observer.showDropdownNotification(description, icon);
    }
  }

  void showBottomActionController(AlertControllerObject data) {
    print('notifying observers to show bottom sheet.');
    for (var observer in _observers) {
      observer.showBottomActionController(data);
    }
  }
}

mixin AureusNotificationObserver {
  void resetRequests() {}
  void showAlertController(AlertControllerObject data) {}
  void showContentWarning(String description, IconData icon) {}
  void showDropdownNotification(String description, IconData icon) {}
  void showBottomActionController(AlertControllerObject data) {}
}
