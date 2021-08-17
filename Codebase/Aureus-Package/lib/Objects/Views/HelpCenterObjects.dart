import 'package:aureus/foundation.dart';
import 'package:flutter/material.dart';

//The main object that contains all related categories and articles. Root object, level 0. 
//If only one category is passed, Help Center will just display the list view of articles.
//If multiple categories are passed, Help Center will display a grid list of categories, and then a detailed list of articles. 
class HelpCenterObject {
  final List<HelpCenterCategories> articleCategories;

  const HelpCenterObject({required this.articleCategories});
}

//A category that contains specific articles that are linked together. E.G: Health, or User Help. Level 1 Depth in object list.
class HelpCenterCategories {
  final String categoryTitle;
  final List<HelpCenterArticle> categoryArticles;
  final Image categoryIcon;

  const HelpCenterCategories(
      {required this.categoryTitle,
      required this.categoryArticles,
      required this.categoryIcon});
}

// An object that contains the metadata for the help center article. Level 2 depth in object list.
class HelpCenterArticle {
  //metadata about the article
  final String articleTitle;
  final String articleBody;

  //if you don't want to include a CTA on your article, just pass null to the constructor.
  final VoidCallback articleCTA;

  const HelpCenterArticle(
      {required this.articleTitle,
      required this.articleBody,
      required this.articleCTA});
}
