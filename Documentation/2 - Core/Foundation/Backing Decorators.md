# Backing Decorators 
#### Last Updated: 1/20/2022
--------------------

To enable reusability and modularity of the code, the BackingDecoration classes take a set of inputs based on the Design System conventions and return a BoxDecoration based on design prority and light / dark mode. 

**Each BackingDecoration class needs to be called with .buildBacking() in order to return a BoxDecoration. If you don't call .buildBacking, you'll get thrown an error. **

--------------------

###  ButtonBackingDecoration

#### Constructor
~~~
ButtonBackingDecoration(variant: buttonDecorationVariants, priority: decorationPriority);
~~~

--------------------

###  LayerBackingDecoration

#### Constructor
~~~
LayerBackingDecoration(priority: decorationPriority)
~~~

--------------------

### CardBackingDecoration

#### Constructor
~~~
CardBackingDecoration(priority: decorationPriority)
~~~

--------------------

###  InputBackingDecoration

#### Constructor
~~~
InputBackingDecoration()
~~~

--------------------

###  TabItemBackingDecoration

#### Constructor
~~~
TabItemBackingDecoration(variant: tabItemDecorationVariants, priority: decorationPriority)
~~~

--------------------