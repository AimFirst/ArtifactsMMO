# artifacts_api.model.MyAccountDetails

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | **String** | Username. | 
**email** | **String** | Email. | 
**member** | **bool** | Member status. | 
**status** | [**AccountStatus**](AccountStatus.md) | Account status. | 
**skins** | [**BuiltList&lt;JsonObject&gt;**](JsonObject.md) | Skins owned. | 
**gems** | **int** | Gems. | 
**achievementsPoints** | **int** | Achievement points. | 
**banned** | **bool** | Banned. | 
**memberExpiration** | [**DateTime**](DateTime.md) |  | [optional] 
**badges** | [**BuiltList&lt;JsonObject&gt;**](JsonObject.md) | Account badges. | [optional] 
**banReason** | **String** | Ban reason. | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


