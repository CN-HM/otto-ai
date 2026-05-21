//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import 'package:openapi/src/api_util.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_knowledge_files_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_list_vo_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_knowledge_dtos_result_vo_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_agent_roles_dtos_option_item_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_system_object.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_batch_id_req_dto.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_knowledge_base_dto.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_knowledge_text_import_dto.dart';
import 'package:openapi/src/model/ai_admin_services_knowledge_dtos_test_req_dto.dart';

class DatasetApi {

  final Dio _dio;

  final Serializers _serializers;

  const DatasetApi(this._dio, this._serializers);

  /// datasetsBatchDelete
  /// 
  ///
  /// Parameters:
  /// * [ids] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> datasetsBatchDelete({ 
    String? ids,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/batch';
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (ids != null) r'ids': encodeQueryParameter(_serializers, ids, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemObject),
      ) as AiAdminInfrastructureResultSystemObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdChunksPost
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [requestBody] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> datasetsDatasetIdChunksPost({ 
    required String datasetId,
    BuiltMap<String, BuiltList<String>>? requestBody,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/chunks'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(BuiltMap, [FullType(String), FullType(BuiltList, [FullType(String)])]);
      _bodyData = requestBody == null ? null : _serializers.serialize(requestBody, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemObject),
      ) as AiAdminInfrastructureResultSystemObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDelete
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> datasetsDatasetIdDelete({ 
    required String datasetId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemObject),
      ) as AiAdminInfrastructureResultSystemObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsDelete
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [aiAdminServicesKnowledgeDtosBatchIdReqDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> datasetsDatasetIdDocumentsDelete({ 
    required String datasetId,
    AiAdminServicesKnowledgeDtosBatchIdReqDto? aiAdminServicesKnowledgeDtosBatchIdReqDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(AiAdminServicesKnowledgeDtosBatchIdReqDto);
      _bodyData = aiAdminServicesKnowledgeDtosBatchIdReqDto == null ? null : _serializers.serialize(aiAdminServicesKnowledgeDtosBatchIdReqDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemObject),
      ) as AiAdminInfrastructureResultSystemObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsDocumentIdChunksGet
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [documentId] 
  /// * [page] 
  /// * [pageSize] 
  /// * [keywords] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto>> datasetsDatasetIdDocumentsDocumentIdChunksGet({ 
    required String datasetId,
    required String documentId,
    int? page,
    int? pageSize,
    String? keywords,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents/{document_id}/chunks'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString()).replaceAll('{' r'document_id' '}', encodeQueryParameter(_serializers, documentId, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null) r'pageSize': encodeQueryParameter(_serializers, pageSize, const FullType(int)),
      if (keywords != null) r'keywords': encodeQueryParameter(_serializers, keywords, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsDocumentIdDelete
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [documentId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> datasetsDatasetIdDocumentsDocumentIdDelete({ 
    required String datasetId,
    required String documentId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents/{document_id}'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString()).replaceAll('{' r'document_id' '}', encodeQueryParameter(_serializers, documentId, const FullType(String)).toString());
    final _options = Options(
      method: r'DELETE',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemObject? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemObject),
      ) as AiAdminInfrastructureResultSystemObject;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemObject>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsGet
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [name] 
  /// * [status] 
  /// * [page] 
  /// * [pageSize] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto>> datasetsDatasetIdDocumentsGet({ 
    required String datasetId,
    String? name,
    String? status,
    int? page = 1,
    int? pageSize = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (name != null) r'name': encodeQueryParameter(_serializers, name, const FullType(String)),
      if (status != null) r'status': encodeQueryParameter(_serializers, status, const FullType(String)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null) r'page_size': encodeQueryParameter(_serializers, pageSize, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsPost
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [name] 
  /// * [chunkMethod] 
  /// * [parserConfig] 
  /// * [file] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto>> datasetsDatasetIdDocumentsPost({ 
    required String datasetId,
    String? name,
    String? chunkMethod,
    String? parserConfig,
    MultipartFile? file,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'multipart/form-data',
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (name != null) r'name': encodeQueryParameter(_serializers, name, const FullType(String)),
      if (chunkMethod != null) r'chunkMethod': encodeQueryParameter(_serializers, chunkMethod, const FullType(String)),
      if (parserConfig != null) r'parserConfig': encodeQueryParameter(_serializers, parserConfig, const FullType(String)),
    };

    dynamic _bodyData;

    try {
      _bodyData = FormData.fromMap(<String, dynamic>{
        if (file != null) r'file': file,
      });

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsStatusStatusGet
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [status] 
  /// * [page] 
  /// * [pageSize] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto>> datasetsDatasetIdDocumentsStatusStatusGet({ 
    required String datasetId,
    required String status,
    int? page = 1,
    int? pageSize = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents/status/{status}'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString()).replaceAll('{' r'status' '}', encodeQueryParameter(_serializers, status, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null) r'page_size': encodeQueryParameter(_serializers, pageSize, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdDocumentsTextPost
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [aiAdminServicesKnowledgeDtosKnowledgeTextImportDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto>> datasetsDatasetIdDocumentsTextPost({ 
    required String datasetId,
    AiAdminServicesKnowledgeDtosKnowledgeTextImportDto? aiAdminServicesKnowledgeDtosKnowledgeTextImportDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/documents/text'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(AiAdminServicesKnowledgeDtosKnowledgeTextImportDto);
      _bodyData = aiAdminServicesKnowledgeDtosKnowledgeTextImportDto == null ? null : _serializers.serialize(aiAdminServicesKnowledgeDtosKnowledgeTextImportDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdGet
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>> datasetsDatasetIdGet({ 
    required String datasetId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdPut
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [aiAdminServicesKnowledgeDtosKnowledgeBaseDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>> datasetsDatasetIdPut({ 
    required String datasetId,
    AiAdminServicesKnowledgeDtosKnowledgeBaseDto? aiAdminServicesKnowledgeDtosKnowledgeBaseDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'PUT',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(AiAdminServicesKnowledgeDtosKnowledgeBaseDto);
      _bodyData = aiAdminServicesKnowledgeDtosKnowledgeBaseDto == null ? null : _serializers.serialize(aiAdminServicesKnowledgeDtosKnowledgeBaseDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsDatasetIdRetrievalTestPost
  /// 
  ///
  /// Parameters:
  /// * [datasetId] 
  /// * [aiAdminServicesKnowledgeDtosTestReqDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto>> datasetsDatasetIdRetrievalTestPost({ 
    required String datasetId,
    AiAdminServicesKnowledgeDtosTestReqDto? aiAdminServicesKnowledgeDtosTestReqDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/{dataset_id}/retrieval-test'.replaceAll('{' r'dataset_id' '}', encodeQueryParameter(_serializers, datasetId, const FullType(String)).toString());
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(AiAdminServicesKnowledgeDtosTestReqDto);
      _bodyData = aiAdminServicesKnowledgeDtosTestReqDto == null ? null : _serializers.serialize(aiAdminServicesKnowledgeDtosTestReqDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsEmbeddingModelOptionsGet
  /// 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto>> datasetsEmbeddingModelOptionsGet({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets/embedding-model-options';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto),
      ) as AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsGet
  /// 
  ///
  /// Parameters:
  /// * [name] 
  /// * [page] 
  /// * [pageSize] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto>> datasetsGet({ 
    String? name,
    int? page = 1,
    int? pageSize = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (name != null) r'name': encodeQueryParameter(_serializers, name, const FullType(String)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null) r'page_size': encodeQueryParameter(_serializers, pageSize, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

  /// datasetsPost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesKnowledgeDtosKnowledgeBaseDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>> datasetsPost({ 
    AiAdminServicesKnowledgeDtosKnowledgeBaseDto? aiAdminServicesKnowledgeDtosKnowledgeBaseDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/datasets';
    final _options = Options(
      method: r'POST',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
      const _type = FullType(AiAdminServicesKnowledgeDtosKnowledgeBaseDto);
      _bodyData = aiAdminServicesKnowledgeDtosKnowledgeBaseDto == null ? null : _serializers.serialize(aiAdminServicesKnowledgeDtosKnowledgeBaseDto, specifiedType: _type);

    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}
