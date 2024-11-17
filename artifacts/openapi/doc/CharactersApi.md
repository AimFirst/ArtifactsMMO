# artifacts_api.api.CharactersApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createCharacterCharactersCreatePost**](CharactersApi.md#createcharactercharacterscreatepost) | **POST** /characters/create | Create Character
[**deleteCharacterCharactersDeletePost**](CharactersApi.md#deletecharactercharactersdeletepost) | **POST** /characters/delete | Delete Character
[**getCharacterCharactersNameGet**](CharactersApi.md#getcharactercharactersnameget) | **GET** /characters/{name} | Get Character


# **createCharacterCharactersCreatePost**
> CharacterResponseSchema createCharacterCharactersCreatePost(addCharacterSchema)

Create Character

Create new character on your account. You can create up to 5 characters.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getCharactersApi();
final AddCharacterSchema addCharacterSchema = ; // AddCharacterSchema | 

try {
    final response = api.createCharacterCharactersCreatePost(addCharacterSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CharactersApi->createCharacterCharactersCreatePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **addCharacterSchema** | [**AddCharacterSchema**](AddCharacterSchema.md)|  | 

### Return type

[**CharacterResponseSchema**](CharacterResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteCharacterCharactersDeletePost**
> CharacterResponseSchema deleteCharacterCharactersDeletePost(deleteCharacterSchema)

Delete Character

Delete character on your account.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getCharactersApi();
final DeleteCharacterSchema deleteCharacterSchema = ; // DeleteCharacterSchema | 

try {
    final response = api.deleteCharacterCharactersDeletePost(deleteCharacterSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CharactersApi->deleteCharacterCharactersDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deleteCharacterSchema** | [**DeleteCharacterSchema**](DeleteCharacterSchema.md)|  | 

### Return type

[**CharacterResponseSchema**](CharacterResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharacterCharactersNameGet**
> CharacterResponseSchema getCharacterCharactersNameGet(name)

Get Character

Retrieve the details of a character.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getCharactersApi();
final String name = name_example; // String | The character name.

try {
    final response = api.getCharacterCharactersNameGet(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling CharactersApi->getCharacterCharactersNameGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| The character name. | 

### Return type

[**CharacterResponseSchema**](CharacterResponseSchema.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

