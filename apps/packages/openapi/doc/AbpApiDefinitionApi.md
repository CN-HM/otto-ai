# openapi.api.AbpApiDefinitionApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiAbpApiDefinitionGet**](AbpApiDefinitionApi.md#apiabpapidefinitionget) | **GET** /api/abp/api-definition | 


# **apiAbpApiDefinitionGet**
> VoloAbpHttpModelingApplicationApiDescriptionModel apiAbpApiDefinitionGet(includeTypes)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAbpApiDefinitionApi();
final bool includeTypes = true; // bool | 

try {
    final response = api.apiAbpApiDefinitionGet(includeTypes);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AbpApiDefinitionApi->apiAbpApiDefinitionGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **includeTypes** | **bool**|  | [optional] 

### Return type

[**VoloAbpHttpModelingApplicationApiDescriptionModel**](VoloAbpHttpModelingApplicationApiDescriptionModel.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

