import 'package:aureus/aureus.dart';

/* ------------------ DATA DETAIL -------------------- */

class DataDetail {
  //The name of the detail item (e.g: contact name)
  // ------------------------------
  final String detailName;

  //Cards that show data and compose the greater detail object
  // ------------------------------
  final List<DataDetailCard> detailCards;

  //optional CTAs that show up as icon buttons below the detail cards
  // ------------------------------
  Map<VoidCallback, Icon>? detailCTAs;

  DataDetail({
    required this.detailName,
    required this.detailCards,
    this.detailCTAs,
  });
}

// An observer pattern that the DataDetailView uses to allow
// users to edit / modify information within the view

class AureusDataDetailMaster {
  final List<AureusDataDetailObserver> _observers = [];

  void registerObserver(AureusDataDetailObserver observer) {
    _observers.add(observer);
  }

  void unregisterObserver(AureusDataDetailObserver observer) {
    _observers.remove(observer);
  }

  void notifyObserverToUpdate() {
    for (var observer in _observers) {
      observer.updateInformation();
    }
  }

  void notifyObserverToDelete() {
    for (var observer in _observers) {
      observer.updateInformation();
    }
  }
}

mixin AureusDataDetailObserver {
  void updateInformation() {}
  void deleteInformation() {}
}

var dataDetailMaster = AureusDataDetailMaster();

class DataDetailCard {
  // The string describing what the data is
  // ------------------------------
  final String dataLabel;

  const DataDetailCard({required this.dataLabel});

  void editInformation() {
    dataDetailMaster.notifyObserverToUpdate();
  }

  Widget returnReadDataCard() {
    throw ('Should be overriden by the child data detail card.');
  }

  Widget returnEditDataCard() {
    throw ('Should be overriden by the child data detail card.');
  }
}
