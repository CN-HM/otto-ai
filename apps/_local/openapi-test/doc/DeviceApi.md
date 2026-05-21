# openapi.api.DeviceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminDeviceAllGet**](DeviceApi.md#admindeviceallget) | **GET** /admin/device/all | 
[**deviceBootstrapPost**](DeviceApi.md#devicebootstrappost) | **POST** /device/bootstrap | 
[**deviceIdDelete**](DeviceApi.md#deviceiddelete) | **DELETE** /device/{id} | 
[**deviceIdGet**](DeviceApi.md#deviceidget) | **GET** /device/{id} | 
[**deviceIdPut**](DeviceApi.md#deviceidput) | **PUT** /device/{id} | 
[**deviceListGet**](DeviceApi.md#devicelistget) | **GET** /device/list | 
[**deviceManualAddPost**](DeviceApi.md#devicemanualaddpost) | **POST** /device/manual-add | 
[**deviceProvisioningIssuePost**](DeviceApi.md#deviceprovisioningissuepost) | **POST** /device/provisioning/issue | 
[**deviceToolsCallDeviceIdPost**](DeviceApi.md#devicetoolscalldeviceidpost) | **POST** /device/tools/call/{deviceId} | 
[**deviceToolsListDeviceIdPost**](DeviceApi.md#devicetoolslistdeviceidpost) | **POST** /device/tools/list/{deviceId} | 
[**deviceUnbindPost**](DeviceApi.md#deviceunbindpost) | **POST** /device/unbind | 
[**deviceUpdateIdPut**](DeviceApi.md#deviceupdateidput) | **PUT** /device/update/{id} | 
[**otaPost**](DeviceApi.md#otapost) | **POST** /ota | 


# **adminDeviceAllGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo adminDeviceAllGet(keywords, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String keywords = keywords_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.adminDeviceAllGet(keywords, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->adminDeviceAllGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **keywords** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceBootstrapPost**
> AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceBootstrapStatusDto deviceBootstrapPost()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();

try {
    final response = api.deviceBootstrapPost();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceBootstrapPost: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceBootstrapStatusDto**](AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceBootstrapStatusDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceIdDelete**
> AiAdminInfrastructureResultSystemObject deviceIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String id = id_example; // String | 

try {
    final response = api.deviceIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceIdGet**
> AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto deviceIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String id = id_example; // String | 

try {
    final response = api.deviceIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto**](AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceIdPut**
> AiAdminInfrastructureResultSystemObject deviceIdPut(id, aiAdminServicesDeviceDtosDeviceUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String id = id_example; // String | 
final AiAdminServicesDeviceDtosDeviceUpdateDto aiAdminServicesDeviceDtosDeviceUpdateDto = ; // AiAdminServicesDeviceDtosDeviceUpdateDto | 

try {
    final response = api.deviceIdPut(id, aiAdminServicesDeviceDtosDeviceUpdateDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesDeviceDtosDeviceUpdateDto** | [**AiAdminServicesDeviceDtosDeviceUpdateDto**](AiAdminServicesDeviceDtosDeviceUpdateDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceListGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto deviceListGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();

try {
    final response = api.deviceListGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceListGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceManualAddPost**
> AiAdminInfrastructureResultSystemObject deviceManualAddPost(aiAdminServicesDeviceDtosDeviceManualAddDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final AiAdminServicesDeviceDtosDeviceManualAddDto aiAdminServicesDeviceDtosDeviceManualAddDto = ; // AiAdminServicesDeviceDtosDeviceManualAddDto | 

try {
    final response = api.deviceManualAddPost(aiAdminServicesDeviceDtosDeviceManualAddDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceManualAddPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesDeviceDtosDeviceManualAddDto** | [**AiAdminServicesDeviceDtosDeviceManualAddDto**](AiAdminServicesDeviceDtosDeviceManualAddDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceProvisioningIssuePost**
> AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto deviceProvisioningIssuePost(aiAdminServicesDeviceDtosDeviceProvisioningIssueDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final AiAdminServicesDeviceDtosDeviceProvisioningIssueDto aiAdminServicesDeviceDtosDeviceProvisioningIssueDto = ; // AiAdminServicesDeviceDtosDeviceProvisioningIssueDto | 

try {
    final response = api.deviceProvisioningIssuePost(aiAdminServicesDeviceDtosDeviceProvisioningIssueDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceProvisioningIssuePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesDeviceDtosDeviceProvisioningIssueDto** | [**AiAdminServicesDeviceDtosDeviceProvisioningIssueDto**](AiAdminServicesDeviceDtosDeviceProvisioningIssueDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto**](AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceToolsCallDeviceIdPost**
> AiAdminInfrastructureResultSystemObject deviceToolsCallDeviceIdPost(deviceId, aiAdminServicesDeviceDtosDeviceToolsCallReqDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String deviceId = deviceId_example; // String | 
final AiAdminServicesDeviceDtosDeviceToolsCallReqDto aiAdminServicesDeviceDtosDeviceToolsCallReqDto = ; // AiAdminServicesDeviceDtosDeviceToolsCallReqDto | 

try {
    final response = api.deviceToolsCallDeviceIdPost(deviceId, aiAdminServicesDeviceDtosDeviceToolsCallReqDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceToolsCallDeviceIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | 
 **aiAdminServicesDeviceDtosDeviceToolsCallReqDto** | [**AiAdminServicesDeviceDtosDeviceToolsCallReqDto**](AiAdminServicesDeviceDtosDeviceToolsCallReqDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceToolsListDeviceIdPost**
> AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject deviceToolsListDeviceIdPost(deviceId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String deviceId = deviceId_example; // String | 

try {
    final response = api.deviceToolsListDeviceIdPost(deviceId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceToolsListDeviceIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject**](AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceUnbindPost**
> AiAdminInfrastructureResultSystemObject deviceUnbindPost(aiAdminServicesDeviceDtosDeviceUnBindDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final AiAdminServicesDeviceDtosDeviceUnBindDto aiAdminServicesDeviceDtosDeviceUnBindDto = ; // AiAdminServicesDeviceDtosDeviceUnBindDto | 

try {
    final response = api.deviceUnbindPost(aiAdminServicesDeviceDtosDeviceUnBindDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceUnbindPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesDeviceDtosDeviceUnBindDto** | [**AiAdminServicesDeviceDtosDeviceUnBindDto**](AiAdminServicesDeviceDtosDeviceUnBindDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deviceUpdateIdPut**
> AiAdminInfrastructureResultSystemObject deviceUpdateIdPut(id, aiAdminServicesDeviceDtosDeviceUpdateDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String id = id_example; // String | 
final AiAdminServicesDeviceDtosDeviceUpdateDto aiAdminServicesDeviceDtosDeviceUpdateDto = ; // AiAdminServicesDeviceDtosDeviceUpdateDto | 

try {
    final response = api.deviceUpdateIdPut(id, aiAdminServicesDeviceDtosDeviceUpdateDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->deviceUpdateIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesDeviceDtosDeviceUpdateDto** | [**AiAdminServicesDeviceDtosDeviceUpdateDto**](AiAdminServicesDeviceDtosDeviceUpdateDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaPost**
> AiAdminInfrastructureResultSystemObject otaPost(deviceId, aiAdminServicesDeviceDtosDeviceReportDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDeviceApi();
final String deviceId = deviceId_example; // String | 
final AiAdminServicesDeviceDtosDeviceReportDto aiAdminServicesDeviceDtosDeviceReportDto = ; // AiAdminServicesDeviceDtosDeviceReportDto | 

try {
    final response = api.otaPost(deviceId, aiAdminServicesDeviceDtosDeviceReportDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DeviceApi->otaPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **deviceId** | **String**|  | [optional] 
 **aiAdminServicesDeviceDtosDeviceReportDto** | [**AiAdminServicesDeviceDtosDeviceReportDto**](AiAdminServicesDeviceDtosDeviceReportDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

