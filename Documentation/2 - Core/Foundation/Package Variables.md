# Package Variables
#### Last Updated: 1/20/2022
--------------------

To make building and shipping our resources easier, internally we have a pre-set selection of variables that change across our projects. These variables are what change & customize Aureus for usage. 

You can give Aureus: 
- Your project name
- Your project color
- A Safety Object with the relevant settings that your project completes. 
- Variables for your primary and secondary backing images, as well as your logo. 

In the main.dart file of your project, set your own variables through the Aureus() class. You can see an example of this in the Test App. 

--------------------

### Usage 

In your main() function of main.dart, pass an object of Aureus to apiVariables. 

~~~

void main() {

apiVariables = Aureus(

prodColor: Color.fromRGBO(255, 255, 255, 1.0),

prodName: 'Aureus',

safetyPlan: Safety(

frequencyUsage: SafetyPlanFrequency.singleUse,

productEligiblePlanOptions: []),

darkFluidImage: Image(image: AssetImage('Dark-Blur.png')),

lightFluidImage: Image(image: AssetImage('Light-Fluid.jpg')),

darkBlurImage: Image(image: AssetImage('Dark-Blur.png')),

lightBlurImage: Image(image: AssetImage('Light-Blur.png')),

lightLogo: Image(image: AssetImage('Light-Logo.png')),

darkLogo: Image(image: AssetImage('Dark-Logo.png')));

  

runApp(MyApp());

}

~~~