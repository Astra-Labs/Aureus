/// {@category Objects}
/// {@image <image alt='' src=''>}

// An observer pattern that all items in Aureus observe
// that's linked to a WidgetBindingObserver that redraws child
// items on size, accessibility, or platform brightness change.
class AureusResourceMaster {
  final List<AureusResourceObserver> _observers = [];

  void registerObserver(AureusResourceObserver observer) {
    _observers.add(observer);
  }

  void unregisterObserver(AureusResourceObserver observer) {
    _observers.remove(observer);
  }

  void notifyAccessibilityObservers() {
    for (var observer in _observers) {
      observer.updateAccessibilityLogic();
    }
  }

  void notifySafetyPlanObservers() {
    for (var observer in _observers) {
      observer.updateSafetyPlanLogic();
    }
  }

  void notifyPrivacyObservers() {
    for (var observer in _observers) {
      observer.updatePrivacyLogic();
    }
  }
}

mixin AureusResourceObserver {
  void updateAccessibilityLogic() {}
  void updateSafetyPlanLogic() {}
  void updatePrivacyLogic() {}
}
