# openapi.api.BillingApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**billingMeSummaryGet**](BillingApi.md#billingmesummaryget) | **GET** /billing/me/summary | 
[**billingOrdersGet**](BillingApi.md#billingordersget) | **GET** /billing/orders | 
[**billingOrdersIdCancelPost**](BillingApi.md#billingordersidcancelpost) | **POST** /billing/orders/{id}/cancel | 
[**billingOrdersIdGet**](BillingApi.md#billingordersidget) | **GET** /billing/orders/{id} | 
[**billingOrdersIdPayPost**](BillingApi.md#billingordersidpaypost) | **POST** /billing/orders/{id}/pay | 
[**billingOrdersPost**](BillingApi.md#billingorderspost) | **POST** /billing/orders | 
[**billingPlansGet**](BillingApi.md#billingplansget) | **GET** /billing/plans | 
[**billingUsageReportPost**](BillingApi.md#billingusagereportpost) | **POST** /billing/usage/report | 


# **billingMeSummaryGet**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto billingMeSummaryGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();

try {
    final response = api.billingMeSummaryGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingMeSummaryGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingOrdersGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto billingOrdersGet(status, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final String status = status_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.billingOrdersGet(status, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingOrdersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingOrdersIdCancelPost**
> AiAdminInfrastructureResultSystemObject billingOrdersIdCancelPost(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final String id = id_example; // String | 

try {
    final response = api.billingOrdersIdCancelPost(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingOrdersIdCancelPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingOrdersIdGet**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto billingOrdersIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final String id = id_example; // String | 

try {
    final response = api.billingOrdersIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingOrdersIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingOrdersIdPayPost**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderPayResultDto billingOrdersIdPayPost(id, aiAdminServicesBillingDtosBillingOrderPayDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final String id = id_example; // String | 
final AiAdminServicesBillingDtosBillingOrderPayDto aiAdminServicesBillingDtosBillingOrderPayDto = ; // AiAdminServicesBillingDtosBillingOrderPayDto | 

try {
    final response = api.billingOrdersIdPayPost(id, aiAdminServicesBillingDtosBillingOrderPayDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingOrdersIdPayPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesBillingDtosBillingOrderPayDto** | [**AiAdminServicesBillingDtosBillingOrderPayDto**](AiAdminServicesBillingDtosBillingOrderPayDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderPayResultDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderPayResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingOrdersPost**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto billingOrdersPost(aiAdminServicesBillingDtosCreateBillingOrderDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final AiAdminServicesBillingDtosCreateBillingOrderDto aiAdminServicesBillingDtosCreateBillingOrderDto = ; // AiAdminServicesBillingDtosCreateBillingOrderDto | 

try {
    final response = api.billingOrdersPost(aiAdminServicesBillingDtosCreateBillingOrderDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingOrdersPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesBillingDtosCreateBillingOrderDto** | [**AiAdminServicesBillingDtosCreateBillingOrderDto**](AiAdminServicesBillingDtosCreateBillingOrderDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **billingPlansGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto billingPlansGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();

try {
    final response = api.billingPlansGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingPlansGet: $e\n');
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

# **billingUsageReportPost**
> AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingUsageReportResultDto billingUsageReportPost(aiAdminServicesBillingDtosBillingUsageReportDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBillingApi();
final AiAdminServicesBillingDtosBillingUsageReportDto aiAdminServicesBillingDtosBillingUsageReportDto = ; // AiAdminServicesBillingDtosBillingUsageReportDto | 

try {
    final response = api.billingUsageReportPost(aiAdminServicesBillingDtosBillingUsageReportDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BillingApi->billingUsageReportPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesBillingDtosBillingUsageReportDto** | [**AiAdminServicesBillingDtosBillingUsageReportDto**](AiAdminServicesBillingDtosBillingUsageReportDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingUsageReportResultDto**](AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingUsageReportResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

