import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class DataDetailView extends StatefulWidget {
  final String title;
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

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.fullScreen,
        children: [
          PageHeaderElement.withOptionsExit(
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
                              actionName: isEditing
                                  ? "Finish editing"
                                  : "Start editing",
                              actionSeverity:
                                  AlertControllerActionSeverity.standard,
                              onSelection: updateEditingState)
                        ]))
                  }),
          SizedBox(
              width: size.layoutItemWidth(1, screenSize),
              height: size.layoutItemWidth(1, screenSize),
              child: SingleChildScrollView(
                  child: Column(
                children: const [
                  BaseDataDetailCard(
                    detailLabel: "Bitch ???",
                    detailChildren: [],
                    isBeingEdited: false,
                  ),
                  SizedBox(height: 20),
                  BaseDataDetailCard(
                    detailLabel: "Bitch ???",
                    detailChildren: [],
                    isBeingEdited: false,
                  )
                ],
              )))
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}

// summaryItems
