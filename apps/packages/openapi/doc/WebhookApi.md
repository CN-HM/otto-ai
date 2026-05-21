# openapi.api.WebhookApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**webhookDeviceStatusPost**](WebhookApi.md#webhookdevicestatuspost) | **POST** /webhook/device-status | 


# **webhookDeviceStatusPost**
> webhookDeviceStatusPost(aiAdminControllersDeviceStatusRequest)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getWebhookApi();
final AiAdminControllersDeviceStatusRequest aiAdminControllersDeviceStatusRequest = ; // AiAdminControllersDeviceStatusRequest | 

try {
    api.webhookDeviceStatusPost(aiAdminControllersDeviceStatusRequest);
} on DioException catch (e) {
    print('Exception when calling WebhookApi->webhookDeviceStatusPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminControllersDeviceStatusRequest** | [**AiAdminControllersDeviceStatusRequest**](AiAdminControllersDeviceStatusRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: Not defined

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

