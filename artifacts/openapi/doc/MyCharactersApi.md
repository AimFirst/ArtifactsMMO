# artifacts_api.api.MyCharactersApi

## Load the API package
```dart
import 'package:artifacts_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**actionAcceptNewTaskMyNameActionTaskNewPost**](MyCharactersApi.md#actionacceptnewtaskmynameactiontasknewpost) | **POST** /my/{name}/action/task/new | Action Accept New Task
[**actionBuyBankExpansionMyNameActionBankBuyExpansionPost**](MyCharactersApi.md#actionbuybankexpansionmynameactionbankbuyexpansionpost) | **POST** /my/{name}/action/bank/buy_expansion | Action Buy Bank Expansion
[**actionChristmasExchangeMyNameActionChristmasExchangePost**](MyCharactersApi.md#actionchristmasexchangemynameactionchristmasexchangepost) | **POST** /my/{name}/action/christmas/exchange | Action Christmas Exchange
[**actionCompleteTaskMyNameActionTaskCompletePost**](MyCharactersApi.md#actioncompletetaskmynameactiontaskcompletepost) | **POST** /my/{name}/action/task/complete | Action Complete Task
[**actionCraftingMyNameActionCraftingPost**](MyCharactersApi.md#actioncraftingmynameactioncraftingpost) | **POST** /my/{name}/action/crafting | Action Crafting
[**actionDeleteItemMyNameActionDeletePost**](MyCharactersApi.md#actiondeleteitemmynameactiondeletepost) | **POST** /my/{name}/action/delete | Action Delete Item
[**actionDepositBankGoldMyNameActionBankDepositGoldPost**](MyCharactersApi.md#actiondepositbankgoldmynameactionbankdepositgoldpost) | **POST** /my/{name}/action/bank/deposit/gold | Action Deposit Bank Gold
[**actionDepositBankMyNameActionBankDepositPost**](MyCharactersApi.md#actiondepositbankmynameactionbankdepositpost) | **POST** /my/{name}/action/bank/deposit | Action Deposit Bank
[**actionEquipItemMyNameActionEquipPost**](MyCharactersApi.md#actionequipitemmynameactionequippost) | **POST** /my/{name}/action/equip | Action Equip Item
[**actionFightMyNameActionFightPost**](MyCharactersApi.md#actionfightmynameactionfightpost) | **POST** /my/{name}/action/fight | Action Fight
[**actionGatheringMyNameActionGatheringPost**](MyCharactersApi.md#actiongatheringmynameactiongatheringpost) | **POST** /my/{name}/action/gathering | Action Gathering
[**actionGeBuyItemMyNameActionGrandexchangeBuyPost**](MyCharactersApi.md#actiongebuyitemmynameactiongrandexchangebuypost) | **POST** /my/{name}/action/grandexchange/buy | Action Ge Buy Item
[**actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost**](MyCharactersApi.md#actiongecancelsellordermynameactiongrandexchangecancelpost) | **POST** /my/{name}/action/grandexchange/cancel | Action Ge Cancel Sell Order
[**actionGeCreateSellOrderMyNameActionGrandexchangeSellPost**](MyCharactersApi.md#actiongecreatesellordermynameactiongrandexchangesellpost) | **POST** /my/{name}/action/grandexchange/sell | Action Ge Create Sell Order
[**actionMoveMyNameActionMovePost**](MyCharactersApi.md#actionmovemynameactionmovepost) | **POST** /my/{name}/action/move | Action Move
[**actionRecyclingMyNameActionRecyclingPost**](MyCharactersApi.md#actionrecyclingmynameactionrecyclingpost) | **POST** /my/{name}/action/recycling | Action Recycling
[**actionRestMyNameActionRestPost**](MyCharactersApi.md#actionrestmynameactionrestpost) | **POST** /my/{name}/action/rest | Action Rest
[**actionTaskCancelMyNameActionTaskCancelPost**](MyCharactersApi.md#actiontaskcancelmynameactiontaskcancelpost) | **POST** /my/{name}/action/task/cancel | Action Task Cancel
[**actionTaskExchangeMyNameActionTaskExchangePost**](MyCharactersApi.md#actiontaskexchangemynameactiontaskexchangepost) | **POST** /my/{name}/action/task/exchange | Action Task Exchange
[**actionTaskTradeMyNameActionTaskTradePost**](MyCharactersApi.md#actiontasktrademynameactiontasktradepost) | **POST** /my/{name}/action/task/trade | Action Task Trade
[**actionUnequipItemMyNameActionUnequipPost**](MyCharactersApi.md#actionunequipitemmynameactionunequippost) | **POST** /my/{name}/action/unequip | Action Unequip Item
[**actionUseItemMyNameActionUsePost**](MyCharactersApi.md#actionuseitemmynameactionusepost) | **POST** /my/{name}/action/use | Action Use Item
[**actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost**](MyCharactersApi.md#actionwithdrawbankgoldmynameactionbankwithdrawgoldpost) | **POST** /my/{name}/action/bank/withdraw/gold | Action Withdraw Bank Gold
[**actionWithdrawBankMyNameActionBankWithdrawPost**](MyCharactersApi.md#actionwithdrawbankmynameactionbankwithdrawpost) | **POST** /my/{name}/action/bank/withdraw | Action Withdraw Bank
[**getAllCharactersLogsMyLogsGet**](MyCharactersApi.md#getallcharacterslogsmylogsget) | **GET** /my/logs | Get All Characters Logs
[**getMyCharactersMyCharactersGet**](MyCharactersApi.md#getmycharactersmycharactersget) | **GET** /my/characters | Get My Characters


# **actionAcceptNewTaskMyNameActionTaskNewPost**
> TaskResponseSchema actionAcceptNewTaskMyNameActionTaskNewPost(name)

Action Accept New Task

Accepting a new task.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionAcceptNewTaskMyNameActionTaskNewPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionAcceptNewTaskMyNameActionTaskNewPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**TaskResponseSchema**](TaskResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionBuyBankExpansionMyNameActionBankBuyExpansionPost**
> BankExtensionTransactionResponseSchema actionBuyBankExpansionMyNameActionBankBuyExpansionPost(name)

Action Buy Bank Expansion

Buy a 20 slots bank expansion.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionBuyBankExpansionMyNameActionBankBuyExpansionPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionBuyBankExpansionMyNameActionBankBuyExpansionPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**BankExtensionTransactionResponseSchema**](BankExtensionTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionChristmasExchangeMyNameActionChristmasExchangePost**
> RewardDataResponseSchema actionChristmasExchangeMyNameActionChristmasExchangePost(name)

Action Christmas Exchange

Exchange 1 gift for a random reward.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionChristmasExchangeMyNameActionChristmasExchangePost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionChristmasExchangeMyNameActionChristmasExchangePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**RewardDataResponseSchema**](RewardDataResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionCompleteTaskMyNameActionTaskCompletePost**
> RewardDataResponseSchema actionCompleteTaskMyNameActionTaskCompletePost(name)

Action Complete Task

Complete a task.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionCompleteTaskMyNameActionTaskCompletePost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionCompleteTaskMyNameActionTaskCompletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**RewardDataResponseSchema**](RewardDataResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionCraftingMyNameActionCraftingPost**
> SkillResponseSchema actionCraftingMyNameActionCraftingPost(name, craftingSchema)

Action Crafting

Crafting an item. The character must be on a map with a workshop.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final CraftingSchema craftingSchema = ; // CraftingSchema | 

try {
    final response = api.actionCraftingMyNameActionCraftingPost(name, craftingSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionCraftingMyNameActionCraftingPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **craftingSchema** | [**CraftingSchema**](CraftingSchema.md)|  | 

### Return type

[**SkillResponseSchema**](SkillResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionDeleteItemMyNameActionDeletePost**
> DeleteItemResponseSchema actionDeleteItemMyNameActionDeletePost(name, simpleItemSchema)

Action Delete Item

Delete an item from your character's inventory.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final SimpleItemSchema simpleItemSchema = ; // SimpleItemSchema | 

try {
    final response = api.actionDeleteItemMyNameActionDeletePost(name, simpleItemSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionDeleteItemMyNameActionDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **simpleItemSchema** | [**SimpleItemSchema**](SimpleItemSchema.md)|  | 

### Return type

[**DeleteItemResponseSchema**](DeleteItemResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionDepositBankGoldMyNameActionBankDepositGoldPost**
> BankGoldTransactionResponseSchema actionDepositBankGoldMyNameActionBankDepositGoldPost(name, depositWithdrawGoldSchema)

Action Deposit Bank Gold

Deposit gold in a bank on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final DepositWithdrawGoldSchema depositWithdrawGoldSchema = ; // DepositWithdrawGoldSchema | 

try {
    final response = api.actionDepositBankGoldMyNameActionBankDepositGoldPost(name, depositWithdrawGoldSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionDepositBankGoldMyNameActionBankDepositGoldPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **depositWithdrawGoldSchema** | [**DepositWithdrawGoldSchema**](DepositWithdrawGoldSchema.md)|  | 

### Return type

[**BankGoldTransactionResponseSchema**](BankGoldTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionDepositBankMyNameActionBankDepositPost**
> BankItemTransactionResponseSchema actionDepositBankMyNameActionBankDepositPost(name, simpleItemSchema)

Action Deposit Bank

Deposit an item in a bank on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final SimpleItemSchema simpleItemSchema = ; // SimpleItemSchema | 

try {
    final response = api.actionDepositBankMyNameActionBankDepositPost(name, simpleItemSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionDepositBankMyNameActionBankDepositPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **simpleItemSchema** | [**SimpleItemSchema**](SimpleItemSchema.md)|  | 

### Return type

[**BankItemTransactionResponseSchema**](BankItemTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionEquipItemMyNameActionEquipPost**
> EquipmentResponseSchema actionEquipItemMyNameActionEquipPost(name, equipSchema)

Action Equip Item

Equip an item on your character.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final EquipSchema equipSchema = ; // EquipSchema | 

try {
    final response = api.actionEquipItemMyNameActionEquipPost(name, equipSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionEquipItemMyNameActionEquipPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **equipSchema** | [**EquipSchema**](EquipSchema.md)|  | 

### Return type

[**EquipmentResponseSchema**](EquipmentResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionFightMyNameActionFightPost**
> CharacterFightResponseSchema actionFightMyNameActionFightPost(name)

Action Fight

Start a fight against a monster on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionFightMyNameActionFightPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionFightMyNameActionFightPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**CharacterFightResponseSchema**](CharacterFightResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionGatheringMyNameActionGatheringPost**
> SkillResponseSchema actionGatheringMyNameActionGatheringPost(name)

Action Gathering

Harvest a resource on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionGatheringMyNameActionGatheringPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionGatheringMyNameActionGatheringPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**SkillResponseSchema**](SkillResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionGeBuyItemMyNameActionGrandexchangeBuyPost**
> GETransactionResponseSchema actionGeBuyItemMyNameActionGrandexchangeBuyPost(name, gEBuyOrderSchema)

Action Ge Buy Item

Buy an item at the Grand Exchange on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final GEBuyOrderSchema gEBuyOrderSchema = ; // GEBuyOrderSchema | 

try {
    final response = api.actionGeBuyItemMyNameActionGrandexchangeBuyPost(name, gEBuyOrderSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionGeBuyItemMyNameActionGrandexchangeBuyPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **gEBuyOrderSchema** | [**GEBuyOrderSchema**](GEBuyOrderSchema.md)|  | 

### Return type

[**GETransactionResponseSchema**](GETransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost**
> GETransactionResponseSchema actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost(name, gECancelOrderSchema)

Action Ge Cancel Sell Order

Cancel a sell order at the Grand Exchange on the character's map.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final GECancelOrderSchema gECancelOrderSchema = ; // GECancelOrderSchema | 

try {
    final response = api.actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost(name, gECancelOrderSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionGeCancelSellOrderMyNameActionGrandexchangeCancelPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **gECancelOrderSchema** | [**GECancelOrderSchema**](GECancelOrderSchema.md)|  | 

### Return type

[**GETransactionResponseSchema**](GETransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionGeCreateSellOrderMyNameActionGrandexchangeSellPost**
> GECreateOrderTransactionResponseSchema actionGeCreateSellOrderMyNameActionGrandexchangeSellPost(name, gEOrderCreationrSchema)

Action Ge Create Sell Order

Create a sell order at the Grand Exchange on the character's map. Please note that a 5% sales tax is charged.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final GEOrderCreationrSchema gEOrderCreationrSchema = ; // GEOrderCreationrSchema | 

try {
    final response = api.actionGeCreateSellOrderMyNameActionGrandexchangeSellPost(name, gEOrderCreationrSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionGeCreateSellOrderMyNameActionGrandexchangeSellPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **gEOrderCreationrSchema** | [**GEOrderCreationrSchema**](GEOrderCreationrSchema.md)|  | 

### Return type

[**GECreateOrderTransactionResponseSchema**](GECreateOrderTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionMoveMyNameActionMovePost**
> CharacterMovementResponseSchema actionMoveMyNameActionMovePost(name, destinationSchema)

Action Move

Moves a character on the map using the map's X and Y position.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final DestinationSchema destinationSchema = ; // DestinationSchema | 

try {
    final response = api.actionMoveMyNameActionMovePost(name, destinationSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionMoveMyNameActionMovePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **destinationSchema** | [**DestinationSchema**](DestinationSchema.md)|  | 

### Return type

[**CharacterMovementResponseSchema**](CharacterMovementResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionRecyclingMyNameActionRecyclingPost**
> RecyclingResponseSchema actionRecyclingMyNameActionRecyclingPost(name, recyclingSchema)

Action Recycling

Recycling an item. The character must be on a map with a workshop (only for equipments and weapons).

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final RecyclingSchema recyclingSchema = ; // RecyclingSchema | 

try {
    final response = api.actionRecyclingMyNameActionRecyclingPost(name, recyclingSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionRecyclingMyNameActionRecyclingPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **recyclingSchema** | [**RecyclingSchema**](RecyclingSchema.md)|  | 

### Return type

[**RecyclingResponseSchema**](RecyclingResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionRestMyNameActionRestPost**
> CharacterRestResponseSchema actionRestMyNameActionRestPost(name)

Action Rest

Recovers hit points by resting. (1 second per 5 HP, minimum 3 seconds)

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionRestMyNameActionRestPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionRestMyNameActionRestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**CharacterRestResponseSchema**](CharacterRestResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionTaskCancelMyNameActionTaskCancelPost**
> TaskCancelledResponseSchema actionTaskCancelMyNameActionTaskCancelPost(name)

Action Task Cancel

Cancel a task for 1 tasks coin.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionTaskCancelMyNameActionTaskCancelPost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionTaskCancelMyNameActionTaskCancelPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**TaskCancelledResponseSchema**](TaskCancelledResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionTaskExchangeMyNameActionTaskExchangePost**
> RewardDataResponseSchema actionTaskExchangeMyNameActionTaskExchangePost(name)

Action Task Exchange

Exchange 6 tasks coins for a random reward. Rewards are exclusive items or resources.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.

try {
    final response = api.actionTaskExchangeMyNameActionTaskExchangePost(name);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionTaskExchangeMyNameActionTaskExchangePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 

### Return type

[**RewardDataResponseSchema**](RewardDataResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionTaskTradeMyNameActionTaskTradePost**
> TaskTradeResponseSchema actionTaskTradeMyNameActionTaskTradePost(name, simpleItemSchema)

Action Task Trade

Trading items with a Tasks Master.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final SimpleItemSchema simpleItemSchema = ; // SimpleItemSchema | 

try {
    final response = api.actionTaskTradeMyNameActionTaskTradePost(name, simpleItemSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionTaskTradeMyNameActionTaskTradePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **simpleItemSchema** | [**SimpleItemSchema**](SimpleItemSchema.md)|  | 

### Return type

[**TaskTradeResponseSchema**](TaskTradeResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionUnequipItemMyNameActionUnequipPost**
> EquipmentResponseSchema actionUnequipItemMyNameActionUnequipPost(name, unequipSchema)

Action Unequip Item

Unequip an item on your character.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final UnequipSchema unequipSchema = ; // UnequipSchema | 

try {
    final response = api.actionUnequipItemMyNameActionUnequipPost(name, unequipSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionUnequipItemMyNameActionUnequipPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **unequipSchema** | [**UnequipSchema**](UnequipSchema.md)|  | 

### Return type

[**EquipmentResponseSchema**](EquipmentResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionUseItemMyNameActionUsePost**
> UseItemResponseSchema actionUseItemMyNameActionUsePost(name, simpleItemSchema)

Action Use Item

Use an item as a consumable.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final SimpleItemSchema simpleItemSchema = ; // SimpleItemSchema | 

try {
    final response = api.actionUseItemMyNameActionUsePost(name, simpleItemSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionUseItemMyNameActionUsePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **simpleItemSchema** | [**SimpleItemSchema**](SimpleItemSchema.md)|  | 

### Return type

[**UseItemResponseSchema**](UseItemResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost**
> BankGoldTransactionResponseSchema actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost(name, depositWithdrawGoldSchema)

Action Withdraw Bank Gold

Withdraw gold from your bank.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final DepositWithdrawGoldSchema depositWithdrawGoldSchema = ; // DepositWithdrawGoldSchema | 

try {
    final response = api.actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost(name, depositWithdrawGoldSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionWithdrawBankGoldMyNameActionBankWithdrawGoldPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **depositWithdrawGoldSchema** | [**DepositWithdrawGoldSchema**](DepositWithdrawGoldSchema.md)|  | 

### Return type

[**BankGoldTransactionResponseSchema**](BankGoldTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **actionWithdrawBankMyNameActionBankWithdrawPost**
> BankItemTransactionResponseSchema actionWithdrawBankMyNameActionBankWithdrawPost(name, simpleItemSchema)

Action Withdraw Bank

Take an item from your bank and put it in the character's inventory.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final String name = name_example; // String | Name of your character.
final SimpleItemSchema simpleItemSchema = ; // SimpleItemSchema | 

try {
    final response = api.actionWithdrawBankMyNameActionBankWithdrawPost(name, simpleItemSchema);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->actionWithdrawBankMyNameActionBankWithdrawPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**| Name of your character. | 
 **simpleItemSchema** | [**SimpleItemSchema**](SimpleItemSchema.md)|  | 

### Return type

[**BankItemTransactionResponseSchema**](BankItemTransactionResponseSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getAllCharactersLogsMyLogsGet**
> DataPageLogSchema getAllCharactersLogsMyLogsGet(page, size)

Get All Characters Logs

History of the last 100 actions of all your characters.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();
final int page = 56; // int | Page number
final int size = 56; // int | Page size

try {
    final response = api.getAllCharactersLogsMyLogsGet(page, size);
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->getAllCharactersLogsMyLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**| Page number | [optional] [default to 1]
 **size** | **int**| Page size | [optional] [default to 50]

### Return type

[**DataPageLogSchema**](DataPageLogSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyCharactersMyCharactersGet**
> MyCharactersListSchema getMyCharactersMyCharactersGet()

Get My Characters

List of your characters.

### Example
```dart
import 'package:artifacts_api/api.dart';

final api = ArtifactsApi().getMyCharactersApi();

try {
    final response = api.getMyCharactersMyCharactersGet();
    print(response);
} catch on DioException (e) {
    print('Exception when calling MyCharactersApi->getMyCharactersMyCharactersGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**MyCharactersListSchema**](MyCharactersListSchema.md)

### Authorization

[JWTBearer](../README.md#JWTBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

