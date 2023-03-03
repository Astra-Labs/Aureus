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

  DataDetailView(
      {Key? key,
      required this.title,
      required this.detailCards,
      this.additionalDetails})
      : assert(detailCards.isNotEmpty == true,
            'Data Detail View requires cards to show data, and to allow the user to edit data.'),
        super(key: key);

  @override
  _DataDetailViewState createState() => _DataDetailViewState();
}

class _DataDetailViewState extends State<DataDetailView> {
  bool isEditing = false;

  void showEditingAlertController() {
    late AlertControllerObject alertControllerAction;

    var actionSheetDetails = [
      AlertControllerAction(
          actionName: isEditing == true ? "Finish editing" : "Start editing",
          actionSeverity: AlertControllerActionSeverity.standard,
          onSelection: updateEditingState)
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
    print("updating editing state!");

    setState(() {
      isEditing == true ? isEditing == false : isEditing == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> summaryItems = [];

    for (var element in widget.detailCards) {
      summaryItems.add(Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 25.0),
          child: isEditing == true
              ? element.returnEditDataCard()
              : element.returnReadDataCard()));
    }

    var pageHeaderElement = PageHeaderElement.withOptionsExit(
        pageTitle: widget.title,
        onPageExit: () => {
              Navigator.pop(context),
            },
        onPageDetails: () => {
              showEditingAlertController(),
            });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          pageHeaderElement,
          Column(children: summaryItems),
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

// summaryItems
