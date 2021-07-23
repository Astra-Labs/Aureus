# Contributing
To keep all of the items in the UDS pretty standard, we have a basic overview of how to actually implement and program the items. 

### Documentation
Documenting the items should be relatively painless. 

Define the: 
* Github link for where the source code is
* Properties (what the item NEEDS to work)
* Input (aka - what the developer puts in. this covers both required properties and optional ones)
* Output (aka - what the developer needs to handle / override)
* Types of variants 

Within the context of the codebase, at the top is a place to write a short description and link back to the documentation here. You can use the same description for both. Link the codebase to the docs, and link the docs to the codebase. 

### Variants
Variants should be taken in as input in the form of enums, and should be constructed within the same widget using different implementations based on the variable. Do not make different widgets for different variants. 

(E.G: Have one message bubble widget with recieving and sending variants, not a sending message bubble widget and receiving message bubble widget).

Things that count as variants: 
* Different color schemes / styles
* Different screen sizes (although for the first build of the UDS, just worry about mobile screens and not desktops)
* Data inputs

### User Interaction
For the most part, handle user interaction but pass off the event handler to the end-programmer to determine what to do. Include the event handler for user interaction in the initalization of the widget.

### Functionality
Items within the UDS should provide basic information to complete the functionality neccessary, but do not build the required functionality into the item. Pass this off to the developer to build in through an event handler during initialization, or include specific documentation that tells them where to override the widget.  

E.G: Do not include a send functionality that hooks into an API within the send field. Pass off the output back and allow the functionality of the implementation to happen within the app. 

### I/O 
Write out the different inputs of the widget, and what the outputs / overrides will be within the documentation.