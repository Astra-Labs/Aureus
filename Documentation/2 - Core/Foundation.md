# Foundation 
#### Last Updated: 12/7/2021

## Global Enums
All global enums are at the bottom of aureus.dart. Since enums are global within Dart, put all of your enums at the bottom of that file. 


## Variables 
All of the UI variables within the Figma have been imported into foundation.dart for consistency and standardization across all of the UI items. 

#### Contains:
##### Metadata
- Product Name
- Light Blur (Background for standard views on light mode)
- Dark Blur (Background for standard views on dark mode)
- Light Fluid (Background for priority views on light mode)
- Dark Fluid (Background for priority views on light mode)
- Landing Image (Background for onboarding / marketing materials on both modes)

##### Colors
[]




## Typography
All of the typography found in Aureus is within foundation.dart as TextStyles, and as Text. Returning a TextStyle will just provide the font and metadata. Calling the Text classes handles the casing, and provides color-changing text that changes with light and dark mode without developer input. 

#### Typography - Usage

#### Contains:

## Sizing
Aureus has a sizing class that takes the percentage of width & height of a user's device, and uses it to build screen sizes. This sizing builds the universal padding, and container padding for a given screen. 


#### Sizing - Usage

#### Contains:

## Backings
Because so many of our UI items re-use the same radiuses, backings, and more, there is a class for different types of items, and enums to hold data about them. When Aureus builds an item, depending on light mode or dark mode, the priority, and other pieces of information, a backing is created without redundent developer input that complies with Aureus' guidelines. 

#### Backings - Usage

#### Contains: