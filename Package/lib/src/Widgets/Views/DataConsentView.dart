import 'package:aureus/aureus.dart';

//
//Doc Link:

class DataOptInView extends StatefulWidget {
  final List<DataPermissionObject> permissionItems;

  const DataOptInView({required this.permissionItems});

  @override
  _DataOptInViewState createState() => _DataOptInViewState();
}

class _DataOptInViewState extends State<DataOptInView> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.stackScroll,
      children: [
        DividingHeaderElement(
            headerText: 'Data Opt In',
            subheaderText:
                'Your consent is important to us. Please review the permissions below that we would like to have access to.'),
        ListView.builder(
            physics: ClampingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: widget.permissionItems.length,
            itemBuilder: (BuildContext context, int index) {
              var currentItem = widget.permissionItems[index];

              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                child: ComplexSwitchCardElement(
                    cardLabel: currentItem.permissionName,
                    cardBody: currentItem.permissionDescription,
                    cardIcon: currentItem.permissionIcon),
              );
            }),
        Align(
          alignment: Alignment.bottomRight,
          child: PrimaryIconButtonElement(
              decorationVariant: decorationPriority.important,
              buttonIcon: Assets.next,
              buttonTooltip: 'Go to next page',
              buttonAction: () => {print("go to next!")}),
        )
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
