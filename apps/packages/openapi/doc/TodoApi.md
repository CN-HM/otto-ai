# openapi.api.TodoApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminTodosIdExecutePost**](TodoApi.md#admintodosidexecutepost) | **POST** /admin/todos/{id}/execute | 
[**adminTodosPost**](TodoApi.md#admintodospost) | **POST** /admin/todos | 


# **adminTodosIdExecutePost**
> AiAdminInfrastructureResultSystemObject adminTodosIdExecutePost(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTodoApi();
final String id = id_example; // String | 

try {
    final response = api.adminTodosIdExecutePost(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TodoApi->adminTodosIdExecutePost: $e\n');
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

# **adminTodosPost**
> AiAdminInfrastructureResultSystemObject adminTodosPost(aiAdminControllersCreateTodoDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getTodoApi();
final AiAdminControllersCreateTodoDto aiAdminControllersCreateTodoDto = ; // AiAdminControllersCreateTodoDto | 

try {
    final response = api.adminTodosPost(aiAdminControllersCreateTodoDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling TodoApi->adminTodosPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminControllersCreateTodoDto** | [**AiAdminControllersCreateTodoDto**](AiAdminControllersCreateTodoDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

