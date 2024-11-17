# artifacts_api.model.LogSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**character** | **String** | Character name. | 
**account** | **String** | Account character. | 
**type** | [**LogType**](LogType.md) | Type of action. | 
**description** | **String** | Description of action. | 
**content** | [**JsonObject**](.md) |  | 
**cooldown** | **int** | Cooldown in seconds. | 
**cooldownExpiration** | [**DateTime**](DateTime.md) |  | 
**createdAt** | [**DateTime**](DateTime.md) | Datetime of creation. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


