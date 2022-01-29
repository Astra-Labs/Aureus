// An observer pattern that all items in Aureus observe
// that's linked to a WidgetBindingObserver that redraws child
// items on size, accessibility, or platform brightness change.

class AureusResourceMaster {
  List<AureusResourceObserver> _observers = [];

  void registerObserver(AureusResourceObserver observer) {
    print('observer registered');
    _observers.add(observer);
  }

  void unregisterObserver(AureusResourceObserver observer) {
    print('observer unregistered :-(');
    _observers.remove(observer);
  }

  void notifyObservers() {
    print('notifying observers');
    for (var observer in _observers) {
      observer.updateEnvironment();
    }
  }
}

mixin AureusResourceObserver {
  void updateEnvironment();
}
