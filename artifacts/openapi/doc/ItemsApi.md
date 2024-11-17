# artifacts_api.api.ItemsApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllItemsItemsGet**](ItemsApi.md#getallitemsitemsget) | **GET** /items | Get All Items
[**getItemItemsCodeGet**](ItemsApi.md#getitemitemscodeget) | **GET** /items/{code} | Get Item


# **getAllItemsItemsGet**
> DataPageItemSchema getAllItemsItemsGet(minLevel, maxLevel, name, type, craftSkill, craftMaterial, page, size)

Get All Items

Fetch items details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getItemsApi();
final int minLevel = 56; // int | Minimum level items.
final int maxLevel = 56; // int | Maximum level items.
final String name = name_example; // String | Name of the item.
final ItemType type = ; // ItemType | Type of items.
final CraftSkill craftSkill = ; // CraftSkill | Skill to craft items.
final String craftMaterial = craftMaterial_example; // String | Item code of items used as material for crafting.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllItemsItemsGet(minLevel, maxLevel, name, type, craftSkill, craftMaterial, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->getAllItemsItemsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **minLevel** | **int**| Minimum level items. | [optional] 
 **maxLevel** | **int**| Maximum level items. | [optional] 
 **name** | **String**| Name of the item. | [optional] 
 **type** | [**ItemType**](.md)| Type of items. | [optional] 
 **craftSkill** | [**CraftSkill**](.md)| Skill to craft items. | [optional] 
 **craftMaterial** | **String**| Item code of items used as material for crafting. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageItemSchema**](DataPageItemSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getItemItemsCodeGet**
> ItemResponseSchema getItemItemsCodeGet(code)

Get Item

Retrieve the details of a item.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getItemsApi();
final String code = code_example; // String | The code of the item.

try {
    final response = api.getItemItemsCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ItemsApi->getItemItemsCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the item. | 

### Return type

[**ItemResponseSchema**](ItemResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

