# Import Strings

Small help on how to create working ImportStrings manually or with self-made tools. If you use older version of the ImportString, the addon will try to import the string using older model, but instead of updating the existing scale (if that setting is enabled) it creates new copy to prevent the older string versions from overwriting the possible advanced changes made to the existing scales otherwise.

* Current version: 2

## Import string version 1

`( AzeritePowerWeights:1:"My Import String":10:268: 116=3.1, 15=2, 186=2, 18=2, 238=2, 382=3.3, 383=3.3, 384=3.1, 43=2, 44=1, 83=3.1, 84=2.1, 85=3.3, 89=3.2, 98=3.3, 99=2 )`

`( AzeritePowerWeights:1:"My Empty Import String":10:268: )`

Version 1 was introduced on addons release and was used from game version 8.0 until 8.1.5. ImportString is made out of parts that are separated by a colon-punctuation `:` and every part has to be in the right order or the import won't work.

1. Open bracket followed by a space and the addon name: `( AzeritePowerWeights`
2. ImportStringVersion. The version number tells the addon how to parse the string.
3. Name of your string inside quotations `""`. This is the name that will appear in the scales list.
4. ClassID. This tells the addon to what class the scale is ment to be used with. You can find the list of classIDs for example from [Wowpedia](https://wow.gamepedia.com/ClassId).
5. SpecID. Thes tells the addon to which spec the scale belongs to. You can find the list of specIDs for example from [Wowpedia](https://wow.gamepedia.com/SpecializationID).
6. Azerite Trait weights. This is a comma `,` separated-list with subelement-pairs containing the `azeritePowerID` and it's corresponding weight number combined with equals-sign `=`.
   * There shouldn't be any spaces between the `azeritePowerID` and the equals-sign or the equals-sign and the weight.
   * Having or not having a comma after the last pair doesn't have any difference when importing.
   * Use a space if you want to leave this empty.
7. A space followed by a close bracket `)` closes the ImportString. No need to add second space if you leave the previous part empty with a space character.

## Import string version 2

`( AzeritePowerWeights:2:"My Import String":10:268: 116=3.1, 15=2, 186=2, 18=2, 238=2, 382=3.3, 383=3.3, 384=3.1, 43=2, 44=1, 83=3.1, 84=2.1, 85=3.3, 89=3.2, 98=3.3, 99=2: 2=2/2, 3=3/3, 4=1/1, 27=0/0, 7=1/1, 15=0/0, 32=1/1, 22=0/0, 25=0/0, 13=2/2, 12=2/2 )`

`( AzeritePowerWeights:2:"My No Essences Import String":10:268: 116=3.1, 15=2, 186=2, 18=2, 238=2, 382=3.3, 383=3.3, 384=3.1, 43=2, 44=1, 83=3.1, 84=2.1, 85=3.3, 89=3.2, 98=3.3, 99=2: )`

`( AzeritePowerWeights:2:"My Only Essences Import String":10:268: : 2=2/2, 3=3/3, 4=1/1, 27=0/0, 7=1/1, 15=0/0, 32=1/1, 22=0/0, 25=0/0, 13=2/2, 12=2/2 )`

`( AzeritePowerWeights:2:"My Empty Import String":10:268: : )`

Version 2 was introduced on gameversion 8.2 to support the new feature: AzeriteEssences. This adds one extra element to the string and it is added after Azerite Trait weights and is separed with colon-punctuation `:`.

1. Parts 1-6 are the same as in previous version.
2. Azerite Essence weights. This is a comma `,` separated-list with subelements like the Azerite Traits weight -list, but instead of one weight value, the pair contains a `essenceID` followed by a equals-sign `=` followed by weight of both the major and minor part of the power separated by a slash-sign `/`.
   * The weight of major power comes before the slash-sign and the weight of minor power after the slash-sign.
   * Just like the Azerite Trait weight-list, there shouldn't be any spaces inside the subelement.
   * Having or not having a comma after the last pair doesn't have any difference when importing.
   * Use a space if you want to leave this empty.
3. A space followed by a close bracket `)` closes the ImportString. No need to add second space if you leave the previous part empty with a space character.
