# openapi.model.AiAdminServicesAgentRolesAgentRoleRuntimeTestResultDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**sessionId** | **String** |  | [optional] 
**inputMode** | **String** |  | [optional] 
**agentRoleId** | **String** |  | [optional] 
**agentRoleCode** | **String** |  | [optional] 
**agentRoleName** | **String** |  | [optional] 
**agentRoleReleaseId** | **String** |  | [optional] 
**agentRoleVersion** | **String** |  | [optional] 
**runtimeConfigSource** | **String** |  | [optional] 
**deviceId** | **String** |  | [optional] 
**transcript** | **String** |  | [optional] 
**replyText** | **String** |  | [optional] 
**asrStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**memoryRetrievalStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**knowledgeRetrievalStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**llmStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**ttsStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**memoryExtractionStage** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestStageDto.md) |  | [optional] 
**asr** | [**AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto**](AiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto.md) |  | [optional] 
**knowledge** | [**AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto**](AiAdminServicesAgentRolesAgentRoleRuntimeTestKnowledgeDto.md) |  | [optional] 
**memoryBefore** | [**AiAdminServicesMemoryDtosMemoryRuntimeContextDto**](AiAdminServicesMemoryDtosMemoryRuntimeContextDto.md) |  | [optional] 
**llm** | [**AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto**](AiAdminServicesRuntimeExecutionDtosLlmChatResponseDto.md) |  | [optional] 
**tts** | [**AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto**](AiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto.md) |  | [optional] 
**memoryChangedCount** | **int** |  | [optional] 
**memoryAfter** | [**AiAdminServicesMemoryDtosMemoryRuntimeContextDto**](AiAdminServicesMemoryDtosMemoryRuntimeContextDto.md) |  | [optional] 
**stageTraces** | [**BuiltList&lt;AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto&gt;**](AiAdminServicesRuntimeExecutionDtosStageExecutionTraceDto.md) |  | [optional] 
**warnings** | **BuiltList&lt;String&gt;** |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


