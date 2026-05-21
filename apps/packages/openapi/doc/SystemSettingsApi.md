# openapi.api.SystemSettingsApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminParamsSettingsGet**](SystemSettingsApi.md#adminparamssettingsget) | **GET** /admin/params/settings | 
[**adminParamsSettingsPut**](SystemSettingsApi.md#adminparamssettingsput) | **PUT** /admin/params/settings | 


# **adminParamsSettingsGet**
> AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto adminParamsSettingsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSystemSettingsApi();

try {
    final response = api.adminParamsSettingsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling SystemSettingsApi->adminParamsSettingsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto**](AiAdminInfrastructureResultAiAdminServicesAdminDtosAdminSystemSettingsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminParamsSettingsPut**
> AiAdminInfrastructureResultSystemObject adminParamsSettingsPut(aiAdminServicesAdminDtosAdminSystemSettingsDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getSystemSettingsApi();
final AiAdminServicesAdminDtosAdminSystemSettingsDto aiAdminServicesAdminDtosAdminSystemSettingsDto = ; // AiAdminServicesAdminDtosAdminSystemSettingsDto | 

try {
    final response = api.adminParamsSettingsPut(aiAdminServicesAdminDtosAdminSystemSettingsDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling SystemSettingsApi->adminParamsSettingsPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAdminDtosAdminSystemSettingsDto** | [**AiAdminServicesAdminDtosAdminSystemSettingsDto**](AiAdminServicesAdminDtosAdminSystemSettingsDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

