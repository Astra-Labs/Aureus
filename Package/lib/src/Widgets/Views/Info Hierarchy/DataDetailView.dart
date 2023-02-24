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

  DataDetailView({Key? key, required this.title, required this.detailCards})
      : assert(detailCards.isNotEmpty == true,
            'Data Detail View requires cards to show data, and to allow the user to edit data.'),
        super(key: key);

  @override
  _DataDetailViewState createState() => _DataDetailViewState();
}

class _DataDetailViewState extends State<DataDetailView> {
  bool isEditing = false;

  void updateEditingState() {
    setState(() {
      isEditing ? isEditing == false : isEditing == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> summaryItems = [];

    for (var element in widget.detailCards) {
      summaryItems.add(Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
          child: isEditing == true
              ? element.returnEditDataCard()
              : element.returnReadDataCard()));
    }

    var screenSize = size.logicalScreenSize();

    var pageHeaderElement = PageHeaderElement.withOptionsExit(
        pageTitle: widget.title,
        onPageExit: () => {Navigator.pop(context)},
        onPageDetails: () => {
              notificationMaster.showBottomActionController(
                  AlertControllerObject.singleAction(
                      onCancellation: () => {},
                      alertTitle: "What would you like to do?",
                      alertBody: "Select an option below.",
                      alertIcon: Assets.alertmessage,
                      actions: [
                    AlertControllerAction(
                        actionName:
                            isEditing ? "Finish editing" : "Start editing",
                        actionSeverity: AlertControllerActionSeverity.standard,
                        onSelection: updateEditingState)
                  ]))
            });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          pageHeaderElement,
          SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemWidth(1, screenSize),
              child:
                  SingleChildScrollView(child: Column(children: summaryItems)))
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

// summaryItems
