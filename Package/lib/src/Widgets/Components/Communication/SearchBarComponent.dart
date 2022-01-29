import 'package:aureus/aureus.dart';

class SearchBarComponent extends StatefulWidget {
  final VoidCallback onSearch;

  const SearchBarComponent({required this.onSearch});

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  TextEditingController searchBarController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();

    return Container(
      constraints: BoxConstraints(
          minHeight: size.layoutItemHeight(6, screenSize),
          maxHeight: size.layoutItemHeight(5, screenSize),
          minWidth: size.layoutItemWidth(1, screenSize),
          maxWidth: size.layoutItemWidth(1, screenSize)),
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            SingleDataTypeUserInputElement(dataPlaceholder: 'Search here.'),
            SizedBox(width: 10),
            SecondaryIconButtonElement(
                buttonIcon: Icons.search,
                buttonAction: widget.onSearch,
                buttonTooltip: 'Search Button',
                decorationVariant: decorationPriority.important)
          ]),
    );
  }
}
