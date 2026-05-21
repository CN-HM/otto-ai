# openapi.model.AiAdminServicesAdminDtosAuditLogPageItemVo

## Load the model package
```dart
import 'package:openapi/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**applicationName** | **String** |  | [optional] 
**operatorId** | **String** |  | [optional] 
**userName** | **String** |  | [optional] 
**clientIpAddress** | **String** |  | [optional] 
**browserInfo** | **String** |  | [optional] 
**correlationId** | **String** |  | [optional] 
**httpMethod** | **String** |  | [optional] 
**httpStatusCode** | **int** |  | [optional] 
**url** | **String** |  | [optional] 
**executionTime** | [**DateTime**](DateTime.md) |  | [optional] 
**executionDuration** | **int** |  | [optional] 
**hasException** | **bool** |  | [optional] 
**exceptions** | **String** |  | [optional] 
**comments** | **String** |  | [optional] 
**actionCount** | **int** |  | [optional] 
**entityChangeCount** | **int** |  | [optional] 
**actions** | [**BuiltList&lt;AiAdminServicesAdminDtosAuditLogActionVo&gt;**](AiAdminServicesAdminDtosAuditLogActionVo.md) |  | [optional] 
**entityChanges** | [**BuiltList&lt;AiAdminServicesAdminDtosAuditEntityChangeVo&gt;**](AiAdminServicesAdminDtosAuditEntityChangeVo.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


