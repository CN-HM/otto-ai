# openapi.api.AgentRoleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAgentRolesAllGet**](AgentRoleApi.md#adminagentrolesallget) | **GET** /admin/agent-roles/all | 
[**adminAgentRolesBindingOptionsGet**](AgentRoleApi.md#adminagentrolesbindingoptionsget) | **GET** /admin/agent-roles/binding-options | 
[**adminAgentRolesGet**](AgentRoleApi.md#adminagentrolesget) | **GET** /admin/agent-roles | 
[**adminAgentRolesIconOptionsGet**](AgentRoleApi.md#adminagentrolesiconoptionsget) | **GET** /admin/agent-roles/icon-options | 
[**adminAgentRolesIdDelete**](AgentRoleApi.md#adminagentrolesiddelete) | **DELETE** /admin/agent-roles/{id} | 
[**adminAgentRolesIdGet**](AgentRoleApi.md#adminagentrolesidget) | **GET** /admin/agent-roles/{id} | 
[**adminAgentRolesIdPublishPost**](AgentRoleApi.md#adminagentrolesidpublishpost) | **POST** /admin/agent-roles/{id}/publish | 
[**adminAgentRolesIdPut**](AgentRoleApi.md#adminagentrolesidput) | **PUT** /admin/agent-roles/{id} | 
[**adminAgentRolesIdReleasesGet**](AgentRoleApi.md#adminagentrolesidreleasesget) | **GET** /admin/agent-roles/{id}/releases | 
[**adminAgentRolesIdReleasesReleaseIdActivatePut**](AgentRoleApi.md#adminagentrolesidreleasesreleaseidactivateput) | **PUT** /admin/agent-roles/{id}/releases/{releaseId}/activate | 
[**adminAgentRolesPost**](AgentRoleApi.md#adminagentrolespost) | **POST** /admin/agent-roles | 
[**adminAgentRolesThemeOptionsGet**](AgentRoleApi.md#adminagentrolesthemeoptionsget) | **GET** /admin/agent-roles/theme-options | 
[**agentRolesCatalogGet**](AgentRoleApi.md#agentrolescatalogget) | **GET** /agent-roles/catalog | 


# **adminAgentRolesAllGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto adminAgentRolesAllGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();

try {
    final response = api.adminAgentRolesAllGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesAllGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesBindingOptionsGet**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto adminAgentRolesBindingOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();

try {
    final response = api.adminAgentRolesBindingOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesBindingOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleBindingOptionsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto adminAgentRolesGet(keyword, status, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String keyword = keyword_example; // String | 
final String status = status_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminAgentRolesGet(keyword, status, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keyword** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIconOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto adminAgentRolesIconOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();

try {
    final response = api.adminAgentRolesIconOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIconOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIdDelete**
> AiAdminInfrastructureResultSystemObject adminAgentRolesIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 

try {
    final response = api.adminAgentRolesIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdDelete: $e\n');
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

# **adminAgentRolesIdGet**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto adminAgentRolesIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 

try {
    final response = api.adminAgentRolesIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIdPublishPost**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto adminAgentRolesIdPublishPost(id, aiAdminServicesAgentRolesDtosAgentRolePublishDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 
final AiAdminServicesAgentRolesDtosAgentRolePublishDto aiAdminServicesAgentRolesDtosAgentRolePublishDto = ; // AiAdminServicesAgentRolesDtosAgentRolePublishDto | 

try {
    final response = api.adminAgentRolesIdPublishPost(id, aiAdminServicesAgentRolesDtosAgentRolePublishDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdPublishPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesAgentRolesDtosAgentRolePublishDto** | [**AiAdminServicesAgentRolesDtosAgentRolePublishDto**](AiAdminServicesAgentRolesDtosAgentRolePublishDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIdPut**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto adminAgentRolesIdPut(id, aiAdminServicesAgentRolesDtosAgentRoleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 
final AiAdminServicesAgentRolesDtosAgentRoleUpsertDto aiAdminServicesAgentRolesDtosAgentRoleUpsertDto = ; // AiAdminServicesAgentRolesDtosAgentRoleUpsertDto | 

try {
    final response = api.adminAgentRolesIdPut(id, aiAdminServicesAgentRolesDtosAgentRoleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesAgentRolesDtosAgentRoleUpsertDto** | [**AiAdminServicesAgentRolesDtosAgentRoleUpsertDto**](AiAdminServicesAgentRolesDtosAgentRoleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIdReleasesGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleReleaseDto adminAgentRolesIdReleasesGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 

try {
    final response = api.adminAgentRolesIdReleasesGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdReleasesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleReleaseDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleReleaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesIdReleasesReleaseIdActivatePut**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto adminAgentRolesIdReleasesReleaseIdActivatePut(id, releaseId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final String id = id_example; // String | 
final String releaseId = releaseId_example; // String | 

try {
    final response = api.adminAgentRolesIdReleasesReleaseIdActivatePut(id, releaseId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesIdReleasesReleaseIdActivatePut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **releaseId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleReleaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesPost**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto adminAgentRolesPost(aiAdminServicesAgentRolesDtosAgentRoleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();
final AiAdminServicesAgentRolesDtosAgentRoleUpsertDto aiAdminServicesAgentRolesDtosAgentRoleUpsertDto = ; // AiAdminServicesAgentRolesDtosAgentRoleUpsertDto | 

try {
    final response = api.adminAgentRolesPost(aiAdminServicesAgentRolesDtosAgentRoleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAgentRolesDtosAgentRoleUpsertDto** | [**AiAdminServicesAgentRolesDtosAgentRoleUpsertDto**](AiAdminServicesAgentRolesDtosAgentRoleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesThemeOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto adminAgentRolesThemeOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();

try {
    final response = api.adminAgentRolesThemeOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->adminAgentRolesThemeOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **agentRolesCatalogGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto agentRolesCatalogGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleApi();

try {
    final response = api.agentRolesCatalogGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleApi->agentRolesCatalogGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosAgentRoleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

