import 'package:aureus/aureus.dart';

/*

DESCRIPTION: 
-------------------
USAGE: 

*/

class PulseInputToolTemplate extends ToolCardTemplate {
  PulseInputToolTemplate()
      : super(templatePrompt: 'Pulse Input', badgeIcon: IconData(0));

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          SizedBox(height: 10.0),
          BodyOneText(
              'Press each colorful dot to disable it, and to move forward.',
              decorationPriority.standard),
          SizedBox(height: 20.0),
          _PulseMapCard()
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Used the Pulse Input tool', decorationPriority.standard)
        ]);
  }
}

class _PulseMapCard extends StatefulWidget {
  final List<List<int>> mapPattern1 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];

  final List<List<int>> mapPattern2 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];

  final List<List<int>> mapPattern3 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];
  final List<List<int>> mapPattern4 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];
  final List<List<int>> mapPattern5 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];
  final List<List<int>> mapPattern6 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];
  final List<List<int>> mapPattern7 = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0]
  ];
  final List<List<int>> mapPattern8 = [
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1],
    [1, 0, 1, 0, 1, 0, 1]
  ];
  final List<List<int>> mapPattern9 = [
    [1, 0, 0, 0, 0, 0, 1],
    [0, 1, 0, 0, 0, 1, 0],
    [0, 0, 1, 0, 1, 0, 0],
    [0, 0, 0, 1, 0, 0, 0],
    [0, 0, 1, 0, 1, 0, 0],
    [0, 1, 0, 0, 0, 1, 0],
    [1, 0, 0, 0, 0, 0, 1]
  ];
  final List<List<int>> mapPattern10 = [
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1],
    [0, 1, 0, 1, 0, 1, 0],
    [1, 0, 1, 0, 1, 0, 1]
  ];

  _PulseMapCard();

  @override
  _PulseMapCardState createState() => _PulseMapCardState();
}

class _PulseMapCardState extends State<_PulseMapCard> {
  VoidCallback pulseDot = () => {};

  @override
  Widget build(BuildContext context) {
    //from 0-7 on the X-axis (horizontal) where the dot is
    int xIndex = 0;
    //from 0-7 on the Y-axis (vertical) where the dot is
    int yIndex = 0;

    List<List<int>> selectedMapPattern = widget.mapPattern10;

    var activeDot = Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: coloration.accentColor(),
                shape: BoxShape.circle,
                boxShadow: [pastelShadow()])));

    var inactiveDot = Padding(
        padding: EdgeInsets.all(7.0),
        child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: coloration.inactiveColor(), shape: BoxShape.circle)));

    //  Creates a matrixed for each loop that generates pulse map based on
    //  selected mapping pattern.

    var currentRow = [];
    List<Row> gridColumns = [];

    selectedMapPattern.forEach((element) {
      xIndex = 0;
      currentRow = selectedMapPattern[yIndex];

      List<Widget> tempDotHolding = [];

      element.forEach((element) {
        if (currentRow[xIndex] == 1) {
          // is the active dot
          tempDotHolding.add(activeDot);
        } else if (currentRow[xIndex] == 0) {
          // is an inactive dot
          tempDotHolding.add(inactiveDot);
        }

        xIndex += 1;
      });

      gridColumns.add(Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: tempDotHolding));

      yIndex += 1;
    });

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: gridColumns,
      ),
    );
  }
}
