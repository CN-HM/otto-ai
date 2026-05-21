# openapi.api.ServerApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminServerRuntimeStatusGet**](ServerApi.md#adminserverruntimestatusget) | **GET** /admin/server/runtime-status | 


# **adminServerRuntimeStatusGet**
> AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto adminServerRuntimeStatusGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getServerApi();

try {
    final response = api.adminServerRuntimeStatusGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ServerApi->adminServerRuntimeStatusGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto**](AiAdminInfrastructureResultAiAdminControllersRuntimeStatusDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

