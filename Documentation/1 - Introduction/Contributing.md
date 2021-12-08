# Contributing
#### Last Updated: 12/7/2021

To keep all of the items in the UDS pretty standard, we have a basic overview of how to actually implement and program the items. This covers implementing and programming IN the Aureus codebase. 

## Best Practices
1. Make as many variables final as possible. 
2. All constructors should be required and named if possible. 
3. Use the foundational variables instead of rewriting them for consistency sake. The foundational vars do a lot of the heavy lifting & re-writing based on UI requirements, so use them!
4. When writing Stateful widgets, build the state in a separate & file private class that is separate from the constructor class. 
    
	
## Naming Schemes
Widget File = [ItemName][Category].dart
Widget Class = [ItemName][Category]
Widget State = _[ItemName][Category][State]
Object File = [ItemName]Objects.dart
Object Class Name (for level one) = [ItemName]Object 
Object Class Name (for other levels) = [ItemName][Descriptor]
    
Objects that are not level one don’t have to be named 'object'. Name them closest to what they are. (E.G: HelpCenterArticle, AlertControllerAction)

## Making a new widget 

#### Details
Sometimes, widgets will require an object to take in all of the data / to keep the codebase tidy. When making an object, don't include it in the same file as the widget initialization / build. 

#### Steps 
-   Import aureus.dart
-   Write description
-   Create class that holds all properties and extends Stateful widget 
-   Create a constructor that’s named & required
-   Override create a state to return a second, file private class. 
-   Create a second class that extends the state of the first that implements Widget build()


## Making a new object
#### Details
* Every widget gets one file for all of the matching object code to go into. E.G: AlertControllerComponent.dart has all matching objects in AlertControllerObjects.dart. Don’t make a new file for every kind of object that a widget has. Keep it in one file.
* Objects are usually nested like Russian nesting dolls. The highest level one that contains all of the other objects is referred to as “Level 0”. The further down you go, the higher the level. With each object, write the level, the description, and the details of that specific object. 

#### Steps 
* Name the object after the matching Widget. 
* Set all properties as final (when possible), and initialize as required & named in the constructor.
* Make sure to assert constructor input is valid and meets minimum requirements to make sure it doesn’t cause issues.



## Maintaining imports / exports
* When ready to use a new widget, go to aureus.dart, scroll to the category your widget falls under, and export it using the file path relative to the project. 

