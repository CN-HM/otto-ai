//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_asr_recognition_response_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_conversation_execution_binding_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_llm_chat_response_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_runtime_execution_dtos_tts_synthesis_response_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_plan_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_conversation_asr_execution_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_conversation_llm_execution_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_execution_dtos_conversation_tts_execution_request_dto.dart';
import 'package:openapi/src/model/ai_admin_services_runtime_orchestration_dtos_conversation_orchestration_request_dto.dart';

class ConversationOrchestrationApi {

  final Dio _dio;

  final Serializers _serializers;

  const ConversationOrchestrationApi(this._dio, this._serializers);

  /// adminRuntimeOrchestrationAsrRecognizePost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto>> adminRuntimeOrchestrationAsrRecognizePost({ 
    AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto? aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/runtime/orchestration/asr/recognize';
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
      const _type = FullType(AiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto);
      _bodyData = aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto == null ? null : _serializers.serialize(aiAdminServicesRuntimeExecutionDtosConversationAsrExecutionRequestDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosAsrRecognitionResponseDto>(
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

  /// adminRuntimeOrchestrationBindingPost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto>> adminRuntimeOrchestrationBindingPost({ 
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto? aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/runtime/orchestration/binding';
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
      const _type = FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto);
      _bodyData = aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto == null ? null : _serializers.serialize(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto),
      ) as AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosConversationExecutionBindingDto>(
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

  /// adminRuntimeOrchestrationLlmChatPost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto>> adminRuntimeOrchestrationLlmChatPost({ 
    AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto? aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/runtime/orchestration/llm/chat';
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
      const _type = FullType(AiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto);
      _bodyData = aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto == null ? null : _serializers.serialize(aiAdminServicesRuntimeExecutionDtosConversationLlmExecutionRequestDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosLlmChatResponseDto>(
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

  /// adminRuntimeOrchestrationPlanPost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto>> adminRuntimeOrchestrationPlanPost({ 
    AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto? aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/runtime/orchestration/plan';
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
      const _type = FullType(AiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto);
      _bodyData = aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto == null ? null : _serializers.serialize(aiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationRequestDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto),
      ) as AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesRuntimeOrchestrationDtosConversationOrchestrationPlanDto>(
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

  /// adminRuntimeOrchestrationTtsSynthesizePost
  /// 
  ///
  /// Parameters:
  /// * [aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto>> adminRuntimeOrchestrationTtsSynthesizePost({ 
    AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto? aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/runtime/orchestration/tts/synthesize';
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
      const _type = FullType(AiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto);
      _bodyData = aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto == null ? null : _serializers.serialize(aiAdminServicesRuntimeExecutionDtosConversationTtsExecutionRequestDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto),
      ) as AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesRuntimeExecutionDtosTtsSynthesisResponseDto>(
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
