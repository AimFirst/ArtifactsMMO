# artifacts_api.api.TokenApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generateTokenTokenPost**](TokenApi.md#generatetokentokenpost) | **POST** /token | Generate Token


# **generateTokenTokenPost**
> TokenResponseSchema generateTokenTokenPost()

Generate Token

Use your account as HTTPBasic Auth to generate your token to use the API. You can also generate your token directly on the website.

### Example
```dart
import 'package:artifacts_api/api.dart';
// TODO Configure HTTP basic authorization: HTTPBasic
//defaultApiClient.getAuthentication<HttpBasicAuth>('HTTPBasic').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('HTTPBasic').password = 'YOUR_PASSWORD';

final api = ArtifactsApi().getTokenApi();

try {
    final response = api.generateTokenTokenPost();
    print(response);
} catch on DioException (e) {
    print('Exception when calling TokenApi->generateTokenTokenPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TokenResponseSchema**](TokenResponseSchema.md)

### Authorization

[HTTPBasic](../README.md#HTTPBasic)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

