# openapi.api.ActionRuleApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminAgentRolesAgentRoleIdActionRulesGet**](ActionRuleApi.md#adminagentrolesagentroleidactionrulesget) | **GET** /admin/agent-roles/{agentRoleId}/action-rules | 
[**adminAgentRolesAgentRoleIdActionRulesPost**](ActionRuleApi.md#adminagentrolesagentroleidactionrulespost) | **POST** /admin/agent-roles/{agentRoleId}/action-rules | 
[**adminAgentRolesAgentRoleIdActionRulesRuleIdDelete**](ActionRuleApi.md#adminagentrolesagentroleidactionrulesruleiddelete) | **DELETE** /admin/agent-roles/{agentRoleId}/action-rules/{ruleId} | 
[**adminAgentRolesAgentRoleIdActionRulesRuleIdPut**](ActionRuleApi.md#adminagentrolesagentroleidactionrulesruleidput) | **PUT** /admin/agent-roles/{agentRoleId}/action-rules/{ruleId} | 


# **adminAgentRolesAgentRoleIdActionRulesGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto adminAgentRolesAgentRoleIdActionRulesGet(agentRoleId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getActionRuleApi();
final String agentRoleId = agentRoleId_example; // String | 

try {
    final response = api.adminAgentRolesAgentRoleIdActionRulesGet(agentRoleId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ActionRuleApi->adminAgentRolesAgentRoleIdActionRulesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentRoleId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosActionRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesAgentRoleIdActionRulesPost**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto adminAgentRolesAgentRoleIdActionRulesPost(agentRoleId, aiAdminServicesAgentRolesDtosActionRuleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getActionRuleApi();
final String agentRoleId = agentRoleId_example; // String | 
final AiAdminServicesAgentRolesDtosActionRuleUpsertDto aiAdminServicesAgentRolesDtosActionRuleUpsertDto = ; // AiAdminServicesAgentRolesDtosActionRuleUpsertDto | 

try {
    final response = api.adminAgentRolesAgentRoleIdActionRulesPost(agentRoleId, aiAdminServicesAgentRolesDtosActionRuleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ActionRuleApi->adminAgentRolesAgentRoleIdActionRulesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentRoleId** | **String**|  | 
 **aiAdminServicesAgentRolesDtosActionRuleUpsertDto** | [**AiAdminServicesAgentRolesDtosActionRuleUpsertDto**](AiAdminServicesAgentRolesDtosActionRuleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesAgentRoleIdActionRulesRuleIdDelete**
> AiAdminInfrastructureResultSystemObject adminAgentRolesAgentRoleIdActionRulesRuleIdDelete(agentRoleId, ruleId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getActionRuleApi();
final String agentRoleId = agentRoleId_example; // String | 
final String ruleId = ruleId_example; // String | 

try {
    final response = api.adminAgentRolesAgentRoleIdActionRulesRuleIdDelete(agentRoleId, ruleId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ActionRuleApi->adminAgentRolesAgentRoleIdActionRulesRuleIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentRoleId** | **String**|  | 
 **ruleId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminAgentRolesAgentRoleIdActionRulesRuleIdPut**
> AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto adminAgentRolesAgentRoleIdActionRulesRuleIdPut(agentRoleId, ruleId, aiAdminServicesAgentRolesDtosActionRuleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getActionRuleApi();
final String agentRoleId = agentRoleId_example; // String | 
final String ruleId = ruleId_example; // String | 
final AiAdminServicesAgentRolesDtosActionRuleUpsertDto aiAdminServicesAgentRolesDtosActionRuleUpsertDto = ; // AiAdminServicesAgentRolesDtosActionRuleUpsertDto | 

try {
    final response = api.adminAgentRolesAgentRoleIdActionRulesRuleIdPut(agentRoleId, ruleId, aiAdminServicesAgentRolesDtosActionRuleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ActionRuleApi->adminAgentRolesAgentRoleIdActionRulesRuleIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentRoleId** | **String**|  | 
 **ruleId** | **String**|  | 
 **aiAdminServicesAgentRolesDtosActionRuleUpsertDto** | [**AiAdminServicesAgentRolesDtosActionRuleUpsertDto**](AiAdminServicesAgentRolesDtosActionRuleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto**](AiAdminInfrastructureResultAiAdminServicesAgentRolesDtosActionRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

