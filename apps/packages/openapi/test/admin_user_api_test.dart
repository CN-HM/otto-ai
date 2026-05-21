import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AdminUserApi
void main() {
  final instance = Openapi().getAdminUserApi();

  group(AdminUserApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataSystemObject> adminUsersAgentsUserIdGet(int userId, { int page, int limit }) async
    test('test adminUsersAgentsUserIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminUsersChangeStatusStatusPut(int status, { BuiltList<String> requestBody }) async
    test('test adminUsersChangeStatusStatusPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAdminPageUserVo> adminUsersGet({ String mobile, int page, int limit }) async
    test('test adminUsersGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminUsersIdDelete(int id) async
    test('test adminUsersIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemString> adminUsersIdPut(int id) async
    test('test adminUsersIdPut', () async {
      // TODO
    });

  });
}
