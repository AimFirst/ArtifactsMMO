# artifacts_api.api.EffectsApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllEffectsEffectsGet**](EffectsApi.md#getalleffectseffectsget) | **GET** /effects | Get All Effects
[**getEffectEffectsCodeGet**](EffectsApi.md#geteffecteffectscodeget) | **GET** /effects/{code} | Get Effect


# **getAllEffectsEffectsGet**
> DataPageEffectSchema getAllEffectsEffectsGet(page, size)

Get All Effects

List of all effects. Effects are used by equipment, tools, runes, consumables and monsters. An effect is an action that produces an effect on the game.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getEffectsApi();
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllEffectsEffectsGet(page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EffectsApi->getAllEffectsEffectsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageEffectSchema**](DataPageEffectSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEffectEffectsCodeGet**
> EffectResponseSchema getEffectEffectsCodeGet(code)

Get Effect

Retrieve the details of a badge.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getEffectsApi();
final String code = code_example; // String | The code of the achievement.

try {
    final response = api.getEffectEffectsCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling EffectsApi->getEffectEffectsCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the achievement. | 

### Return type

[**EffectResponseSchema**](EffectResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

