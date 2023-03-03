/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/* ------------------ DATA DETAIL -------------------- */
/// Object that is meant to act as the main data structure for a [DataDetailView].
/// This contains the title, the detail cards for writing / reading, and any
/// CTAs to perform additional actions.

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

  /// Telling each DD observer to update into Read
  void notifyObserverToUpdate() {
    for (var observer in _observers) {
      observer.updateInformation();
    }
  }

  /// Telling each DD observer to update into Read
  void notifyObserverToFinish() {
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
  void finishSavingInformation() {}
  void deleteInformation() {}
}

/// A singleton for referring to the master.
var dataDetailMaster = AureusDataDetailMaster();

/// The base class for a detail cards that adheres to the [AureusDataDetailObserver].
class DataDetailCard {
  /// The string describing what the data is
  final String dataLabel;

  /// Any code that should run when the user finishes editing the field.
  /// This should be where your logic code that modifies a DB entry / object goes.
  final VoidCallback onFinishEditing;

  const DataDetailCard(
      {required this.dataLabel, required this.onFinishEditing});

  /// Telling the master to make the observers update
  void editInformation() {
    dataDetailMaster.notifyObserverToUpdate();
  }

  /// Telling the master to make the observers run the 'onFinishEditing' function
  void saveInformation() {
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
