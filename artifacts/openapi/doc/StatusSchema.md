# artifacts_api.model.StatusSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**version** | **String** | Game version. | 
**serverTime** | [**DateTime**](DateTime.md) | Server time. | 
**maxLevel** | **int** | Maximum level. | 
**maxSkillLevel** | **int** | Maximum skill level. | 
**charactersOnline** | **int** | Characters online. | 
**announcements** | [**BuiltList&lt;AnnouncementSchema&gt;**](AnnouncementSchema.md) | Server announcements. | 
**rateLimits** | [**BuiltList&lt;RateLimitSchema&gt;**](RateLimitSchema.md) | Rate limits. | 
**season** | [**SeasonSchema**](SeasonSchema.md) | Current season details. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


