import 'package:openapi/openapi.dart' as generated;

import '../models/api_result.dart';
import '../models/device_models.dart';
import 'api_client.dart';

class DeviceApiService {
  DeviceApiService({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<ApiResult<List<DeviceInfo>>> getDevices(String token) {
    return _client.requestJson<List<DeviceInfo>>(
      method: 'GET',
      path: '/device/list',
      token: token,
      mapData: (data) {
        if (data is List) {
          return data
              .whereType<Map>()
              .map((item) => DeviceInfo.fromJson(Map<String, dynamic>.from(item)))
              .toList();
        }

        return const [];
      },
    );
  }

  Future<ApiResult<DeviceProvisioningCredential>> issueProvisioningCredential(
    DeviceProvisioningRequest request,
    String token,
  ) {
    return _client.requestJson<DeviceProvisioningCredential>(
      method: 'POST',
      path: '/device/provisioning/issue',
      data: request.toJson(),
      token: token,
      mapData: (data) {
        if (data is Map<String, dynamic>) {
          return DeviceProvisioningCredential.fromJson(data);
        }

        if (data is Map) {
          return DeviceProvisioningCredential.fromJson(Map<String, dynamic>.from(data));
        }

        return null;
      },
    );
  }

  Future<ApiResult<Object?>> updateDevice(
    String deviceId,
    DeviceUpdateRequest request,
    String token,
  ) {
    return _client.requestJson<Object?>(
      method: 'PUT',
      path: '/device/$deviceId',
      data: request.toJson(),
      token: token,
      mapData: (_) => null,
    );
  }

  Future<ApiResult<Object?>> deleteDevice(String deviceId, String token) {
    return _client.request<generated.AiAdminInfrastructureResultSystemObject, Object?>(
      method: 'DELETE',
      path: '/device/$deviceId',
      token: token,
      send: (headers) => _client.deviceApi.deviceIdDelete(
        id: deviceId,
        headers: headers,
      ),
      mapResult: (body) => ApiResult<Object?>(
        code: body?.code ?? 1,
        msg: body?.msg ?? '解绑失败',
        data: null,
      ),
    );
  }
}
