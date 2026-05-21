# openapi.api.AgentRoleRuntimeTestApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAgentRolesRuntimeTestFinalizePost**](AgentRoleRuntimeTestApi.md#adminagentrolesruntimetestfinalizepost) | **POST** /admin/agent-roles/runtime-test/finalize | 
[**adminAgentRolesRuntimeTestPost**](AgentRoleRuntimeTestApi.md#adminagentrolesruntimetestpost) | **POST** /admin/agent-roles/runtime-test | 


# **adminAgentRolesRuntimeTestFinalizePost**
> AiAdminInfrastructureResultSystemObject adminAgentRolesRuntimeTestFinalizePost(aiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleRuntimeTestApi();
final AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto aiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto = ; // AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto | 

try {
    final response = api.adminAgentRolesRuntimeTestFinalizePost(aiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleRuntimeTestApi->adminAgentRolesRuntimeTestFinalizePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto** | [**AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto**](AiAdminControllersAgentRoleRuntimeTestFinalizeRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesRuntimeTestPost**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto adminAgentRolesRuntimeTestPost(aiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAgentRoleRuntimeTestApi();
final AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto aiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto = ; // AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto | 

try {
    final response = api.adminAgentRolesRuntimeTestPost(aiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AgentRoleRuntimeTestApi->adminAgentRolesRuntimeTestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

