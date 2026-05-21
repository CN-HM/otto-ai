import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AuditLogApi
void main() {
  final instance = Openapi().getAuditLogApi();

  group(AuditLogApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesAdminDtosAuditLogPageItemVo> adminAuditLogsGet({ String keyword, String method, String result, int page, int limit }) async
    test('test adminAuditLogsGet', () async {
      // TODO
    });

  });
}
