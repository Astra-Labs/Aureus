import 'package:aureus/aureus.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/* ------------------ DATA DETAIL -------------------- */

class DataDetail {
  /// The name of the detail item (e.g: contact name)
  final String detailName;

  /// Cards that show data and compose the greater detail object
  final List<DataDetailCard> detailCards;

  /// optional CTAs that show up as icon buttons below the detail cards
  Map<VoidCallback, Icon>? detailCTAs;

  DataDetail({
    required this.detailName,
    required this.detailCards,
    this.detailCTAs,
  });
}

/// An observer pattern that the DataDetailView uses to allow
/// users to edit / modify information within the view

class AureusDataDetailMaster {
  /// A list of data detail cards who are observing actions
  final List<AureusDataDetailObserver> _observers = [];

  /// Registering observers
  void registerObserver(AureusDataDetailObserver observer) {
    _observers.add(observer);
  }

  /// Unregistering observers
  void unregisterObserver(AureusDataDetailObserver observer) {
    _observers.remove(observer);
  }

  /// Telling each DD observer to update
  void notifyObserverToUpdate() {
    for (var observer in _observers) {
      observer.updateInformation();
    }
  }

  /// Telling each DD observer to delete
  void notifyObserverToDelete() {
    for (var observer in _observers) {
      observer.updateInformation();
    }
  }
}

/// A mix-in for implementation of conforming to become a Data Detail Observer
mixin AureusDataDetailObserver {
  void updateInformation() {}
  void deleteInformation() {}
}

/// A singleton for referring to the master.
var dataDetailMaster = AureusDataDetailMaster();

class DataDetailCard {
  /// The string describing what the data is

  final String dataLabel;

  const DataDetailCard({required this.dataLabel});

  /// Telling the master to make the observers update
  void editInformation() {
    dataDetailMaster.notifyObserverToUpdate();
  }

  /// A function that should return a read-only data card
  Widget returnReadDataCard() {
    throw ('Should be overriden by the child data detail card.');
  }

  /// A function that should return an edit-only data card.
  Widget returnEditDataCard() {
    throw ('Should be overriden by the child data detail card.');
  }
}
