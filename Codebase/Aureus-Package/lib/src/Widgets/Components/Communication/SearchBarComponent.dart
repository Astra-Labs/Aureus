import 'package:aureus/aureus.dart';

//A text input and search button that constitutes a search bar
//Doc Link:

class SearchBarComponent extends StatefulWidget {
  final VoidCallback onSearch;
  final modeVariants barVariant;

  const SearchBarComponent({required this.onSearch, required this.barVariant});

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  @override
  Widget build(BuildContext context) {
    BoxDecoration searchBarBackingDecoration = BoxDecoration();
    Color textColor = foundation.black();

    if (widget.barVariant == modeVariants.light) {
      searchBarBackingDecoration = BoxDecoration(
        border: foundation.universalBorder(),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: foundation.ice(),
      );
      textColor = foundation.carbon();
    } else if (widget.barVariant == modeVariants.dark) {
      searchBarBackingDecoration = BoxDecoration();
      textColor = foundation.melt();
    }

    return AspectRatio(
        aspectRatio: 585 / 73,
        child: Container(
            width: 585,
            height: 73,
            child: Row(children: [
              Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    border: foundation.universalBorder(),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: foundation.ice(),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: TextFormField(
                        style: foundation.heading2().copyWith(color: textColor),
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
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: foundation.mediumGradient(),
                      border: foundation.universalBorder()),
                  width: 73.0,
                  height: 73.0,
                  child: Expanded(
                      child: IconButton(
                          icon: Image.asset(''),
                          iconSize: 50,
                          color: foundation.black(),
                          tooltip: 'Search Button',
                          onPressed: widget.onSearch)))
            ])));
  }
}
