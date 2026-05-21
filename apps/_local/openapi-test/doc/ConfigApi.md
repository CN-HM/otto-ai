# openapi.api.ConfigApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**configServerBasePost**](ConfigApi.md#configserverbasepost) | **POST** /config/server-base | 


# **configServerBasePost**
> AiAdminInfrastructureResultSystemObject configServerBasePost()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getConfigApi();

try {
    final response = api.configServerBasePost();
    print(response);
} on DioException catch (e) {
    print('Exception when calling ConfigApi->configServerBasePost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

