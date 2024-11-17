# artifacts_api.api.MapsApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllMapsMapsGet**](MapsApi.md#getallmapsmapsget) | **GET** /maps | Get All Maps
[**getMapMapsXYGet**](MapsApi.md#getmapmapsxyget) | **GET** /maps/{x}/{y} | Get Map


# **getAllMapsMapsGet**
> DataPageMapSchema getAllMapsMapsGet(contentType, contentCode, page, size)

Get All Maps

Fetch maps details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMapsApi();
final MapContentType contentType = ; // MapContentType | Type of content on the map.
final String contentCode = contentCode_example; // String | Content code on the map.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllMapsMapsGet(contentType, contentCode, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MapsApi->getAllMapsMapsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **contentType** | [**MapContentType**](.md)| Type of content on the map. | [optional] 
 **contentCode** | **String**| Content code on the map. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageMapSchema**](DataPageMapSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMapMapsXYGet**
> MapResponseSchema getMapMapsXYGet(x, y)

Get Map

Retrieve the details of a map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMapsApi();
final int x = 56; // int | The position x of the map.
final int y = 56; // int | The position X of the map.

try {
    final response = api.getMapMapsXYGet(x, y);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MapsApi->getMapMapsXYGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **x** | **int**| The position x of the map. | 
 **y** | **int**| The position X of the map. | 

### Return type

[**MapResponseSchema**](MapResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

