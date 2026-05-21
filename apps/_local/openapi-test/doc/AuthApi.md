# openapi.api.AuthApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**userChangePasswordPut**](AuthApi.md#userchangepasswordput) | **PUT** /user/change-password | 
[**userInfoGet**](AuthApi.md#userinfoget) | **GET** /user/info | 
[**userLoginPost**](AuthApi.md#userloginpost) | **POST** /user/login | 
[**userPubConfigGet**](AuthApi.md#userpubconfigget) | **GET** /user/pub-config | 
[**userRegisterPost**](AuthApi.md#userregisterpost) | **POST** /user/register | 
[**userRetrievePasswordPut**](AuthApi.md#userretrievepasswordput) | **PUT** /user/retrieve-password | 
[**userSmsVerificationPost**](AuthApi.md#usersmsverificationpost) | **POST** /user/smsVerification | 


# **userChangePasswordPut**
> AiAdminInfrastructureResultSystemObject userChangePasswordPut(aiAdminServicesAuthDtosPasswordDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AiAdminServicesAuthDtosPasswordDto aiAdminServicesAuthDtosPasswordDto = ; // AiAdminServicesAuthDtosPasswordDto | 

try {
    final response = api.userChangePasswordPut(aiAdminServicesAuthDtosPasswordDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userChangePasswordPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAuthDtosPasswordDto** | [**AiAdminServicesAuthDtosPasswordDto**](AiAdminServicesAuthDtosPasswordDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userInfoGet**
> AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto userInfoGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.userInfoGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userInfoGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto**](AiAdminInfrastructureResultAiAdminServicesRbacDtosUserInfoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userLoginPost**
> AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto userLoginPost(aiAdminServicesAuthDtosLoginDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AiAdminServicesAuthDtosLoginDto aiAdminServicesAuthDtosLoginDto = ; // AiAdminServicesAuthDtosLoginDto | 

try {
    final response = api.userLoginPost(aiAdminServicesAuthDtosLoginDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userLoginPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAuthDtosLoginDto** | [**AiAdminServicesAuthDtosLoginDto**](AiAdminServicesAuthDtosLoginDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto**](AiAdminInfrastructureResultAiAdminServicesAuthDtosTokenDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userPubConfigGet**
> AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto userPubConfigGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();

try {
    final response = api.userPubConfigGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userPubConfigGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto**](AiAdminInfrastructureResultAiAdminServicesAuthDtosPubConfigDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userRegisterPost**
> AiAdminInfrastructureResultSystemObject userRegisterPost(aiAdminServicesAuthDtosRegisterDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AiAdminServicesAuthDtosRegisterDto aiAdminServicesAuthDtosRegisterDto = ; // AiAdminServicesAuthDtosRegisterDto | 

try {
    final response = api.userRegisterPost(aiAdminServicesAuthDtosRegisterDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userRegisterPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAuthDtosRegisterDto** | [**AiAdminServicesAuthDtosRegisterDto**](AiAdminServicesAuthDtosRegisterDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userRetrievePasswordPut**
> AiAdminInfrastructureResultSystemObject userRetrievePasswordPut(aiAdminServicesAuthDtosRetrievePasswordDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AiAdminServicesAuthDtosRetrievePasswordDto aiAdminServicesAuthDtosRetrievePasswordDto = ; // AiAdminServicesAuthDtosRetrievePasswordDto | 

try {
    final response = api.userRetrievePasswordPut(aiAdminServicesAuthDtosRetrievePasswordDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userRetrievePasswordPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAuthDtosRetrievePasswordDto** | [**AiAdminServicesAuthDtosRetrievePasswordDto**](AiAdminServicesAuthDtosRetrievePasswordDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **userSmsVerificationPost**
> AiAdminInfrastructureResultSystemObject userSmsVerificationPost(aiAdminServicesAuthDtosSmsVerificationDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getAuthApi();
final AiAdminServicesAuthDtosSmsVerificationDto aiAdminServicesAuthDtosSmsVerificationDto = ; // AiAdminServicesAuthDtosSmsVerificationDto | 

try {
    final response = api.userSmsVerificationPost(aiAdminServicesAuthDtosSmsVerificationDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling AuthApi->userSmsVerificationPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesAuthDtosSmsVerificationDto** | [**AiAdminServicesAuthDtosSmsVerificationDto**](AiAdminServicesAuthDtosSmsVerificationDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

