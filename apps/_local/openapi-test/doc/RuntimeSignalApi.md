# openapi.api.RuntimeSignalApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminRuntimeSignalsGet**](RuntimeSignalApi.md#adminruntimesignalsget) | **GET** /admin/runtime-signals | 
[**adminRuntimeSignalsIdDelete**](RuntimeSignalApi.md#adminruntimesignalsiddelete) | **DELETE** /admin/runtime-signals/{id} | 
[**adminRuntimeSignalsIdStatusPut**](RuntimeSignalApi.md#adminruntimesignalsidstatusput) | **PUT** /admin/runtime-signals/{id}/status | 


# **adminRuntimeSignalsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto adminRuntimeSignalsGet(page, limit, signalType, status, severity, keyword)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRuntimeSignalApi();
final int page = 56; // int | 
final int limit = 56; // int | 
final String signalType = signalType_example; // String | 
final String status = status_example; // String | 
final String severity = severity_example; // String | 
final String keyword = keyword_example; // String | 

try {
    final response = api.adminRuntimeSignalsGet(page, limit, signalType, status, severity, keyword);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RuntimeSignalApi->adminRuntimeSignalsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **signalType** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **severity** | **String**|  | [optional] 
 **keyword** | **String**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminRuntimeSignalsIdDelete**
> AiAdminInfrastructureResultSystemObject adminRuntimeSignalsIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRuntimeSignalApi();
final String id = id_example; // String | 

try {
    final response = api.adminRuntimeSignalsIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RuntimeSignalApi->adminRuntimeSignalsIdDelete: $e\n');
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

# **adminRuntimeSignalsIdStatusPut**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto adminRuntimeSignalsIdStatusPut(id, aiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRuntimeSignalApi();
final String id = id_example; // String | 
final AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto aiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto = ; // AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto | 

try {
    final response = api.adminRuntimeSignalsIdStatusPut(id, aiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RuntimeSignalApi->adminRuntimeSignalsIdStatusPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto** | [**AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto**](AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

