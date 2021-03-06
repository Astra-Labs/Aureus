import 'package:aureus/aureus.dart';

//The main container for the entire Help Center functionality that controls the layout, views, and more.
class HelpCenterView extends StatefulWidget {
  final HelpCenterObject helpCenter;

  const HelpCenterView({required this.helpCenter});

  @override
  _HelpCenterViewState createState() => _HelpCenterViewState();
}

class _HelpCenterViewState extends State<HelpCenterView> {
  //the container that draws the first screen that someone will see when they enter the Help Center.
  List<Widget> itemGridCards = [];

  @override
  Widget build(BuildContext context) {
    var currentHelpCenter = widget.helpCenter;

    var screenSize = size.logicalScreenSize();

    setState(() {
      itemGridCards.clear();
      currentHelpCenter.articleCategories[0].categoryArticles
          .forEach((element) {
        itemGridCards.add(InkWell(
          onTap: () => {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      HelpCenterArticleDetail(article: element),
                ))
          },
          child: GridCardElement(
              decorationVariant: decorationPriority.standard,
              cardLabel: element.articleTitle,
              gridSize: Size(size.layoutItemWidth(1, screenSize),
                  size.layoutItemHeight(1, screenSize))),
        ));
      });
    });

    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        DividingHeaderElement(
            headerText: 'Help Center',
            subheaderText:
                'Find the answers to your questions about our software and how it works.'),
        SizedBox(
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.start,
              runAlignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              runSpacing: 15,
              children: itemGridCards,
            ),
          ),
        ),
        Spacer(),
      ],
    );

    return ContainerView(
        decorationVariant: decorationPriority.standard,
        builder: viewLayout,
        takesFullWidth: false);
  }
}

class HelpCenterArticleDetail extends StatefulWidget {
  final HelpCenterArticle article;
  const HelpCenterArticleDetail({required this.article});

  @override
  _HelpCenterArticleDetailState createState() =>
      _HelpCenterArticleDetailState();
}

class _HelpCenterArticleDetailState extends State<HelpCenterArticleDetail> {
  @override
  Widget build(BuildContext context) {
    ContainerWrapperElement viewLayout = ContainerWrapperElement(
      containerVariant: wrapperVariants.fullScreen,
      children: [
        SecondaryIconButtonElement(
            decorationVariant: decorationPriority.standard,
            buttonIcon: Assets.back,
            buttonTooltip: 'Return to Help Center.',
            buttonAction: () => {Navigator.pop(context)}),
        Spacer(),
        IconBadge(
            badgeIcon: Assets.lock, badgePriority: decorationPriority.standard),
        SizedBox(height: 40.0),
        HeadingThreeText(
            widget.article.articleTitle, decorationPriority.standard),
        SizedBox(height: 25.0),
        Container(
            constraints: BoxConstraints(
                minWidth: size.layoutItemWidth(1, size.logicalScreenSize()),
                maxWidth: size.layoutItemWidth(1, size.logicalScreenSize()),
                minHeight: size.layoutItemHeight(5, size.logicalScreenSize()),
                maxHeight: size.layoutItemHeight(2, size.logicalScreenSize())),
            decoration:
                LayerBackingDecoration(priority: decorationPriority.standard)
                    .buildBacking(),
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Wrap(
                children: [
                  BodyOneText(
                      widget.article.articleBody, decorationPriority.standard)
                ],
              ),
            )),
        Spacer(),
      ],
    );
    return ContainerView(
        decorationVariant: decorationPriority.standard, builder: viewLayout);
  }
}
