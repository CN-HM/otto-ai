# openapi.api.TtsVoiceApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**ttsVoiceDeletePost**](TtsVoiceApi.md#ttsvoicedeletepost) | **POST** /ttsVoice/delete | 
[**ttsVoiceGet**](TtsVoiceApi.md#ttsvoiceget) | **GET** /ttsVoice | 
[**ttsVoiceIdGet**](TtsVoiceApi.md#ttsvoiceidget) | **GET** /ttsVoice/{id} | 
[**ttsVoiceIdPut**](TtsVoiceApi.md#ttsvoiceidput) | **PUT** /ttsVoice/{id} | 
[**ttsVoicePost**](TtsVoiceApi.md#ttsvoicepost) | **POST** /ttsVoice | 
[**ttsVoiceSyncTtsProfileIdPost**](TtsVoiceApi.md#ttsvoicesyncttsprofileidpost) | **POST** /ttsVoice/sync/{ttsProfileId} | 
[**ttsVoiceTtsProfileOptionsGet**](TtsVoiceApi.md#ttsvoicettsprofileoptionsget) | **GET** /ttsVoice/tts-profile-options | 


# **ttsVoiceDeletePost**
> AiAdminInfrastructureResultSystemObject ttsVoiceDeletePost(requestBody)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final BuiltList<String> requestBody = ; // BuiltList<String> | 

try {
    final response = api.ttsVoiceDeletePost(requestBody);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceDeletePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **requestBody** | [**BuiltList&lt;String&gt;**](String.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoiceGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo ttsVoiceGet(ttsProfileId, name, page, limit)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final String ttsProfileId = ttsProfileId_example; // String | 
final String name = name_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 

try {
    final response = api.ttsVoiceGet(ttsProfileId, name, page, limit);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ttsProfileId** | **String**|  | [optional] 
 **name** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **limit** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoiceIdGet**
> AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo ttsVoiceIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final String id = id_example; // String | 

try {
    final response = api.ttsVoiceIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo**](AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoiceIdPut**
> AiAdminInfrastructureResultSystemObject ttsVoiceIdPut(id, aiAdminServicesVoiceDtosTimbreDataDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final String id = id_example; // String | 
final AiAdminServicesVoiceDtosTimbreDataDto aiAdminServicesVoiceDtosTimbreDataDto = ; // AiAdminServicesVoiceDtosTimbreDataDto | 

try {
    final response = api.ttsVoiceIdPut(id, aiAdminServicesVoiceDtosTimbreDataDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesVoiceDtosTimbreDataDto** | [**AiAdminServicesVoiceDtosTimbreDataDto**](AiAdminServicesVoiceDtosTimbreDataDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoicePost**
> AiAdminInfrastructureResultSystemObject ttsVoicePost(aiAdminServicesVoiceDtosTimbreDataDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final AiAdminServicesVoiceDtosTimbreDataDto aiAdminServicesVoiceDtosTimbreDataDto = ; // AiAdminServicesVoiceDtosTimbreDataDto | 

try {
    final response = api.ttsVoicePost(aiAdminServicesVoiceDtosTimbreDataDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoicePost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesVoiceDtosTimbreDataDto** | [**AiAdminServicesVoiceDtosTimbreDataDto**](AiAdminServicesVoiceDtosTimbreDataDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoiceSyncTtsProfileIdPost**
> AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto ttsVoiceSyncTtsProfileIdPost(ttsProfileId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();
final String ttsProfileId = ttsProfileId_example; // String | 

try {
    final response = api.ttsVoiceSyncTtsProfileIdPost(ttsProfileId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceSyncTtsProfileIdPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ttsProfileId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto**](AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **ttsVoiceTtsProfileOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto ttsVoiceTtsProfileOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTtsVoiceApi();

try {
    final response = api.ttsVoiceTtsProfileOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling TtsVoiceApi->ttsVoiceTtsProfileOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

