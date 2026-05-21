# openapi.api.AdminUserApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminUsersAgentsUserIdGet**](AdminUserApi.md#adminusersagentsuseridget) | **GET** /admin/users/agents/{userId} | 
[**adminUsersChangeStatusStatusPut**](AdminUserApi.md#adminuserschangestatusstatusput) | **PUT** /admin/users/changeStatus/{status} | 
[**adminUsersGet**](AdminUserApi.md#adminusersget) | **GET** /admin/users | 
[**adminUsersIdDelete**](AdminUserApi.md#adminusersiddelete) | **DELETE** /admin/users/{id} | 
[**adminUsersIdPut**](AdminUserApi.md#adminusersidput) | **PUT** /admin/users/{id} | 


# **adminUsersAgentsUserIdGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject adminUsersAgentsUserIdGet(userId, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminUserApi();
final int userId = 789; // int | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminUsersAgentsUserIdGet(userId, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminUserApi->adminUsersAgentsUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersChangeStatusStatusPut**
> AiAdminInfrastructureResultSystemObject adminUsersChangeStatusStatusPut(status, requestBody)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminUserApi();
final int status = 56; // int | 
final BuiltList<String> requestBody = ; // BuiltList<String> | 

try {
    final response = api.adminUsersChangeStatusStatusPut(status, requestBody);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminUserApi->adminUsersChangeStatusStatusPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **status** | **int**|  | 
 **requestBody** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo adminUsersGet(mobile, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminUserApi();
final String mobile = mobile_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminUsersGet(mobile, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminUserApi->adminUsersGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mobile** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersIdDelete**
> AiAdminInfrastructureResultSystemObject adminUsersIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminUserApi();
final int id = 789; // int | 

try {
    final response = api.adminUsersIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminUserApi->adminUsersIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminUsersIdPut**
> AiAdminInfrastructureResultSystemString adminUsersIdPut(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAdminUserApi();
final int id = 789; // int | 

try {
    final response = api.adminUsersIdPut(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AdminUserApi->adminUsersIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AiAdminInfrastructureResultSystemString**](AiAdminInfrastructureResultSystemString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

