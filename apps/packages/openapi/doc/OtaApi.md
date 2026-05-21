# openapi.api.OtaApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**otaMagBatchIdsDelete**](OtaApi.md#otamagbatchidsdelete) | **DELETE** /otaMag/batch/{ids} | 
[**otaMagDownloadUuidGet**](OtaApi.md#otamagdownloaduuidget) | **GET** /otaMag/download/{uuid} | 
[**otaMagGet**](OtaApi.md#otamagget) | **GET** /otaMag | 
[**otaMagGetDownloadUrlIdGet**](OtaApi.md#otamaggetdownloadurlidget) | **GET** /otaMag/getDownloadUrl/{id} | 
[**otaMagIdGet**](OtaApi.md#otamagidget) | **GET** /otaMag/{id} | 
[**otaMagIdPut**](OtaApi.md#otamagidput) | **PUT** /otaMag/{id} | 
[**otaMagPost**](OtaApi.md#otamagpost) | **POST** /otaMag | 
[**otaMagUploadAssetsBinPost**](OtaApi.md#otamaguploadassetsbinpost) | **POST** /otaMag/uploadAssetsBin | 
[**otaMagUploadPost**](OtaApi.md#otamaguploadpost) | **POST** /otaMag/upload | 


# **otaMagBatchIdsDelete**
> AiAdminInfrastructureResultSystemObject otaMagBatchIdsDelete(ids)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final String ids = ids_example; // String | 

try {
    final response = api.otaMagBatchIdsDelete(ids);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagBatchIdsDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagDownloadUuidGet**
> otaMagDownloadUuidGet(uuid)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final String uuid = uuid_example; // String | 

try {
    api.otaMagDownloadUuidGet(uuid);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagDownloadUuidGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **uuid** | **String**|  | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto otaMagGet(page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.otaMagGet(page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagGetDownloadUrlIdGet**
> AiAdminInfrastructureResultSystemString otaMagGetDownloadUrlIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final String id = id_example; // String | 

try {
    final response = api.otaMagGetDownloadUrlIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagGetDownloadUrlIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemString**](AiAdminInfrastructureResultSystemString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagIdGet**
> AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto otaMagIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final String id = id_example; // String | 

try {
    final response = api.otaMagIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto**](AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagIdPut**
> AiAdminInfrastructureResultSystemObject otaMagIdPut(id, aiAdminServicesVoiceDtosOtaEntityDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final String id = id_example; // String | 
final AiAdminServicesVoiceDtosOtaEntityDto aiAdminServicesVoiceDtosOtaEntityDto = ; // AiAdminServicesVoiceDtosOtaEntityDto | 

try {
    final response = api.otaMagIdPut(id, aiAdminServicesVoiceDtosOtaEntityDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesVoiceDtosOtaEntityDto** | [**AiAdminServicesVoiceDtosOtaEntityDto**](AiAdminServicesVoiceDtosOtaEntityDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagPost**
> AiAdminInfrastructureResultSystemObject otaMagPost(aiAdminServicesVoiceDtosOtaEntityDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final AiAdminServicesVoiceDtosOtaEntityDto aiAdminServicesVoiceDtosOtaEntityDto = ; // AiAdminServicesVoiceDtosOtaEntityDto | 

try {
    final response = api.otaMagPost(aiAdminServicesVoiceDtosOtaEntityDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesVoiceDtosOtaEntityDto** | [**AiAdminServicesVoiceDtosOtaEntityDto**](AiAdminServicesVoiceDtosOtaEntityDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagUploadAssetsBinPost**
> AiAdminInfrastructureResultSystemString otaMagUploadAssetsBinPost(file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.otaMagUploadAssetsBinPost(file);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagUploadAssetsBinPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemString**](AiAdminInfrastructureResultSystemString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **otaMagUploadPost**
> AiAdminInfrastructureResultSystemString otaMagUploadPost(file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getOtaApi();
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.otaMagUploadPost(file);
    print(response);
} on DioException catch (e) {
    print('Exception when calling OtaApi->otaMagUploadPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file** | **MultipartFile**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemString**](AiAdminInfrastructureResultSystemString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

