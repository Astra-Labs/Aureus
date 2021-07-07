# Meet Aureus 

Aureus (pronouced Or-riss) is Astra Labs' Design System. The design system is broken into a couple of different parts: 

## Dissection
* An thorough breakdown and explanation behind the design choices, themes, and experiences we want to incorporate into the system. This is basically the context you need for seeing why we did the things we did. 

## Foundation
* These are the "variables" of the design system: The colors, typography, language, interactivity guidelines, and the themeing we use across our products. 

## Elements
* Elements are a singular 'base' widget that can be stacked with other widgets to stand alone or create components. These are widgets that are meant to be nested together, but aren't nested as it stands. These elements DO NOT have an action they are linked to.
* EXAMPLE: a rounded view

## Components
* Components are nested elements / widgets that are basically actionable parts of the UI. Components DO have an action they are linked to.
* EXAMPLE: A grid collection of items.

## Views
* Views are pre-built pages following Aureus standards for our projects. These are for pages that all projects will use.
* EXAMPLE: Data opt-in page.

## Keys
Elements, components, and views have a detail key both in the Documentation and Figma that tells you information about the colors, fonts, casing, and all of that jazz for you to implement in programming. This is to make development and building out designs as easy as possible, while also back-linking what needs to be custom built and what is already programmed.

For the sake of brevity, most of the information in the keys are abbreviated into characters, and uses names for variables defined in our foundation. 

#### Key Abbreviations
**BGC:** Background Color
**BRC:** Border Color  
**TCR:** Text Color  
**TS:** Text Style
**TC:** Text Casing
**CR:** Corner Radius
**EL:** Elements
**CMP:** Components


#### Key Variations
* Elements have only UI details, because that's all they need to be built.
* Components have an additional key detail that links to all of the elements it used in its' base to build. 
* Views have an additional key detail that links all of the components its' used to build. Depending on how complex the view is, it may also contain a key for elements. 

### Key Templates
##### Elements

| Key | Value |
|-----|-------|
| BGC |       |
| BRC |       |
| TCR |       |
| TS  |       |
| TC  |       |
| CR  |       |

##### Components

| Key | Value |
|-----|-------|
| BGC |       |
| BRC |       |
| TCR |       |
| TS  |       |
| TC  |       |
| CR  |       |
| EL  |       |

##### Views

| Key | Value |
|-----|-------|
| BGC |       |
| BRC |       |
| TCR |       |
| TS  |       |
| TC  |       |
| CR  |       |
| EL  |       |
| CMP |       |