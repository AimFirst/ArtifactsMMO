# artifacts_api.model.AccountAchievementSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the achievement. | 
**code** | **String** | Code of the achievement.  | 
**description** | **String** | Description of the achievement. | 
**points** | **int** | Points of the achievement. Used for the leaderboard. | 
**type** | [**AchievementType**](AchievementType.md) | Type of achievement. | 
**target** | **String** |  | 
**total** | **int** | Total to do. | 
**rewards** | [**AchievementRewardsSchema**](AchievementRewardsSchema.md) | Rewards. | 
**current** | **int** | Current progress. | 
**completedAt** | [**DateTime**](DateTime.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


