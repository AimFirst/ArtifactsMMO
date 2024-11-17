# artifacts_api.api.LeaderboardApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getAccountsLeaderboardLeaderboardAccountsGet**](LeaderboardApi.md#getaccountsleaderboardleaderboardaccountsget) | **GET** /leaderboard/accounts | Get Accounts Leaderboard
[**getCharactersLeaderboardLeaderboardCharactersGet**](LeaderboardApi.md#getcharactersleaderboardleaderboardcharactersget) | **GET** /leaderboard/characters | Get Characters Leaderboard


# **getAccountsLeaderboardLeaderboardAccountsGet**
> DataPageAccountLeaderboardSchema getAccountsLeaderboardLeaderboardAccountsGet(sort, page, size)

Get Accounts Leaderboard

Fetch leaderboard details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getLeaderboardApi();
final AccountLeaderboardType sort = ; // AccountLeaderboardType | Default sort by achievements points.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAccountsLeaderboardLeaderboardAccountsGet(sort, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaderboardApi->getAccountsLeaderboardLeaderboardAccountsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | [**AccountLeaderboardType**](.md)| Default sort by achievements points. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageAccountLeaderboardSchema**](DataPageAccountLeaderboardSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharactersLeaderboardLeaderboardCharactersGet**
> DataPageCharacterLeaderboardSchema getCharactersLeaderboardLeaderboardCharactersGet(sort, page, size)

Get Characters Leaderboard

Fetch leaderboard details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getLeaderboardApi();
final CharacterLeaderboardType sort = ; // CharacterLeaderboardType | Default sort by combat total XP.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getCharactersLeaderboardLeaderboardCharactersGet(sort, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling LeaderboardApi->getCharactersLeaderboardLeaderboardCharactersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **sort** | [**CharacterLeaderboardType**](.md)| Default sort by combat total XP. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageCharacterLeaderboardSchema**](DataPageCharacterLeaderboardSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

