import 'package:flutter/material.dart';

/// An object that contains all of the metadata for a small
/// set of buttons to appear on the bottom of a [DataDetailView] page.

class DataDetailCTA {
  /// An icon that shows up to represent an action.
  final IconData icon;

  /// A 'hint' about what taking the action will do. E.G: call someone, email someone.
  final String hint;

  /// The action to take when the user presses the button.
  final VoidCallback action;

  const DataDetailCTA({
    required this.icon,
    required this.hint,
    required this.action,
  });
}
