# openapi.api.AbpApplicationLocalizationApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAbpApplicationLocalizationGet**](AbpApplicationLocalizationApi.md#apiabpapplicationlocalizationget) | **GET** /api/abp/application-localization | 


# **apiAbpApplicationLocalizationGet**
> VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto apiAbpApplicationLocalizationGet(cultureName, onlyDynamics)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAbpApplicationLocalizationApi();
final String cultureName = cultureName_example; // String | 
final bool onlyDynamics = true; // bool | 

try {
    final response = api.apiAbpApplicationLocalizationGet(cultureName, onlyDynamics);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AbpApplicationLocalizationApi->apiAbpApplicationLocalizationGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **cultureName** | **String**|  | 
 **onlyDynamics** | **bool**|  | [optional] 

### Return type

[**VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto**](VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

