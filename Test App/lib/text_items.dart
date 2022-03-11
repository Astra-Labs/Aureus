import 'package:aureus/aureus.dart';

//where all text related items in aureus are initiated for testing

SelectableText text1 =
    HeadingOneText('Heading One', decorationPriority.standard);
SelectableText text2 =
    HeadingTwoText('Heading Two', decorationPriority.standard);
SelectableText text3 =
    HeadingThreeText('Heading Three', decorationPriority.standard);
SelectableText text4 =
    HeadingFourText('Heading Four', decorationPriority.standard);
SelectableText text5 = SubheaderText('Subheader', decorationPriority.standard);
SelectableText text6 = BodyOneText('Body One', decorationPriority.standard);
SelectableText text7 = BodyTwoText('Body Two', decorationPriority.standard);
SelectableText text8 = ButtonOneText('Button One', decorationPriority.standard);
SelectableText text9 = ButtonTwoText('Button Two', decorationPriority.standard);
SelectableText text10 = TagOneText('Tag One', decorationPriority.standard);
SelectableText text11 = TagTwoText('Tag Two', decorationPriority.standard);

List<SelectableText> textTesting = [
  text1,
  text2,
  text3,
  text4,
  text5,
  text6,
  text7,
  text8,
  text9,
  text10,
  text11
];

//12 options
var textTestListView = ListView.separated(
  padding: const EdgeInsets.all(8),
  shrinkWrap: true,
  itemCount: textTesting.length,
  itemBuilder: (BuildContext context, int index) {
    return Container(
        height: 50,
        width: 350,
        child: Container(width: 350, height: 50, child: textTesting[index]));
  },
  separatorBuilder: (BuildContext context, int index) => const Divider(),
);
