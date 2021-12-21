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
  @override
  Widget build(BuildContext context) {
    BoxDecoration barBackingDecoration =
        LayerBackingDecoration(priority: decorationPriority.standard)
            .buildBacking();

    return Container(
        width: 585,
        height: 73,
        child: Row(children: [
          Container(
              decoration: barBackingDecoration,
              child: Center(
                  child: Padding(
                padding: size.universalPadding(),
                child: TextFormField(
                    style: foundation
                        .heading2()
                        .copyWith(color: coloration.contrastColor()),
                    maxLines: 1,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: foundation.body1(),
                        hintText: 'Search here.'),
                    autocorrect: false,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text),
              ))),
          Container(
              alignment: Alignment.centerRight,
              padding: size.universalPadding(),
              decoration: ButtonBackingDecoration(
                      priority: decorationPriority.important,
                      variant: buttonDecorationVariants.circle)
                  .buildBacking(),
              child: Expanded(
                  child: IconButton(
                      icon: Image.asset(''),
                      iconSize: 50,
                      color: coloration.sameColor(),
                      tooltip: 'Search Button',
                      onPressed: widget.onSearch)))
        ]));
  }
}
