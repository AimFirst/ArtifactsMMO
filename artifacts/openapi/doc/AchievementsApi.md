# artifacts_api.api.AchievementsApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAchievementAchievementsCodeGet**](AchievementsApi.md#getachievementachievementscodeget) | **GET** /achievements/{code} | Get Achievement
[**getAllAchievementsAchievementsGet**](AchievementsApi.md#getallachievementsachievementsget) | **GET** /achievements | Get All Achievements


# **getAchievementAchievementsCodeGet**
> AchievementResponseSchema getAchievementAchievementsCodeGet(code)

Get Achievement

Retrieve the details of a achievement.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getAchievementsApi();
final String code = code_example; // String | The code of the achievement.

try {
    final response = api.getAchievementAchievementsCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AchievementsApi->getAchievementAchievementsCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the achievement. | 

### Return type

[**AchievementResponseSchema**](AchievementResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllAchievementsAchievementsGet**
> DataPageAchievementSchema getAllAchievementsAchievementsGet(type, page, size)

Get All Achievements

List of all achievements.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getAchievementsApi();
final AchievementType type = ; // AchievementType | Type of achievements.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllAchievementsAchievementsGet(type, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling AchievementsApi->getAllAchievementsAchievementsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | [**AchievementType**](.md)| Type of achievements. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageAchievementSchema**](DataPageAchievementSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

