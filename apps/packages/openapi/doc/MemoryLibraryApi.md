# openapi.api.MemoryLibraryApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**memoryLibrariesGet**](MemoryLibraryApi.md#memorylibrariesget) | **GET** /memory-libraries | 
[**memoryLibrariesIdGet**](MemoryLibraryApi.md#memorylibrariesidget) | **GET** /memory-libraries/{id} | 
[**memoryLibrariesLibraryIdRecordsGet**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordsget) | **GET** /memory-libraries/{libraryId}/records | 
[**memoryLibrariesLibraryIdRecordsIngestPost**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordsingestpost) | **POST** /memory-libraries/{libraryId}/records/ingest | 
[**memoryLibrariesLibraryIdRecordsPost**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordspost) | **POST** /memory-libraries/{libraryId}/records | 
[**memoryLibrariesLibraryIdRecordsRecordIdDelete**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordsrecordiddelete) | **DELETE** /memory-libraries/{libraryId}/records/{recordId} | 
[**memoryLibrariesLibraryIdRecordsRecordIdPut**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordsrecordidput) | **PUT** /memory-libraries/{libraryId}/records/{recordId} | 
[**memoryLibrariesLibraryIdRecordsSearchPost**](MemoryLibraryApi.md#memorylibrarieslibraryidrecordssearchpost) | **POST** /memory-libraries/{libraryId}/records/search | 
[**memoryLibrariesLibraryIdRetrievalTestPost**](MemoryLibraryApi.md#memorylibrarieslibraryidretrievaltestpost) | **POST** /memory-libraries/{libraryId}/retrieval-test | 
[**memoryLibrariesLibraryIdRulesGet**](MemoryLibraryApi.md#memorylibrarieslibraryidrulesget) | **GET** /memory-libraries/{libraryId}/rules | 
[**memoryLibrariesLibraryIdRulesPost**](MemoryLibraryApi.md#memorylibrarieslibraryidrulespost) | **POST** /memory-libraries/{libraryId}/rules | 
[**memoryLibrariesLibraryIdRulesRuleIdDelete**](MemoryLibraryApi.md#memorylibrarieslibraryidrulesruleiddelete) | **DELETE** /memory-libraries/{libraryId}/rules/{ruleId} | 
[**memoryLibrariesLibraryIdRulesRuleIdPut**](MemoryLibraryApi.md#memorylibrarieslibraryidrulesruleidput) | **PUT** /memory-libraries/{libraryId}/rules/{ruleId} | 


# **memoryLibrariesGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto memoryLibrariesGet(page, limit, keyword, agentId, status)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final int page = 56; // int | 
final int limit = 56; // int | 
final String keyword = keyword_example; // String | 
final String agentId = agentId_example; // String | 
final int status = 56; // int | 

try {
    final response = api.memoryLibrariesGet(page, limit, keyword, agentId, status);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **keyword** | **String**|  | [optional] 
 **agentId** | **String**|  | [optional] 
 **status** | **int**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesIdGet**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto memoryLibrariesIdGet(id)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String id = id_example; // String | 

try {
    final response = api.memoryLibrariesIdGet(id);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto memoryLibrariesLibraryIdRecordsGet(libraryId, page, limit, recordType, keyword, includeExpired)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final int page = 56; // int | 
final int limit = 56; // int | 
final String recordType = recordType_example; // String | 
final String keyword = keyword_example; // String | 
final int includeExpired = 56; // int | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsGet(libraryId, page, limit, recordType, keyword, includeExpired);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **page** | **int**|  | [optional] 
 **limit** | **int**|  | [optional] 
 **recordType** | **String**|  | [optional] 
 **keyword** | **String**|  | [optional] 
 **includeExpired** | **int**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsIngestPost**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto memoryLibrariesLibraryIdRecordsIngestPost(libraryId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto = ; // AiAdminServicesMemoryDtosMemoryRecordUpsertDto | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsIngestPost(libraryId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsIngestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemoryRecordUpsertDto** | [**AiAdminServicesMemoryDtosMemoryRecordUpsertDto**](AiAdminServicesMemoryDtosMemoryRecordUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsPost**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto memoryLibrariesLibraryIdRecordsPost(libraryId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto = ; // AiAdminServicesMemoryDtosMemoryRecordUpsertDto | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsPost(libraryId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemoryRecordUpsertDto** | [**AiAdminServicesMemoryDtosMemoryRecordUpsertDto**](AiAdminServicesMemoryDtosMemoryRecordUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsRecordIdDelete**
> AiAdminInfrastructureResultSystemObject memoryLibrariesLibraryIdRecordsRecordIdDelete(libraryId, recordId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final String recordId = recordId_example; // String | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsRecordIdDelete(libraryId, recordId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsRecordIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **recordId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsRecordIdPut**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto memoryLibrariesLibraryIdRecordsRecordIdPut(libraryId, recordId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final String recordId = recordId_example; // String | 
final AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto = ; // AiAdminServicesMemoryDtosMemoryRecordUpsertDto | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsRecordIdPut(libraryId, recordId, aiAdminServicesMemoryDtosMemoryRecordUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsRecordIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **recordId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemoryRecordUpsertDto** | [**AiAdminServicesMemoryDtosMemoryRecordUpsertDto**](AiAdminServicesMemoryDtosMemoryRecordUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRecordsSearchPost**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto memoryLibrariesLibraryIdRecordsSearchPost(libraryId, aiAdminServicesMemoryDtosMemorySearchDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final AiAdminServicesMemoryDtosMemorySearchDto aiAdminServicesMemoryDtosMemorySearchDto = ; // AiAdminServicesMemoryDtosMemorySearchDto | 

try {
    final response = api.memoryLibrariesLibraryIdRecordsSearchPost(libraryId, aiAdminServicesMemoryDtosMemorySearchDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRecordsSearchPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemorySearchDto** | [**AiAdminServicesMemoryDtosMemorySearchDto**](AiAdminServicesMemoryDtosMemorySearchDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRetrievalTestPost**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto memoryLibrariesLibraryIdRetrievalTestPost(libraryId, aiAdminServicesMemoryDtosMemorySearchDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final AiAdminServicesMemoryDtosMemorySearchDto aiAdminServicesMemoryDtosMemorySearchDto = ; // AiAdminServicesMemoryDtosMemorySearchDto | 

try {
    final response = api.memoryLibrariesLibraryIdRetrievalTestPost(libraryId, aiAdminServicesMemoryDtosMemorySearchDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRetrievalTestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemorySearchDto** | [**AiAdminServicesMemoryDtosMemorySearchDto**](AiAdminServicesMemoryDtosMemorySearchDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRulesGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto memoryLibrariesLibraryIdRulesGet(libraryId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 

try {
    final response = api.memoryLibrariesLibraryIdRulesGet(libraryId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRulesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRulesPost**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto memoryLibrariesLibraryIdRulesPost(libraryId, aiAdminServicesMemoryDtosMemoryRuleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final AiAdminServicesMemoryDtosMemoryRuleUpsertDto aiAdminServicesMemoryDtosMemoryRuleUpsertDto = ; // AiAdminServicesMemoryDtosMemoryRuleUpsertDto | 

try {
    final response = api.memoryLibrariesLibraryIdRulesPost(libraryId, aiAdminServicesMemoryDtosMemoryRuleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRulesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemoryRuleUpsertDto** | [**AiAdminServicesMemoryDtosMemoryRuleUpsertDto**](AiAdminServicesMemoryDtosMemoryRuleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRulesRuleIdDelete**
> AiAdminInfrastructureResultSystemObject memoryLibrariesLibraryIdRulesRuleIdDelete(libraryId, ruleId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final String ruleId = ruleId_example; // String | 

try {
    final response = api.memoryLibrariesLibraryIdRulesRuleIdDelete(libraryId, ruleId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRulesRuleIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **ruleId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **memoryLibrariesLibraryIdRulesRuleIdPut**
> AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto memoryLibrariesLibraryIdRulesRuleIdPut(libraryId, ruleId, aiAdminServicesMemoryDtosMemoryRuleUpsertDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getMemoryLibraryApi();
final String libraryId = libraryId_example; // String | 
final String ruleId = ruleId_example; // String | 
final AiAdminServicesMemoryDtosMemoryRuleUpsertDto aiAdminServicesMemoryDtosMemoryRuleUpsertDto = ; // AiAdminServicesMemoryDtosMemoryRuleUpsertDto | 

try {
    final response = api.memoryLibrariesLibraryIdRulesRuleIdPut(libraryId, ruleId, aiAdminServicesMemoryDtosMemoryRuleUpsertDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling MemoryLibraryApi->memoryLibrariesLibraryIdRulesRuleIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **libraryId** | **String**|  | 
 **ruleId** | **String**|  | 
 **aiAdminServicesMemoryDtosMemoryRuleUpsertDto** | [**AiAdminServicesMemoryDtosMemoryRuleUpsertDto**](AiAdminServicesMemoryDtosMemoryRuleUpsertDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto**](AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

