# Accessibility
#### Last Updated: 1/20/2022
--------------------

Aureus handles as much accessibility related things as we can. There's a class in Aureus responsible for this. This class is already initialized, and can be accessed by calling accessibility. 

~~~

var accessibility = Accessibility(); 

~~~

--------------------

### Properties

| Name | Type | Description |
|--------|-------------|----------|
|  |   |   |


--------------------

### Methods

| Name | Constructor | Returns | Description | 
|--------|-------------|----------|----------|
| textStringSize |textStringSize({required String textInput, required TextStyle textStyle, required TextDirection textDirection, required MediaQueryData query})  | Size  | Gives properly sized bounds for text that accounts for users' text scaling factor. Must be called within Widget build() | 

--------------------