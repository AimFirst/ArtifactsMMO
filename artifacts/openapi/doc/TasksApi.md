# artifacts_api.api.TasksApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAllTasksRewardsTasksRewardsGet**](TasksApi.md#getalltasksrewardstasksrewardsget) | **GET** /tasks/rewards | Get All Tasks Rewards
[**getAllTasksTasksListGet**](TasksApi.md#getalltaskstaskslistget) | **GET** /tasks/list | Get All Tasks
[**getTaskTasksListCodeGet**](TasksApi.md#gettasktaskslistcodeget) | **GET** /tasks/list/{code} | Get Task
[**getTasksRewardTasksRewardsCodeGet**](TasksApi.md#gettasksrewardtasksrewardscodeget) | **GET** /tasks/rewards/{code} | Get Tasks Reward


# **getAllTasksRewardsTasksRewardsGet**
> DataPageDropRateSchema getAllTasksRewardsTasksRewardsGet(page, size)

Get All Tasks Rewards

Fetch the list of all tasks rewards. To obtain these rewards, you must exchange 6 task coins with a tasks master.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getTasksApi();
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllTasksRewardsTasksRewardsGet(page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->getAllTasksRewardsTasksRewardsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageDropRateSchema**](DataPageDropRateSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllTasksTasksListGet**
> DataPageTaskFullSchema getAllTasksTasksListGet(minLevel, maxLevel, skill, type, page, size)

Get All Tasks

Fetch the list of all tasks.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getTasksApi();
final int minLevel = 56; // int | Minimum level.
final int maxLevel = 56; // int | Maximum level.
final Skill skill = ; // Skill | The code of the skill.
final TaskType type = ; // TaskType | The type of tasks.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllTasksTasksListGet(minLevel, maxLevel, skill, type, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->getAllTasksTasksListGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **minLevel** | **int**| Minimum level. | [optional] 
 **maxLevel** | **int**| Maximum level. | [optional] 
 **skill** | [**Skill**](.md)| The code of the skill. | [optional] 
 **type** | [**TaskType**](.md)| The type of tasks. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageTaskFullSchema**](DataPageTaskFullSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTaskTasksListCodeGet**
> TaskFullResponseSchema getTaskTasksListCodeGet(code)

Get Task

Retrieve the details of a task.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getTasksApi();
final String code = code_example; // String | The code of the task.

try {
    final response = api.getTaskTasksListCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->getTaskTasksListCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the task. | 

### Return type

[**TaskFullResponseSchema**](TaskFullResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getTasksRewardTasksRewardsCodeGet**
> RewardResponseSchema getTasksRewardTasksRewardsCodeGet(code)

Get Tasks Reward

Retrieve the details of a tasks reward.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getTasksApi();
final String code = code_example; // String | The code of the tasks reward.

try {
    final response = api.getTasksRewardTasksRewardsCodeGet(code);
    print(response);
} catch on DioException (e) {
    print('Exception when calling TasksApi->getTasksRewardTasksRewardsCodeGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the tasks reward. | 

### Return type

[**RewardResponseSchema**](RewardResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

