//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/api_util.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_order_item_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_subscription_item_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_infrastructure_page_data_ai_admin_services_billing_dtos_admin_billing_usage_item_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_billing_dtos_billing_order_detail_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_ai_admin_services_billing_dtos_billing_summary_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_system_collections_generic_list_ai_admin_services_billing_dtos_billing_plan_item_dto.dart';
import 'package:openapi/src/model/ai_admin_infrastructure_result_system_object.dart';
import 'package:openapi/src/model/ai_admin_services_billing_dtos_admin_mark_order_paid_dto.dart';
import 'package:openapi/src/model/ai_admin_services_billing_dtos_manual_grant_tokens_dto.dart';

class AdminBillingApi {

  final Dio _dio;

  final Serializers _serializers;

  const AdminBillingApi(this._dio, this._serializers);

  /// adminBillingOrdersGet
  /// 
  ///
  /// Parameters:
  /// * [keyword] 
  /// * [status] 
  /// * [page] 
  /// * [limit] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto>> adminBillingOrdersGet({ 
    String? keyword,
    String? status,
    int? page = 1,
    int? limit = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/orders';
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
      if (keyword != null) r'keyword': encodeQueryParameter(_serializers, keyword, const FullType(String)),
      if (status != null) r'status': encodeQueryParameter(_serializers, status, const FullType(String)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto>(
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

  /// adminBillingOrdersIdMarkPaidPost
  /// 
  ///
  /// Parameters:
  /// * [id] 
  /// * [aiAdminServicesBillingDtosAdminMarkOrderPaidDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto>> adminBillingOrdersIdMarkPaidPost({ 
    required String id,
    AiAdminServicesBillingDtosAdminMarkOrderPaidDto? aiAdminServicesBillingDtosAdminMarkOrderPaidDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/orders/{id}/mark-paid'.replaceAll('{' r'id' '}', encodeQueryParameter(_serializers, id, const FullType(String)).toString());
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
      const _type = FullType(AiAdminServicesBillingDtosAdminMarkOrderPaidDto);
      _bodyData = aiAdminServicesBillingDtosAdminMarkOrderPaidDto == null ? null : _serializers.serialize(aiAdminServicesBillingDtosAdminMarkOrderPaidDto, specifiedType: _type);

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

    AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto),
      ) as AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto>(
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

  /// adminBillingPlansGet
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
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto>> adminBillingPlansGet({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/plans';
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

    AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto),
      ) as AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto>(
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

  /// adminBillingSubscriptionsGet
  /// 
  ///
  /// Parameters:
  /// * [mobile] 
  /// * [page] 
  /// * [limit] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>> adminBillingSubscriptionsGet({ 
    String? mobile,
    int? page = 1,
    int? limit = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/subscriptions';
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
      if (mobile != null) r'mobile': encodeQueryParameter(_serializers, mobile, const FullType(String)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto>(
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

  /// adminBillingUsageGet
  /// 
  ///
  /// Parameters:
  /// * [keyword] 
  /// * [serviceType] 
  /// * [page] 
  /// * [limit] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto>> adminBillingUsageGet({ 
    String? keyword,
    String? serviceType,
    int? page = 1,
    int? limit = 10,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/usage';
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
      if (keyword != null) r'keyword': encodeQueryParameter(_serializers, keyword, const FullType(String)),
      if (serviceType != null) r'serviceType': encodeQueryParameter(_serializers, serviceType, const FullType(String)),
      if (page != null) r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (limit != null) r'limit': encodeQueryParameter(_serializers, limit, const FullType(int)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto),
      ) as AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto>(
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

  /// adminBillingUsersUserIdGrantTokensPost
  /// 
  ///
  /// Parameters:
  /// * [userId] 
  /// * [aiAdminServicesBillingDtosManualGrantTokensDto] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultSystemObject] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultSystemObject>> adminBillingUsersUserIdGrantTokensPost({ 
    required int userId,
    AiAdminServicesBillingDtosManualGrantTokensDto? aiAdminServicesBillingDtosManualGrantTokensDto,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/users/{userId}/grant-tokens'.replaceAll('{' r'userId' '}', encodeQueryParameter(_serializers, userId, const FullType(int)).toString());
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
      const _type = FullType(AiAdminServicesBillingDtosManualGrantTokensDto);
      _bodyData = aiAdminServicesBillingDtosManualGrantTokensDto == null ? null : _serializers.serialize(aiAdminServicesBillingDtosManualGrantTokensDto, specifiedType: _type);

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

  /// adminBillingUsersUserIdSummaryGet
  /// 
  ///
  /// Parameters:
  /// * [userId] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto>> adminBillingUsersUserIdSummaryGet({ 
    required int userId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/admin/billing/users/{userId}/summary'.replaceAll('{' r'userId' '}', encodeQueryParameter(_serializers, userId, const FullType(int)).toString());
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

    AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto),
      ) as AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto>(
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
