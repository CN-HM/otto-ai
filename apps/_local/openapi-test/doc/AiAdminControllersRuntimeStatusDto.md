# openapi.model.AiAdminControllersRuntimeStatusDto

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**nodeId** | **String** |  | [optional] 
**runtimeEnabled** | **bool** |  | [optional] 
**nodeStartedAtUtc** | [**DateTime**](DateTime.md) |  | [optional] 
**onlineDeviceCount** | **int** |  | [optional] 
**activeConversationCount** | **int** |  | [optional] 
**aliveConversationCount** | **int** |  | [optional] 
**udpSessionCount** | **int** |  | [optional] 
**localSpeechIdleTimeoutMs** | **int** |  | [optional] 
**services** | [**BuiltList&lt;AiAdminControllersRuntimeServiceStatusDto&gt;**](AiAdminControllersRuntimeServiceStatusDto.md) |  | [optional] 
**conversationTrace** | [**AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto**](AiAdminServicesRuntimeConversationRuntimeTraceSnapshotDto.md) |  | [optional] 
**readiness** | [**AiAdminServicesRuntimeRuntimeReadinessSnapshotDto**](AiAdminServicesRuntimeRuntimeReadinessSnapshotDto.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


