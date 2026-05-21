import 'package:dio/dio.dart';
import 'package:openapi/openapi.dart';

import '../models/api_result.dart';
import 'app_logger.dart';

class ApiClient {
  ApiClient({
    required this.logger,
    required this.baseUrl,
  }) : _openapi = Openapi(basePathOverride: baseUrl),
       _dio = Dio(BaseOptions(baseUrl: baseUrl));

  final AppLogger logger;
  final String baseUrl;
  final Openapi _openapi;
  final Dio _dio;

  AuthApi get authApi => _openapi.getAuthApi();
  DeviceApi get deviceApi => _openapi.getDeviceApi();

  Map<String, dynamic> authHeaders([String? token]) => {
        if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
      };

  Future<ApiResult<T>> request<R, T>({
    required String method,
    required String path,
    required Future<Response<R>> Function(Map<String, dynamic> headers) send,
    required ApiResult<T> Function(R? body) mapResult,
    String? token,
  }) async {
    final requestLabel = '$method $baseUrl$path';
    try {
      await logger.info('ApiClient', requestLabel);
      final response = await send(authHeaders(token));
      return mapResult(response.data);
    } on DioException catch (error, stackTrace) {
      await logger.error('ApiClient', 'Request failed: $requestLabel', error, stackTrace);
      return ApiResult<T>(
        code: _extractErrorCode(error) ?? -1,
        msg: _extractFriendlyErrorMessage(error),
        data: null,
      );
    } catch (error, stackTrace) {
      await logger.error('ApiClient', 'Request failed: $requestLabel', error, stackTrace);
      return ApiResult<T>(code: -1, msg: '服务开小差了，请稍后重试', data: null);
    }
  }

  Future<ApiResult<T>> requestJson<T>({
    required String method,
    required String path,
    required T? Function(dynamic value) mapData,
    Object? data,
    String? token,
  }) async {
    final requestLabel = '$method $baseUrl$path';
    try {
      await logger.info('ApiClient', requestLabel);
      final response = await _dio.request<dynamic>(
        path,
        data: data,
        options: Options(
          method: method,
          headers: authHeaders(token),
          contentType: Headers.jsonContentType,
        ),
      );

      final body = _asJsonMap(response.data);
      return ApiResult<T>(
        code: (body?['code'] as num?)?.toInt() ?? response.statusCode ?? 1,
        msg: body == null ? '请求失败，请稍后重试' : body['msg']?.toString() ?? '',
        data: mapData(body?['data']),
      );
    } on DioException catch (error, stackTrace) {
      await logger.error('ApiClient', 'Request failed: $requestLabel', error, stackTrace);
      return ApiResult<T>(
        code: _extractErrorCode(error) ?? -1,
        msg: _extractFriendlyErrorMessage(error),
        data: null,
      );
    } catch (error, stackTrace) {
      await logger.error('ApiClient', 'Request failed: $requestLabel', error, stackTrace);
      return ApiResult<T>(code: -1, msg: '服务开小差了，请稍后重试', data: null);
    }
  }

  int? _extractErrorCode(DioException error) {
    final data = _asJsonMap(error.response?.data);
    if (data != null) {
      return (data['code'] as num?)?.toInt() ?? error.response?.statusCode;
    }

    return error.response?.statusCode;
  }

  String? _extractErrorMessage(DioException error) {
    final data = _asJsonMap(error.response?.data);
    if (data != null) {
      return data['msg']?.toString() ?? data['message']?.toString();
    }

    return null;
  }

  Map<String, dynamic>? _asJsonMap(dynamic value) {
    if (value is Map<String, dynamic>) {
      return value;
    }

    if (value is Map) {
      return Map<String, dynamic>.from(value);
    }

    return null;
  }

  String _extractFriendlyErrorMessage(DioException error) {
    final statusCode = error.response?.statusCode;
    if (statusCode == 401 || statusCode == 403) {
      return '登录状态已失效，请重新登录';
    }

    final serverMessage = _extractErrorMessage(error);
    if (serverMessage != null && serverMessage.trim().isNotEmpty) {
      return serverMessage;
    }

    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return '网络连接超时，请检查网络后重试';
      case DioExceptionType.connectionError:
        return '网络连接失败，请检查网络后重试';
      case DioExceptionType.cancel:
        return '请求已取消';
      case DioExceptionType.badCertificate:
        return '当前网络环境不安全，请稍后重试';
      case DioExceptionType.badResponse:
        if (statusCode != null && statusCode >= 500) {
          return '服务器暂时不可用，请稍后重试';
        }
        return '请求失败，请稍后重试';
      case DioExceptionType.unknown:
        return '服务开小差了，请稍后重试';
    }
  }
}
