# openapi.api.ConversationOrchestrationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminRuntimeOrchestrationAsrRecognizePost**](ConversationOrchestrationApi.md#adminruntimeorchestrationasrrecognizepost) | **POST** /admin/runtime/orchestration/asr/recognize | 
[**adminRuntimeOrchestrationBindingPost**](ConversationOrchestrationApi.md#adminruntimeorchestrationbindingpost) | **POST** /admin/runtime/orchestration/binding | 
[**adminRuntimeOrchestrationLlmChatPost**](ConversationOrchestrationApi.md#adminruntimeorchestrationllmchatpost) | **POST** /admin/runtime/orchestration/llm/chat | 
[**adminRuntimeOrchestrationPlanPost**](ConversationOrchestrationApi.md#adminruntimeorchestrationplanpost) | **POST** /admin/runtime/orchestration/plan | 
[**adminRuntimeOrchestrationTtsSynthesizePost**](ConversationOrchestrationApi.md#adminruntimeorchestrationttssynthesizepost) | **POST** /admin/runtime/orchestration/tts/synthesize | 


# **adminRuntimeOrchestrationAsrRecognizePost**
> AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto adminRuntimeOrchestrationAsrRecognizePost(aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConversationOrchestrationApi();
final AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto = ; // AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto | 

try {
    final response = api.adminRuntimeOrchestrationAsrRecognizePost(aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConversationOrchestrationApi->adminRuntimeOrchestrationAsrRecognizePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto** | [**AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto**](AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto**](AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminRuntimeOrchestrationBindingPost**
> AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto adminRuntimeOrchestrationBindingPost(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConversationOrchestrationApi();
final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto = ; // AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto | 

try {
    final response = api.adminRuntimeOrchestrationBindingPost(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConversationOrchestrationApi->adminRuntimeOrchestrationBindingPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto** | [**AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto**](AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto**](AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminRuntimeOrchestrationLlmChatPost**
> AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto adminRuntimeOrchestrationLlmChatPost(aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConversationOrchestrationApi();
final AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto = ; // AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto | 

try {
    final response = api.adminRuntimeOrchestrationLlmChatPost(aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConversationOrchestrationApi->adminRuntimeOrchestrationLlmChatPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto** | [**AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto**](AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto**](AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminRuntimeOrchestrationPlanPost**
> AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto adminRuntimeOrchestrationPlanPost(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConversationOrchestrationApi();
final AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto = ; // AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto | 

try {
    final response = api.adminRuntimeOrchestrationPlanPost(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConversationOrchestrationApi->adminRuntimeOrchestrationPlanPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto** | [**AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto**](AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto**](AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminRuntimeOrchestrationTtsSynthesizePost**
> AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto adminRuntimeOrchestrationTtsSynthesizePost(aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConversationOrchestrationApi();
final AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto = ; // AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto | 

try {
    final response = api.adminRuntimeOrchestrationTtsSynthesizePost(aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConversationOrchestrationApi->adminRuntimeOrchestrationTtsSynthesizePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto** | [**AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto**](AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto**](AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

