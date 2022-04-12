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
  // The categories available in the help center.
  // ------------------------------

  const HelpCenterObject({required this.articleCategories})
      : assert(articleCategories.length >= 1);
}

/*--------- LEVEL 1 --------*/
/*

Description: 
An object that separates and describes the articles in a specific category

Details:
-A minumum of one category is required to build a Help Center. 

*/
class HelpCenterCategories {
  final String categoryTitle;
  // The title of the category (e.g: Payments, Development, etc)
  // ------------------------------
  final List<HelpCenterArticle> categoryArticles;
  // The sub-articles that form the category
  // ------------------------------
  final IconData categoryIcon;
  // The icon related to the category
  // ------------------------------

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
-If you don't want to include a CTA on your article, just pass null to the constructor. 
It is required to be defined in the constructor, but can be built without it. 

*/
class HelpCenterArticle {
  final String articleTitle;
  // The title of the article
  // ------------------------------
  final String articleBody;
  // The content / body of the article
  // ------------------------------

  HelpCenterArticle({required this.articleTitle, required this.articleBody})
      : assert(articleTitle != ''),
        assert(articleBody != '');
}
