# artifacts_api.model.StatusSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** | Server status | 
**version** | **String** | Game version. | 
**maxLevel** | **int** | Maximum level. | 
**charactersOnline** | **int** | Characters online. | 
**serverTime** | [**DateTime**](DateTime.md) | Server time. | 
**announcements** | [**BuiltList&lt;AnnouncementSchema&gt;**](AnnouncementSchema.md) | Server announcements. | 
**lastWipe** | **String** | Last server wipe. | 
**nextWipe** | **String** | Next server wipe. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


