# artifacts_api.model.ResourceSchema

## Load the model package
```dart
import 'package:artifacts_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the resource | 
**code** | **String** | The code of the resource. This is the resource's unique identifier (ID). | 
**skill** | [**GatheringSkill**](GatheringSkill.md) | The skill required to gather this resource. | 
**level** | **int** | The skill level required to gather this resource. | 
**drops** | [**BuiltList&lt;DropRateSchema&gt;**](DropRateSchema.md) | The drops of this resource. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


