import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Elements}
/// {@image <image alt='' src=''>}

/*--------- BASE DATA DETAIL CARD ----------*/

/// The base class for a Base Data Detail Card.
/// A detail card is a UI element meant for writing and reading values. These
/// are accessed within a [DataDetailView] only.

class BaseDataDetailCard extends StatefulWidget {
  /// Whether or not the card is actively being edited. This is managed by
  /// [DataDetailView]
  final bool isBeingEdited;

  /// What the 'title' of the detail card is.
  final String detailLabel;

  /// What the children of the card are.
  final List<Widget> detailChildren;

  const BaseDataDetailCard(
      {required this.isBeingEdited,
      required this.detailLabel,
      required this.detailChildren});

  @override
  _BaseDataDetailCardState createState() => _BaseDataDetailCardState();
}

class _BaseDataDetailCardState extends State<BaseDataDetailCard> {
  @override
  Widget build(BuildContext context) {
    //checks if widget is actively engaged, and returns proper layout.
    return FloatingContainerElement(
        child: Container(
            decoration: CardBackingDecoration(
                    decorationVariant: widget.isBeingEdited == true
                        ? decorationPriority.standard
                        : decorationPriority.standard)
                .buildBacking(),
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BodyTwoText(widget.detailLabel, decorationPriority.standard),
                  const SizedBox(height: 10.0),
                  Column(children: widget.detailChildren),
                ],
              ),
            )));
  }
}
