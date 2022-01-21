# Foundation 
#### Last Updated: 1/20/2022
--------------------

## Global Enums
All global enums are at the bottom of aureus.dart. Since enums are global within Dart, put all of your enums at the bottom of that file. 


--------------------

## Typography
All of the typography found in Aureus is within foundation.dart as TextStyles, and as Text. Returning a TextStyle will just provide the font and metadata. Calling the Text classes handles the casing, and provides color-changing text that changes with light and dark mode without developer input. 

--------------------

## Backings
Because so many of our UI items re-use the same radiuses, backings, and more, there is a class for different types of items, and enums to hold data about them. When Aureus builds an item, depending on light mode or dark mode, the priority, and other pieces of information, a backing is created without redundent developer input that complies with Aureus' guidelines. 

#### Backings - Usage

#### Contains: