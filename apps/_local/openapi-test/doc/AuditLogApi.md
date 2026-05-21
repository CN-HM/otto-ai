# openapi.api.AuditLogApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAuditLogsGet**](AuditLogApi.md#adminauditlogsget) | **GET** /admin/audit-logs | 


# **adminAuditLogsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo adminAuditLogsGet(keyword, method, result, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuditLogApi();
final String keyword = keyword_example; // String | 
final String method = method_example; // String | 
final String result = result_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminAuditLogsGet(keyword, method, result, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuditLogApi->adminAuditLogsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyword** | **String**|  | [optional] 
 **method** | **String**|  | [optional] 
 **result** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

