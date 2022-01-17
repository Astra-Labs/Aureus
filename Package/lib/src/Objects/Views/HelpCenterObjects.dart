import 'package:aureus/aureus.dart';

/*--------- LEVEL 0 --------*/
/*

Description: 
An object that contains all of the lower level objects 

Details:
-If only one category is passed, Help Center will just display the list view of articles.
-If multiple categories are passed, Help Center will display a grid list of categories, and then a detailed list of articles.

*/

class HelpCenterObject {
  final List<HelpCenterCategories> articleCategories;

  const HelpCenterObject({required this.articleCategories})
      : assert(articleCategories.length >= 1);
}

/*--------- LEVEL 1 --------*/
/*

Description: 
A category that separates and describes the articles in a 

Details:
-A minumum of one category is required to build a Help Center. 

*/
class HelpCenterCategories {
  final String categoryTitle;
  final List<HelpCenterArticle> categoryArticles;
  final IconData categoryIcon;

  const HelpCenterCategories(
      {required this.categoryTitle,
      required this.categoryArticles,
      required this.categoryIcon})
      : assert(categoryTitle != ''),
        assert(categoryArticles.length >= 1);
}

/*--------- LEVEL 2 --------*/
/*

Description: 
An object that constructs a help center article with from content. 

Details:
-If you don't want to include a CTA on your article, just pass null to the constructor. It is required to be defined in the constructor, but can be built without it. 

*/
class HelpCenterArticle {
  final String articleTitle;
  final String articleBody;
  final VoidCallback articleCTA;

  const HelpCenterArticle(
      {required this.articleTitle,
      required this.articleBody,
      required this.articleCTA})
      : assert(articleTitle != ''),
        assert(articleBody != '');
}
