# Help Center Objects
#### Last Updated: 1/20/2022
--------------------

### Description 

--------------------

#### Usage 

~~~

HelpCenterObject helpCenterTest = HelpCenterObject(articleCategories: [
helpCenterCategoryOne,
helpCenterCategoryTwo,
helpCenterCategoryThree
]);

HelpCenterCategories helpCenterCategoryOne = HelpCenterCategories(
categoryTitle: 'Category One',
categoryArticles: [
helpCenterArticleOne,
helpCenterArticleTwo,
helpCenterArticleThree
],
categoryIcon: Icons.ac_unit_outlined);

HelpCenterCategories helpCenterCategoryTwo = HelpCenterCategories(
categoryTitle: 'Category Two',
categoryArticles: [
helpCenterArticleOne,
helpCenterArticleTwo,
helpCenterArticleThree
],
categoryIcon: Icons.analytics_sharp);

HelpCenterCategories helpCenterCategoryThree = HelpCenterCategories(
categoryTitle: 'Category Three',
categoryArticles: [
helpCenterArticleOne,
helpCenterArticleTwo,
helpCenterArticleThree
],
categoryIcon: Icons.satellite_sharp);

HelpCenterArticle helpCenterArticleOne = HelpCenterArticle(
articleTitle: 'Lorem ipsum dolor?',
articleBody:
'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
articleCTA: () => {});

HelpCenterArticle helpCenterArticleTwo = HelpCenterArticle(
articleTitle: 'Lorem ipsum dolor?',
articleBody:
'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
articleCTA: () => {});

HelpCenterArticle helpCenterArticleThree = HelpCenterArticle(
articleTitle: 'Lorem ipsum dolor?',
articleBody:
'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
articleCTA: () => {});

~~~