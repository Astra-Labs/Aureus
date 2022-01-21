import 'package:aureus/aureus.dart';

//A text input and search button that constitutes a search bar
//Doc Link:

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
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(6.0),
            child: StandardTextFieldComponent(
                decorationVariant: decorationPriority.standard,
                hintText: 'Search here.',
                textFieldController: searchBarController),
          ),
          Padding(
            padding: EdgeInsets.all(6.0),
            child: SecondaryIconButtonElement(
                buttonIcon: Icons.search,
                buttonAction: widget.onSearch,
                buttonTooltip: 'Search Button',
                decorationVariant: decorationPriority.important),
          )
        ]);
  }
}
