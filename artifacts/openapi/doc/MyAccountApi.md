# artifacts_api.api.MyAccountApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**changePasswordMyChangePasswordPost**](MyAccountApi.md#changepasswordmychangepasswordpost) | **POST** /my/change_password | Change Password
[**getAccountDetailsMyDetailsGet**](MyAccountApi.md#getaccountdetailsmydetailsget) | **GET** /my/details | Get Account Details
[**getBankDetailsMyBankGet**](MyAccountApi.md#getbankdetailsmybankget) | **GET** /my/bank | Get Bank Details
[**getBankItemsMyBankItemsGet**](MyAccountApi.md#getbankitemsmybankitemsget) | **GET** /my/bank/items | Get Bank Items
[**getGeSellHistoryMyGrandexchangeHistoryGet**](MyAccountApi.md#getgesellhistorymygrandexchangehistoryget) | **GET** /my/grandexchange/history | Get Ge Sell History
[**getGeSellOrdersMyGrandexchangeOrdersGet**](MyAccountApi.md#getgesellordersmygrandexchangeordersget) | **GET** /my/grandexchange/orders | Get Ge Sell Orders


# **changePasswordMyChangePasswordPost**
> ResponseSchema changePasswordMyChangePasswordPost(changePassword)

Change Password

Change your account password. Changing the password reset the account token.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();
final ChangePassword changePassword = ; // ChangePassword | 

try {
    final response = api.changePasswordMyChangePasswordPost(changePassword);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->changePasswordMyChangePasswordPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **changePassword** | [**ChangePassword**](ChangePassword.md)|  | 

### Return type

[**ResponseSchema**](ResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAccountDetailsMyDetailsGet**
> MyAccountDetailsSchema getAccountDetailsMyDetailsGet()

Get Account Details

Fetch account details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();

try {
    final response = api.getAccountDetailsMyDetailsGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->getAccountDetailsMyDetailsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MyAccountDetailsSchema**](MyAccountDetailsSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBankDetailsMyBankGet**
> BankResponseSchema getBankDetailsMyBankGet()

Get Bank Details

Fetch bank details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();

try {
    final response = api.getBankDetailsMyBankGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->getBankDetailsMyBankGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BankResponseSchema**](BankResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getBankItemsMyBankItemsGet**
> DataPageSimpleItemSchema getBankItemsMyBankItemsGet(itemCode, page, size)

Get Bank Items

Fetch all items in your bank.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();
final String itemCode = itemCode_example; // String | Item to search in your bank.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getBankItemsMyBankItemsGet(itemCode, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->getBankItemsMyBankItemsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **itemCode** | **String**| Item to search in your bank. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageSimpleItemSchema**](DataPageSimpleItemSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGeSellHistoryMyGrandexchangeHistoryGet**
> DataPageGeOrderHistorySchema getGeSellHistoryMyGrandexchangeHistoryGet(id, code, page, size)

Get Ge Sell History

Fetch your sales history of the last 7 days.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();
final String id = id_example; // String | Order ID to search in your history.
final String code = code_example; // String | Item to search in your history.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getGeSellHistoryMyGrandexchangeHistoryGet(id, code, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->getGeSellHistoryMyGrandexchangeHistoryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Order ID to search in your history. | [optional] 
 **code** | **String**| Item to search in your history. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageGeOrderHistorySchema**](DataPageGeOrderHistorySchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getGeSellOrdersMyGrandexchangeOrdersGet**
> DataPageGEOrderSchema getGeSellOrdersMyGrandexchangeOrdersGet(code, page, size)

Get Ge Sell Orders

Fetch your sell orders details.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyAccountApi();
final String code = code_example; // String | The code of the item.
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getGeSellOrdersMyGrandexchangeOrdersGet(code, page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyAccountApi->getGeSellOrdersMyGrandexchangeOrdersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **code** | **String**| The code of the item. | [optional] 
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageGEOrderSchema**](DataPageGEOrderSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

