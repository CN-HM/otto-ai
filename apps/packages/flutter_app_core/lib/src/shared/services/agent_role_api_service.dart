import '../models/agent_role_models.dart';
import '../models/api_result.dart';
import 'api_client.dart';

class AgentRoleApiService {
  AgentRoleApiService({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Future<ApiResult<List<AgentRoleInfo>>> getAgentRoles(String token) {
    return _client.requestJson<List<AgentRoleInfo>>(
      method: 'GET',
      path: '/agent-roles/catalog',
      token: token,
      mapData: (data) {
        if (data is List) {
          return data
              .whereType<Map>()
              .map((item) => AgentRoleInfo.fromJson(Map<String, dynamic>.from(item)))
              .toList();
        }

        return const [];
      },
    );
  }
}
