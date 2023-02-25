/// @nodoc
import 'package:flutter/material.dart';

/// {@category Objects}
/// {@image <image alt='' src=''>}

/// An object that contains all of the lower level objects
/// If only one category is passed, Help Center will just display the
/// list view of articles.
/// If multiple categories are passed, Help Center will display a
/// grid list of categories, and then a detailed list of articles.

class HelpCenterObject {
  /// The categories available in the help center.
  final List<HelpCenterCategories> articleCategories;

  const HelpCenterObject({required this.articleCategories})
      : assert(articleCategories.length >= 1);
}

/// An object that separates and describes the articles in a specific category
/// A minumum of one category is required to build a Help Center.

class HelpCenterCategories {
  /// The title of the category (e.g: Payments, Development, etc)
  final String categoryTitle;

  /// The sub-articles that form the category
  final List<HelpCenterArticle> categoryArticles;

  /// The icon related to the category
  final IconData categoryIcon;

  const HelpCenterCategories(
      {required this.categoryTitle,
      required this.categoryArticles,
      required this.categoryIcon})
      : assert(categoryTitle != ''),
        assert(categoryArticles.length >= 1);
}

/// An object that constructs a help center article with from content. If you don't
/// want to include a CTA on your article, just pass null to the constructor.
/// It is required to be defined in the constructor, but can be built without it.

class HelpCenterArticle {
  /// The title of the article
  final String articleTitle;

  /// The content / body of the article
  final String articleBody;

  HelpCenterArticle({required this.articleTitle, required this.articleBody})
      : assert(articleTitle != ''),
        assert(articleBody != '');
}
