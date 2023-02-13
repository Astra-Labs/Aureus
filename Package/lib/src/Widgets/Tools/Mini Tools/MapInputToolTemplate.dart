import 'package:aureus/aureus.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

/*--------- MAP INPUT TOOL ----------*/

/*
-------------------------------
IN BETA DEVELOPMENT - DO NOT USE
-------------------------------
*/

class MapInputToolTemplate extends ToolCardTemplate {
  MapInputToolTemplate({required templatePrompt, required badgeIcon})
      : super(templatePrompt: templatePrompt, badgeIcon: badgeIcon);

  // Array that holds the values neccessary to read
  // and write what a user entered into the prompt card
  // for display purposes. Write to dataMap in ActiveCard,
  // and read in SummaryCard.
  var dataMap = [];

  @override
  Widget returnActiveToolCard() {
    return BaseCardToolTemplate(
        isActive: true,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          const _MapInputCard(),
          const SizedBox(height: 20.0),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                SmolButtonElement(
                    decorationVariant: decorationPriority.important,
                    buttonTitle: 'Next',
                    buttonHint: 'Goes to the next card',
                    buttonAction: () => {onNextCard()}),
              ]),
        ]);
  }

  @override
  Widget returnTemplateSummary() {
    return BaseCardToolTemplate(
        isActive: false,
        cardIcon: badgeIcon,
        toolPrompt: templatePrompt,
        toolChildren: [
          BodyTwoText('Selected a location with Map Input tool.',
              decorationPriority.standard)
        ]);
  }
}

class _MapInputCard extends StatefulWidget {
  const _MapInputCard();

  @override
  _MapInputCardState createState() => _MapInputCardState();
}

class _MapInputCardState extends State<_MapInputCard> {
  @override
  Widget build(BuildContext context) {
    var screenSize = size.logicalScreenSize();
    return SizedBox(
      width: size.layoutItemWidth(1, screenSize),
      height: size.layoutItemHeight(2, screenSize),
      child: Container(
        decoration: BoxDecoration(border: palette.universalBorder()),
        child: FlutterMap(
          options: MapOptions(
            bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
            boundsOptions: const FitBoundsOptions(padding: EdgeInsets.all(8.0)),
          ),
          layers: [
            TileLayerOptions(
                urlTemplate:
                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
                attributionBuilder: (_) {
                  return const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TabSubheaderElement(
                      title: "© OpenStreetMap contributors",
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
