// ignore_for_file: must_be_immutable

import 'package:aureus/aureus.dart';

/// @nodoc
import 'package:flutter/material.dart';

/// {@category Widgets}
/// {@subCategory Views}
/// {@image <image alt='' src=''>}

/*--------- DATA DETAIL VIEW ----------*/
/// A data detail view is similar to using [CoreTool]s. Use a data detail view
/// when a user is opening up a read/write object. This can be anything from a user
/// settings page, to a contact page, or a log page.
///
/// The data detail view manages the reading / editing states of the detail cards,
/// so you just have to read / write from a database.

class DataDetailView extends StatefulWidget {
  /// The title of the detail view. E.G: A contact name, 'Settings', etc.
  final String title;

  /// A list of data detail cards to show to the user.
  final List<DataDetailCard> detailCards;

  /// A map of additional titles and actions to show on the BottomActionSheet
  /// when the user presses for additional details.
  ///
  /// If you want to enable functionality like sharing an item, or adding it to
  /// favorites, this would be the place to put that stuff.
  final Map<String, VoidCallback>? additionalDetails;

  /// If you want to make any changes when the page exits, this is the
  /// place to do so. For example, saving the edited item to a storage layer,
  /// finishing up networking stuff, etc.
  VoidCallback? onPageExit;

  DataDetailView(
      {Key? key,
      required this.title,
      required this.detailCards,
      this.additionalDetails,
      this.onPageExit})
      : assert(detailCards.isNotEmpty == true,
            'Data Detail View requires cards to show data, and to allow the user to edit data.'),
        super(key: key);

  @override
  _DataDetailViewState createState() => _DataDetailViewState();
}

class _DataDetailViewState extends State<DataDetailView> {
  ValueNotifier<bool> isEditing = ValueNotifier<bool>(false);

  void showEditingAlertController() {
    late AlertControllerObject alertControllerAction;

    var actionSheetDetails = [
      AlertControllerAction(
          actionName:
              isEditing.value == true ? "Finish editing" : "Start editing",
          actionSeverity: AlertControllerActionSeverity.standard,
          onSelection: () => {
                updateEditingState(),
                notificationMaster.resetRequests(),
              })
    ];

    if (widget.additionalDetails != null) {
      widget.additionalDetails!.forEach(
        (detailTitle, detailAction) {
          actionSheetDetails.add(
            AlertControllerAction(
                actionName: detailTitle,
                actionSeverity: AlertControllerActionSeverity.standard,
                onSelection: detailAction),
          );

          alertControllerAction = AlertControllerObject.multipleActions(
            onCancellation: () => {},
            alertTitle: "What would you like to do?",
            alertBody: "Select an option below.",
            alertIcon: Assets.alertmessage,
            actions: actionSheetDetails,
          );
        },
      );
    } else if (widget.additionalDetails == null) {
      alertControllerAction = AlertControllerObject.singleAction(
        onCancellation: () => {},
        alertTitle: "What would you like to do?",
        alertBody: "Select an option below.",
        alertIcon: Assets.alertmessage,
        actions: actionSheetDetails,
      );
    }

    notificationMaster.showBottomActionController(alertControllerAction);
  }

  void updateEditingState() {
    setState(() {
      if (isEditing.value == true) {
        isEditing = ValueNotifier<bool>(false);
      } else {
        isEditing = ValueNotifier<bool>(true);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> summaryItems = [];

    for (var element in widget.detailCards) {
      summaryItems.add(Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25.0),
          child: isEditing.value == true
              ? element.returnEditDataCard()
              : element.returnReadDataCard()));
    }

    var listener = ValueListenableBuilder<bool>(
        builder: (BuildContext context, bool value, Widget? child) {
          List<Widget> summaryItems = [];

          for (var element in widget.detailCards) {
            summaryItems.add(Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25.0),
                child: value == true
                    ? element.returnEditDataCard()
                    : element.returnReadDataCard()));
          }

          return Column(children: summaryItems);
        },
        valueListenable: isEditing);

    var pageHeaderElement = PageHeaderElement.withOptionsExit(
        pageTitle: widget.title,
        onPageExit: () => {
              if (widget.onPageExit != null) {widget.onPageExit!()},
              Navigator.pop(context),
            },
        onPageDetails: () => {
              showEditingAlertController(),
            });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          pageHeaderElement,
          const DividerElement(),
          const SizedBox(height: 10),
          listener,
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

// summaryItems
