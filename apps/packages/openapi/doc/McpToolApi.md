# openapi.api.McpToolApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminMcpToolsCategoriesGet**](McpToolApi.md#adminmcptoolscategoriesget) | **GET** /admin/mcp-tools/categories | 
[**adminMcpToolsGet**](McpToolApi.md#adminmcptoolsget) | **GET** /admin/mcp-tools | 
[**adminMcpToolsIdDelete**](McpToolApi.md#adminmcptoolsiddelete) | **DELETE** /admin/mcp-tools/{id} | 
[**adminMcpToolsIdGet**](McpToolApi.md#adminmcptoolsidget) | **GET** /admin/mcp-tools/{id} | 
[**adminMcpToolsIdPut**](McpToolApi.md#adminmcptoolsidput) | **PUT** /admin/mcp-tools/{id} | 
[**adminMcpToolsOptionsGet**](McpToolApi.md#adminmcptoolsoptionsget) | **GET** /admin/mcp-tools/options | 
[**adminMcpToolsPost**](McpToolApi.md#adminmcptoolspost) | **POST** /admin/mcp-tools | 


# **adminMcpToolsCategoriesGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListSystemString adminMcpToolsCategoriesGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();

try {
    final response = api.adminMcpToolsCategoriesGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsCategoriesGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListSystemString**](AiAdminInfrastructureResultSystemCollectionsGenericListSystemString.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminMcpToolsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto adminMcpToolsGet(page, limit, keyword, status, category)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();
final int page = 56; // int | 
final int limit = 56; // int | 
final String keyword = keyword_example; // String | 
final String status = status_example; // String | 
final String category = category_example; // String | 

try {
    final response = api.adminMcpToolsGet(page, limit, keyword, status, category);
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **keyword** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **category** | **String**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminMcpToolsIdDelete**
> AiAdminInfrastructureResultSystemObject adminMcpToolsIdDelete(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();
final String id = id_example; // String | 

try {
    final response = api.adminMcpToolsIdDelete(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsIdDelete: $e\n');
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

# **adminMcpToolsIdGet**
> AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto adminMcpToolsIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();
final String id = id_example; // String | 

try {
    final response = api.adminMcpToolsIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto**](AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminMcpToolsIdPut**
> AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto adminMcpToolsIdPut(id, aiAdminServicesMcpToolsDtosMcpToolUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();
final String id = id_example; // String | 
final AiAdminServicesMcpToolsDtosMcpToolUpsertDto aiAdminServicesMcpToolsDtosMcpToolUpsertDto = ; // AiAdminServicesMcpToolsDtosMcpToolUpsertDto | 

try {
    final response = api.adminMcpToolsIdPut(id, aiAdminServicesMcpToolsDtosMcpToolUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 
 **aiAdminServicesMcpToolsDtosMcpToolUpsertDto** | [**AiAdminServicesMcpToolsDtosMcpToolUpsertDto**](AiAdminServicesMcpToolsDtosMcpToolUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto**](AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminMcpToolsOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMcpToolsDtosMcpToolOptionDto adminMcpToolsOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();

try {
    final response = api.adminMcpToolsOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMcpToolsDtosMcpToolOptionDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMcpToolsDtosMcpToolOptionDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminMcpToolsPost**
> AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto adminMcpToolsPost(aiAdminServicesMcpToolsDtosMcpToolUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMcpToolApi();
final AiAdminServicesMcpToolsDtosMcpToolUpsertDto aiAdminServicesMcpToolsDtosMcpToolUpsertDto = ; // AiAdminServicesMcpToolsDtosMcpToolUpsertDto | 

try {
    final response = api.adminMcpToolsPost(aiAdminServicesMcpToolsDtosMcpToolUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling McpToolApi->adminMcpToolsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesMcpToolsDtosMcpToolUpsertDto** | [**AiAdminServicesMcpToolsDtosMcpToolUpsertDto**](AiAdminServicesMcpToolsDtosMcpToolUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto**](AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

