import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class DataDetailView extends StatefulWidget {
  final String title;
  final List<ToolCardTemplate> detailCards;
  DataDetailView({Key? key, required this.title, required this.detailCards})
      : assert(detailCards.isNotEmpty == true,
            'Data Detail View requires cards to show data, and to allow the user to edit data.'),
        super(key: key);

  @override
  _DataDetailViewState createState() => _DataDetailViewState();
}

class _DataDetailViewState extends State<DataDetailView> {
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    List<Widget> summaryItems = [];

    for (var element in widget.detailCards) {
      summaryItems.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
        child: element.returnTemplateSummary(),
      ));
    }

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
        containerVariant: wrapperVariants.stackScroll,
        children: [
          Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  PageHeaderElement.withExit(
                      pageTitle: '${widget.title}',
                      onPageExit: () => {Navigator.pop(context)}),
                  const SizedBox(height: 20),
                  const DividerElement(),
                  const SizedBox(height: 20),
                  Column(
                    children: summaryItems,
                  ),
                ]),
          )
        ]);

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
