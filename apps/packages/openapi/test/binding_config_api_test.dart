import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for BindingConfigApi
void main() {
  final instance = Openapi().getBindingConfigApi();

  group(BindingConfigApi, () {
    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto> adminBindingConfigsIntegrationOptionsGet({ String providerCode, String scope }) async
    test('test adminBindingConfigsIntegrationOptionsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBindingConfigsDtosBindingConfigDto> adminBindingConfigsKindGet(String kind, { String keyword, String status, int page, int limit }) async
    test('test adminBindingConfigsKindGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminBindingConfigsKindIdDelete(String kind, String id) async
    test('test adminBindingConfigsKindIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto> adminBindingConfigsKindIdGet(String kind, String id) async
    test('test adminBindingConfigsKindIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto> adminBindingConfigsKindIdPut(String kind, String id, { AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto }) async
    test('test adminBindingConfigsKindIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBindingConfigsDtosBindingConfigDto> adminBindingConfigsKindPost(String kind, { AiAdminServicesBindingConfigsDtosBindingConfigUpsertDto aiAdminServicesBindingConfigsDtosBindingConfigUpsertDto }) async
    test('test adminBindingConfigsKindPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBindingConfigsDtosBindingConfigKindMetaDto> adminBindingConfigsKindsGet() async
    test('test adminBindingConfigsKindsGet', () async {
      // TODO
    });

  });
}
