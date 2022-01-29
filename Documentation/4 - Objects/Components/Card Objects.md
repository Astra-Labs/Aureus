# Card Objects
#### Last Updated: 1/20/2022
--------------------

### Description 

--------------------

#### Usage 

~~~

CardObject standardCardObject = CardObject.standard(
decorationPriority.standard, fillerTextHeader, fillerAction);

CardObject standardIconCardObject = CardObject.standardIcon(
decorationPriority.standard, fillerTextHeader, fillerIcon1, fillerAction);

CardObject detailCardObject = CardObject.detailed(decorationPriority.standard,
fillerTextHeader, fillerTextBody, fillerAction);

CardObject detailIconCardObject = CardObject.detailedIcon(
decorationPriority.standard,
fillerTextHeader,
fillerTextBody,
fillerIcon1,
fillerAction);

CardObject complexCardObject = CardObject.complex(
decorationPriority.standard,
fillerTextHeader,
fillerTextBody,
{
'Detail 1': fillerIcon1,
'Detail 2': fillerIcon2,
'Detail 3': fillerIcon3,
'Detail 4': fillerIcon4,
},
fillerAction);

CardObject complexIconCardObject = CardObject.complexIcon(
decorationPriority.standard,
fillerTextHeader,
fillerTextBody,
fillerIcon1,
{
'Detail 1': fillerIcon1,
'Detail 2': fillerIcon2,
'Detail 3': fillerIcon3,
'Detail 4': fillerIcon4,
},
fillerAction);

~~~