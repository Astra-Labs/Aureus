# Coloration
#### Last Updated: 1/20/2022
--------------------

The coloration class is used when building widgets to properly return the right color values, so we can dynamically create light / dark mode widgets, and continue to ensure accessibility contrast. Coloration has been initiated, and you can use it by calling coloration.

~~~

var coloration = Coloration(); 

~~~

--------------------

### Methods

| Name | Constructor | Returns | Description | 
|--------|-------------|----------|----------|
| resourceLogo | N/A | Image | Returns proper logo according to light mode / dark mode. |
| decorationColor | (decorationPriority: decorationVariant) | Color | For items that dynamically change state, returns the proper coloration for each state of decoration priority. |
