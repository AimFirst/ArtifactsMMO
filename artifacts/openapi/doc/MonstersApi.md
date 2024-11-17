# artifacts_api.api.MonstersApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllMonstersMonstersGet**](MonstersApi.md#getallmonstersmonstersget) | **GET** /monsters | Get All Monsters
[**getMonsterMonstersCodeGet**](MonstersApi.md#getmonstermonsterscodeget) | **GET** /monsters/{code} | Get Monster


# **getAllMonstersMonstersGet**
> DataPageMonsterSchema getAllMonstersMonstersGet(minLevel, maxLevel, drop, page, size)

Get All Monsters

Fetch monsters details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMonstersApi();
final int minLevel = 56; // int | Monster minimum level.
final int maxLevel = 56; // int | Monster maximum level.
final String drop = drop_example; // String | Item code of the drop.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllMonstersMonstersGet(minLevel, maxLevel, drop, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MonstersApi->getAllMonstersMonstersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **minLevel** | **int**| Monster minimum level. | [optional] 
 **maxLevel** | **int**| Monster maximum level. | [optional] 
 **drop** | **String**| Item code of the drop. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageMonsterSchema**](DataPageMonsterSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMonsterMonstersCodeGet**
> MonsterResponseSchema getMonsterMonstersCodeGet(code)

Get Monster

Retrieve the details of a monster.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMonstersApi();
final String code = code_example; // String | The code of the monster.

try {
    final response = api.getMonsterMonstersCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MonstersApi->getMonsterMonstersCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the monster. | 

### Return type

[**MonsterResponseSchema**](MonsterResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

