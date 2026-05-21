# openapi.api.RoleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**systemRolesAllGet**](RoleApi.md#systemrolesallget) | **GET** /system/roles/all | 
[**systemRolesGet**](RoleApi.md#systemrolesget) | **GET** /system/roles | 
[**systemRolesIdDelete**](RoleApi.md#systemrolesiddelete) | **DELETE** /system/roles/{id} | 
[**systemRolesIdMenusGet**](RoleApi.md#systemrolesidmenusget) | **GET** /system/roles/{id}/menus | 
[**systemRolesIdMenusPut**](RoleApi.md#systemrolesidmenusput) | **PUT** /system/roles/{id}/menus | 
[**systemRolesIdPut**](RoleApi.md#systemrolesidput) | **PUT** /system/roles/{id} | 
[**systemRolesMenuTreeGet**](RoleApi.md#systemrolesmenutreeget) | **GET** /system/roles/menu-tree | 
[**systemRolesPost**](RoleApi.md#systemrolespost) | **POST** /system/roles | 
[**systemRolesUserUserIdGet**](RoleApi.md#systemrolesuseruseridget) | **GET** /system/roles/user/{userId} | 
[**systemRolesUserUserIdPut**](RoleApi.md#systemrolesuseruseridput) | **PUT** /system/roles/user/{userId} | 


# **systemRolesAllGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto systemRolesAllGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();

try {
    final response = api.systemRolesAllGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto systemRolesGet(name, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final String name = name_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.systemRolesGet(name, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesIdDelete**
> AiAdminInfrastructureResultSystemObject systemRolesIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int id = 789; // int | 

try {
    final response = api.systemRolesIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesIdDelete: $e\n');
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

# **systemRolesIdMenusGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 systemRolesIdMenusGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int id = 789; // int | 

try {
    final response = api.systemRolesIdMenusGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesIdMenusGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64**](AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesIdMenusPut**
> AiAdminInfrastructureResultSystemObject systemRolesIdMenusPut(id, aiAdminServicesRbacDtosRoleMenuAssignDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int id = 789; // int | 
final AiAdminServicesRbacDtosRoleMenuAssignDto aiAdminServicesRbacDtosRoleMenuAssignDto = ; // AiAdminServicesRbacDtosRoleMenuAssignDto | 

try {
    final response = api.systemRolesIdMenusPut(id, aiAdminServicesRbacDtosRoleMenuAssignDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesIdMenusPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **aiAdminServicesRbacDtosRoleMenuAssignDto** | [**AiAdminServicesRbacDtosRoleMenuAssignDto**](AiAdminServicesRbacDtosRoleMenuAssignDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesIdPut**
> AiAdminInfrastructureResultSystemObject systemRolesIdPut(id, aiAdminServicesRbacDtosRoleUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int id = 789; // int | 
final AiAdminServicesRbacDtosRoleUpdateDto aiAdminServicesRbacDtosRoleUpdateDto = ; // AiAdminServicesRbacDtosRoleUpdateDto | 

try {
    final response = api.systemRolesIdPut(id, aiAdminServicesRbacDtosRoleUpdateDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **int**|  | 
 **aiAdminServicesRbacDtosRoleUpdateDto** | [**AiAdminServicesRbacDtosRoleUpdateDto**](AiAdminServicesRbacDtosRoleUpdateDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesMenuTreeGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosMenuTreeDto systemRolesMenuTreeGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();

try {
    final response = api.systemRolesMenuTreeGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesMenuTreeGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosMenuTreeDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosMenuTreeDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesPost**
> AiAdminInfrastructureResultSystemObject systemRolesPost(aiAdminServicesRbacDtosRoleCreateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final AiAdminServicesRbacDtosRoleCreateDto aiAdminServicesRbacDtosRoleCreateDto = ; // AiAdminServicesRbacDtosRoleCreateDto | 

try {
    final response = api.systemRolesPost(aiAdminServicesRbacDtosRoleCreateDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRbacDtosRoleCreateDto** | [**AiAdminServicesRbacDtosRoleCreateDto**](AiAdminServicesRbacDtosRoleCreateDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesUserUserIdGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64 systemRolesUserUserIdGet(userId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int userId = 789; // int | 

try {
    final response = api.systemRolesUserUserIdGet(userId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesUserUserIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64**](AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **systemRolesUserUserIdPut**
> AiAdminInfrastructureResultSystemObject systemRolesUserUserIdPut(userId, aiAdminServicesRbacDtosUserRoleAssignDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getRoleApi();
final int userId = 789; // int | 
final AiAdminServicesRbacDtosUserRoleAssignDto aiAdminServicesRbacDtosUserRoleAssignDto = ; // AiAdminServicesRbacDtosUserRoleAssignDto | 

try {
    final response = api.systemRolesUserUserIdPut(userId, aiAdminServicesRbacDtosUserRoleAssignDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling RoleApi->systemRolesUserUserIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **userId** | **int**|  | 
 **aiAdminServicesRbacDtosUserRoleAssignDto** | [**AiAdminServicesRbacDtosUserRoleAssignDto**](AiAdminServicesRbacDtosUserRoleAssignDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

