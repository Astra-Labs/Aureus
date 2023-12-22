// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- POETRY GRADIENT VIEW ----------*/
/// A view that animates gradients and noise, while scrolling through a poem.
/// This is an 'Easter Egg' Astra uses to hide poems within our resources for a
/// better user experience.

class TransmissionView extends StatefulWidget {
  /// A List with the strings that make up a poem.
  final List<Gradient> gradientArray;
  final VoidCallback onTransmissionSend;
  String transmission;

  TransmissionView({
    required this.gradientArray,
    required this.onTransmissionSend,
    required this.transmission,
  });

  @override
  _TransmissionViewState createState() => _TransmissionViewState();
}

class _TransmissionViewState extends State<TransmissionView> {
  late Map<Widget, Gradient> gradientSelections;

  @override
  void initState() {
    super.initState();
    var gradients = widget.gradientArray;

    for (var element in gradients) {
      var circle = Container();

      gradientSelections[circle] = element;
    }
  }

  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen, children: const []);

    return ContainerView(
      decorationVariant: decorationPriority.important,
      builder: viewLayout,
      hasBackgroundImage: false,
      takesFullWidth: false,
      showQuickActionBar: false,
    );
  }
}
