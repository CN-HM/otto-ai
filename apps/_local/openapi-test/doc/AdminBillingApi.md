# openapi.api.AdminBillingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminBillingOrdersGet**](AdminBillingApi.md#adminbillingordersget) | **GET** /admin/billing/orders | 
[**adminBillingOrdersIdMarkPaidPost**](AdminBillingApi.md#adminbillingordersidmarkpaidpost) | **POST** /admin/billing/orders/{id}/mark-paid | 
[**adminBillingPlansGet**](AdminBillingApi.md#adminbillingplansget) | **GET** /admin/billing/plans | 
[**adminBillingSubscriptionsGet**](AdminBillingApi.md#adminbillingsubscriptionsget) | **GET** /admin/billing/subscriptions | 
[**adminBillingUsageGet**](AdminBillingApi.md#adminbillingusageget) | **GET** /admin/billing/usage | 
[**adminBillingUsersUserIdGrantTokensPost**](AdminBillingApi.md#adminbillingusersuseridgranttokenspost) | **POST** /admin/billing/users/{userId}/grant-tokens | 
[**adminBillingUsersUserIdSummaryGet**](AdminBillingApi.md#adminbillingusersuseridsummaryget) | **GET** /admin/billing/users/{userId}/summary | 


# **adminBillingOrdersGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto adminBillingOrdersGet(keyword, status, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final String keyword = keyword_example; // String | 
final String status = status_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminBillingOrdersGet(keyword, status, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingOrdersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyword** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingOrdersIdMarkPaidPost**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto adminBillingOrdersIdMarkPaidPost(id, aiAdminServicesBillingDtosAdminMarkOrderPaidDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final String id = id_example; // String | 
final AiAdminServicesBillingDtosAdminMarkOrderPaidDto aiAdminServicesBillingDtosAdminMarkOrderPaidDto = ; // AiAdminServicesBillingDtosAdminMarkOrderPaidDto | 

try {
    final response = api.adminBillingOrdersIdMarkPaidPost(id, aiAdminServicesBillingDtosAdminMarkOrderPaidDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingOrdersIdMarkPaidPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesBillingDtosAdminMarkOrderPaidDto** | [**AiAdminServicesBillingDtosAdminMarkOrderPaidDto**](AiAdminServicesBillingDtosAdminMarkOrderPaidDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingPlansGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto adminBillingPlansGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();

try {
    final response = api.adminBillingPlansGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingPlansGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingSubscriptionsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto adminBillingSubscriptionsGet(mobile, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final String mobile = mobile_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminBillingSubscriptionsGet(mobile, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingSubscriptionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mobile** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingUsageGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto adminBillingUsageGet(keyword, serviceType, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final String keyword = keyword_example; // String | 
final String serviceType = serviceType_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminBillingUsageGet(keyword, serviceType, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingUsageGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyword** | **String**|  | [optional] 
 **serviceType** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingUsersUserIdGrantTokensPost**
> AiAdminInfrastructureResultSystemObject adminBillingUsersUserIdGrantTokensPost(userId, aiAdminServicesBillingDtosManualGrantTokensDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final int userId = 789; // int | 
final AiAdminServicesBillingDtosManualGrantTokensDto aiAdminServicesBillingDtosManualGrantTokensDto = ; // AiAdminServicesBillingDtosManualGrantTokensDto | 

try {
    final response = api.adminBillingUsersUserIdGrantTokensPost(userId, aiAdminServicesBillingDtosManualGrantTokensDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingUsersUserIdGrantTokensPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **aiAdminServicesBillingDtosManualGrantTokensDto** | [**AiAdminServicesBillingDtosManualGrantTokensDto**](AiAdminServicesBillingDtosManualGrantTokensDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBillingUsersUserIdSummaryGet**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto adminBillingUsersUserIdSummaryGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminBillingApi();
final int userId = 789; // int | 

try {
    final response = api.adminBillingUsersUserIdSummaryGet(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminBillingApi->adminBillingUsersUserIdSummaryGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

