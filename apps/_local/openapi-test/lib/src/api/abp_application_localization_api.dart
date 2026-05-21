//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:openapi/src/api_util.dart';
import 'package:openapi/src/model/volo_abp_asp_net_core_mvc_application_configurations_application_localization_dto.dart';

class AbpApplicationLocalizationApi {

  final Dio _dio;

  final Serializers _serializers;

  const AbpApplicationLocalizationApi(this._dio, this._serializers);

  /// apiAbpApplicationLocalizationGet
  /// 
  ///
  /// Parameters:
  /// * [cultureName] 
  /// * [onlyDynamics] 
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto>> apiAbpApplicationLocalizationGet({ 
    required String cultureName,
    bool? onlyDynamics,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/api/abp/application-localization';
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
      r'CultureName': encodeQueryParameter(_serializers, cultureName, const FullType(String)),
      if (onlyDynamics != null) r'OnlyDynamics': encodeQueryParameter(_serializers, onlyDynamics, const FullType(bool)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto),
      ) as VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<VoloAbpAspNetCoreMvcApplicationConfigurationsApplicationLocalizationDto>(
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
