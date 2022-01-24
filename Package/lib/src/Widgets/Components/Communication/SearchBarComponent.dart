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
    return SizedBox(
      width: size.layoutItemWidth(1, size.logicalScreenSize),
      height: size.layoutItemHeight(6, size.logicalScreenSize),
      child: Center(
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              FloatingContainerElement(
                child: SizedBox(
                  width: size.layoutItemWidth(1, size.logicalScreenSize) * 0.85,
                  height: size.layoutItemHeight(6, size.logicalScreenSize),
                  child: TextFormField(
                      style: body2().copyWith(
                          color: coloration.decorationColor(
                              decorationVariant: decorationPriority.standard)),
                      controller: searchBarController,
                      decoration: InputDecoration(
                          fillColor: coloration.inactiveColor(),
                          filled: true,
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: lavender(), width: 1.0)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: coloration
                                      .decorationColor(
                                          decorationVariant:
                                              decorationPriority.standard)
                                      .withOpacity(0.3),
                                  width: 1.0)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(255, 178, 178, 1.0),
                                  width: 1.0)),
                          disabledBorder: InputBorder.none,
                          hintStyle: body2().copyWith(
                              color:
                                  coloration.contrastColor().withOpacity(0.7)),
                          hintText: 'Search here.'),
                      autocorrect: false,
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text),
                ),
              ),
              SecondaryIconButtonElement(
                  buttonIcon: Icons.search,
                  buttonAction: widget.onSearch,
                  buttonTooltip: 'Search Button',
                  decorationVariant: decorationPriority.important)
            ]),
      ),
    );
  }
}
