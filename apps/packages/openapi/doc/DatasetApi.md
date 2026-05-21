# openapi.api.DatasetApi

## Load the API package
```dart
import 'package:openapi/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**datasetsBatchDelete**](DatasetApi.md#datasetsbatchdelete) | **DELETE** /datasets/batch | 
[**datasetsDatasetIdChunksPost**](DatasetApi.md#datasetsdatasetidchunkspost) | **POST** /datasets/{dataset_id}/chunks | 
[**datasetsDatasetIdDelete**](DatasetApi.md#datasetsdatasetiddelete) | **DELETE** /datasets/{dataset_id} | 
[**datasetsDatasetIdDocumentsDelete**](DatasetApi.md#datasetsdatasetiddocumentsdelete) | **DELETE** /datasets/{dataset_id}/documents | 
[**datasetsDatasetIdDocumentsDocumentIdChunksGet**](DatasetApi.md#datasetsdatasetiddocumentsdocumentidchunksget) | **GET** /datasets/{dataset_id}/documents/{document_id}/chunks | 
[**datasetsDatasetIdDocumentsDocumentIdDelete**](DatasetApi.md#datasetsdatasetiddocumentsdocumentiddelete) | **DELETE** /datasets/{dataset_id}/documents/{document_id} | 
[**datasetsDatasetIdDocumentsGet**](DatasetApi.md#datasetsdatasetiddocumentsget) | **GET** /datasets/{dataset_id}/documents | 
[**datasetsDatasetIdDocumentsPost**](DatasetApi.md#datasetsdatasetiddocumentspost) | **POST** /datasets/{dataset_id}/documents | 
[**datasetsDatasetIdDocumentsStatusStatusGet**](DatasetApi.md#datasetsdatasetiddocumentsstatusstatusget) | **GET** /datasets/{dataset_id}/documents/status/{status} | 
[**datasetsDatasetIdDocumentsTextPost**](DatasetApi.md#datasetsdatasetiddocumentstextpost) | **POST** /datasets/{dataset_id}/documents/text | 
[**datasetsDatasetIdGet**](DatasetApi.md#datasetsdatasetidget) | **GET** /datasets/{dataset_id} | 
[**datasetsDatasetIdPut**](DatasetApi.md#datasetsdatasetidput) | **PUT** /datasets/{dataset_id} | 
[**datasetsDatasetIdRetrievalTestPost**](DatasetApi.md#datasetsdatasetidretrievaltestpost) | **POST** /datasets/{dataset_id}/retrieval-test | 
[**datasetsEmbeddingModelOptionsGet**](DatasetApi.md#datasetsembeddingmodeloptionsget) | **GET** /datasets/embedding-model-options | 
[**datasetsGet**](DatasetApi.md#datasetsget) | **GET** /datasets | 
[**datasetsPost**](DatasetApi.md#datasetspost) | **POST** /datasets | 


# **datasetsBatchDelete**
> AiAdminInfrastructureResultSystemObject datasetsBatchDelete(ids)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String ids = ids_example; // String | 

try {
    final response = api.datasetsBatchDelete(ids);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsBatchDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ids** | **String**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdChunksPost**
> AiAdminInfrastructureResultSystemObject datasetsDatasetIdChunksPost(datasetId, requestBody)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final BuiltMap<String, BuiltList<String>> requestBody = ; // BuiltMap<String, BuiltList<String>> | 

try {
    final response = api.datasetsDatasetIdChunksPost(datasetId, requestBody);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdChunksPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **requestBody** | [**BuiltMap&lt;String, BuiltList&lt;String&gt;&gt;**](BuiltList.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDelete**
> AiAdminInfrastructureResultSystemObject datasetsDatasetIdDelete(datasetId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 

try {
    final response = api.datasetsDatasetIdDelete(datasetId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsDelete**
> AiAdminInfrastructureResultSystemObject datasetsDatasetIdDocumentsDelete(datasetId, aiAdminServicesKnowledgeDtosBatchIdReqDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final AiAdminServicesKnowledgeDtosBatchIdReqDto aiAdminServicesKnowledgeDtosBatchIdReqDto = ; // AiAdminServicesKnowledgeDtosBatchIdReqDto | 

try {
    final response = api.datasetsDatasetIdDocumentsDelete(datasetId, aiAdminServicesKnowledgeDtosBatchIdReqDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **aiAdminServicesKnowledgeDtosBatchIdReqDto** | [**AiAdminServicesKnowledgeDtosBatchIdReqDto**](AiAdminServicesKnowledgeDtosBatchIdReqDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsDocumentIdChunksGet**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto datasetsDatasetIdDocumentsDocumentIdChunksGet(datasetId, documentId, page, pageSize, keywords)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final String documentId = documentId_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 
final String keywords = keywords_example; // String | 

try {
    final response = api.datasetsDatasetIdDocumentsDocumentIdChunksGet(datasetId, documentId, page, pageSize, keywords);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsDocumentIdChunksGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **documentId** | **String**|  | 
 **page** | **int**|  | [optional] 
 **pageSize** | **int**|  | [optional] 
 **keywords** | **String**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsDocumentIdDelete**
> AiAdminInfrastructureResultSystemObject datasetsDatasetIdDocumentsDocumentIdDelete(datasetId, documentId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final String documentId = documentId_example; // String | 

try {
    final response = api.datasetsDatasetIdDocumentsDocumentIdDelete(datasetId, documentId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsDocumentIdDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **documentId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultSystemObject**](AiAdminInfrastructureResultSystemObject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto datasetsDatasetIdDocumentsGet(datasetId, name, status, page, pageSize)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final String name = name_example; // String | 
final String status = status_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.datasetsDatasetIdDocumentsGet(datasetId, name, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **name** | **String**|  | [optional] 
 **status** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsPost**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto datasetsDatasetIdDocumentsPost(datasetId, name, chunkMethod, parserConfig, file)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final String name = name_example; // String | 
final String chunkMethod = chunkMethod_example; // String | 
final String parserConfig = parserConfig_example; // String | 
final MultipartFile file = BINARY_DATA_HERE; // MultipartFile | 

try {
    final response = api.datasetsDatasetIdDocumentsPost(datasetId, name, chunkMethod, parserConfig, file);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **name** | **String**|  | [optional] 
 **chunkMethod** | **String**|  | [optional] 
 **parserConfig** | **String**|  | [optional] 
 **file** | **MultipartFile**|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsStatusStatusGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto datasetsDatasetIdDocumentsStatusStatusGet(datasetId, status, page, pageSize)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final String status = status_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.datasetsDatasetIdDocumentsStatusStatusGet(datasetId, status, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsStatusStatusGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **status** | **String**|  | 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdDocumentsTextPost**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto datasetsDatasetIdDocumentsTextPost(datasetId, aiAdminServicesKnowledgeDtosKnowledgeTextImportDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final AiAdminServicesKnowledgeDtosKnowledgeTextImportDto aiAdminServicesKnowledgeDtosKnowledgeTextImportDto = ; // AiAdminServicesKnowledgeDtosKnowledgeTextImportDto | 

try {
    final response = api.datasetsDatasetIdDocumentsTextPost(datasetId, aiAdminServicesKnowledgeDtosKnowledgeTextImportDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdDocumentsTextPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **aiAdminServicesKnowledgeDtosKnowledgeTextImportDto** | [**AiAdminServicesKnowledgeDtosKnowledgeTextImportDto**](AiAdminServicesKnowledgeDtosKnowledgeTextImportDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdGet**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto datasetsDatasetIdGet(datasetId)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 

try {
    final response = api.datasetsDatasetIdGet(datasetId);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdPut**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto datasetsDatasetIdPut(datasetId, aiAdminServicesKnowledgeDtosKnowledgeBaseDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final AiAdminServicesKnowledgeDtosKnowledgeBaseDto aiAdminServicesKnowledgeDtosKnowledgeBaseDto = ; // AiAdminServicesKnowledgeDtosKnowledgeBaseDto | 

try {
    final response = api.datasetsDatasetIdPut(datasetId, aiAdminServicesKnowledgeDtosKnowledgeBaseDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **aiAdminServicesKnowledgeDtosKnowledgeBaseDto** | [**AiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsDatasetIdRetrievalTestPost**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto datasetsDatasetIdRetrievalTestPost(datasetId, aiAdminServicesKnowledgeDtosTestReqDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String datasetId = datasetId_example; // String | 
final AiAdminServicesKnowledgeDtosTestReqDto aiAdminServicesKnowledgeDtosTestReqDto = ; // AiAdminServicesKnowledgeDtosTestReqDto | 

try {
    final response = api.datasetsDatasetIdRetrievalTestPost(datasetId, aiAdminServicesKnowledgeDtosTestReqDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsDatasetIdRetrievalTestPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **datasetId** | **String**|  | 
 **aiAdminServicesKnowledgeDtosTestReqDto** | [**AiAdminServicesKnowledgeDtosTestReqDto**](AiAdminServicesKnowledgeDtosTestReqDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsEmbeddingModelOptionsGet**
> AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto datasetsEmbeddingModelOptionsGet()



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();

try {
    final response = api.datasetsEmbeddingModelOptionsGet();
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsEmbeddingModelOptionsGet: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto**](AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsGet**
> AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto datasetsGet(name, page, pageSize)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final String name = name_example; // String | 
final int page = 56; // int | 
final int pageSize = 56; // int | 

try {
    final response = api.datasetsGet(name, page, pageSize);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | [optional] 
 **page** | **int**|  | [optional] [default to 1]
 **pageSize** | **int**|  | [optional] [default to 10]

### Return type

[**AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **datasetsPost**
> AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto datasetsPost(aiAdminServicesKnowledgeDtosKnowledgeBaseDto)



### Example
```dart
import 'package:openapi/api.dart';

final api = Openapi().getDatasetApi();
final AiAdminServicesKnowledgeDtosKnowledgeBaseDto aiAdminServicesKnowledgeDtosKnowledgeBaseDto = ; // AiAdminServicesKnowledgeDtosKnowledgeBaseDto | 

try {
    final response = api.datasetsPost(aiAdminServicesKnowledgeDtosKnowledgeBaseDto);
    print(response);
} on DioException catch (e) {
    print('Exception when calling DatasetApi->datasetsPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **aiAdminServicesKnowledgeDtosKnowledgeBaseDto** | [**AiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)|  | [optional] 

### Return type

[**AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto**](AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

