# artifacts_api.model.FightSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**xp** | **int** | The amount of xp gained from the fight. | 
**gold** | **int** | The amount of gold gained from the fight. | 
**drops** | [**BuiltList&lt;DropSchema&gt;**](DropSchema.md) | The items dropped from the fight. | 
**turns** | **int** | Numbers of the turns of the combat. | 
**monsterBlockedHits** | [**BlockedHitsSchema**](BlockedHitsSchema.md) | The amount of blocked hits by the monster. | 
**playerBlockedHits** | [**BlockedHitsSchema**](BlockedHitsSchema.md) | The amount of blocked hits by the player. | 
**logs** | **BuiltList&lt;String&gt;** | The fight logs. | 
**result** | [**FightResult**](FightResult.md) | The result of the fight. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


