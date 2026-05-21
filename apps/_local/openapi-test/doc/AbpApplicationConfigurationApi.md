# openapi.api.AbpApplicationConfigurationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAbpApplicationConfigurationGet**](AbpApplicationConfigurationApi.md#apiabpapplicationconfigurationget) | **GET** /api/abp/application-configuration | 


# **apiAbpApplicationConfigurationGet**
> VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto apiAbpApplicationConfigurationGet(includeLocalizationResources)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAbpApplicationConfigurationApi();
final bool includeLocalizationResources = true; // bool | 

try {
    final response = api.apiAbpApplicationConfigurationGet(includeLocalizationResources);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AbpApplicationConfigurationApi->apiAbpApplicationConfigurationGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **includeLocalizationResources** | **bool**|  | [optional] 

### Return type

[**VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto**](VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationConfigurationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

