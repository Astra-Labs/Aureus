// An observer pattern that links to the main scaffold
// of the container view in order to show alert controllers,
// in-app notifications, and more.

class AureusNotificationMaster {
  List<AureusNotificationObserver> _observers = [];

  void registerObserver(AureusNotificationObserver observer) {
    _observers.add(observer);
  }

  void unregisterObserver(AureusNotificationObserver observer) {
    _observers.remove(observer);
  }

  //Shows an alert controller over the container view.
  void sendAlertControllerRequest() {
    for (var observer in _observers) {
      observer.showAlertController();
    }
  }

  void sendContentWarningRequest() {
    for (var observer in _observers) {
      observer.showContentWarning();
    }
  }

  void sendAlertNotificationRequest() {
    print('notifying observers to show a drop-down notification.');
    for (var observer in _observers) {
      observer.showDropdownNotification();
    }
  }
}

mixin AureusNotificationObserver {
  void showAlertController() {}
  void showContentWarning() {}
  void showDropdownNotification() {}
}
