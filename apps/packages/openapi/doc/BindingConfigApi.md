# openapi.api.BindingConfigApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminBindingConfigsIntegrationOptionsGet**](BindingConfigApi.md#adminbindingconfigsintegrationoptionsget) | **GET** /admin/binding-configs/integration-options | 
[**adminBindingConfigsKindGet**](BindingConfigApi.md#adminbindingconfigskindget) | **GET** /admin/binding-configs/{kind} | 
[**adminBindingConfigsKindIdDelete**](BindingConfigApi.md#adminbindingconfigskindiddelete) | **DELETE** /admin/binding-configs/{kind}/{id} | 
[**adminBindingConfigsKindIdGet**](BindingConfigApi.md#adminbindingconfigskindidget) | **GET** /admin/binding-configs/{kind}/{id} | 
[**adminBindingConfigsKindIdPut**](BindingConfigApi.md#adminbindingconfigskindidput) | **PUT** /admin/binding-configs/{kind}/{id} | 
[**adminBindingConfigsKindPost**](BindingConfigApi.md#adminbindingconfigskindpost) | **POST** /admin/binding-configs/{kind} | 
[**adminBindingConfigsKindsGet**](BindingConfigApi.md#adminbindingconfigskindsget) | **GET** /admin/binding-configs/kinds | 


# **adminBindingConfigsIntegrationOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto adminBindingConfigsIntegrationOptionsGet(providerCode, scope)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String providerCode = providerCode_example; // String | 
final String scope = scope_example; // String | 

try {
    final response = api.adminBindingConfigsIntegrationOptionsGet(providerCode, scope);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsIntegrationOptionsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **providerCode** | **String**|  | [optional] 
 **scope** | **String**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto adminBindingConfigsKindGet(kind, keyword, status, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String kind = kind_example; // String | 
final String keyword = keyword_example; // String | 
final String status = status_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminBindingConfigsKindGet(kind, keyword, status, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kind** | **String**|  | 
 **keyword** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindIdDelete**
> AiAdminInfrastructureResultSystemObject adminBindingConfigsKindIdDelete(kind, id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String kind = kind_example; // String | 
final String id = id_example; // String | 

try {
    final response = api.adminBindingConfigsKindIdDelete(kind, id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kind** | **String**|  | 
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindIdGet**
> AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto adminBindingConfigsKindIdGet(kind, id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String kind = kind_example; // String | 
final String id = id_example; // String | 

try {
    final response = api.adminBindingConfigsKindIdGet(kind, id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kind** | **String**|  | 
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto**](AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindIdPut**
> AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto adminBindingConfigsKindIdPut(kind, id, aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String kind = kind_example; // String | 
final String id = id_example; // String | 
final AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto = ; // AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto | 

try {
    final response = api.adminBindingConfigsKindIdPut(kind, id, aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kind** | **String**|  | 
 **id** | **String**|  | 
 **aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto** | [**AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto**](AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto**](AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindPost**
> AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto adminBindingConfigsKindPost(kind, aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();
final String kind = kind_example; // String | 
final AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto = ; // AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto | 

try {
    final response = api.adminBindingConfigsKindPost(kind, aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **kind** | **String**|  | 
 **aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto** | [**AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto**](AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto**](AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminBindingConfigsKindsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto adminBindingConfigsKindsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getBindingConfigApi();

try {
    final response = api.adminBindingConfigsKindsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling BindingConfigApi->adminBindingConfigsKindsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

