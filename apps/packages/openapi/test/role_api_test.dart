import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for RoleApi
void main() {
  final instance = Openapi().getRoleApi();

  group(RoleApi, () {
    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosRoleDto> systemRolesAllGet() async
    test('test systemRolesAllGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesRbacDtosRoleDto> systemRolesGet({ String name, int page, int limit }) async
    test('test systemRolesGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> systemRolesIdDelete(int id) async
    test('test systemRolesIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64> systemRolesIdMenusGet(int id) async
    test('test systemRolesIdMenusGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> systemRolesIdMenusPut(int id, { AiAdminServicesRbacDtosRoleMenuAssignDto aiAdminServicesRbacDtosRoleMenuAssignDto }) async
    test('test systemRolesIdMenusPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> systemRolesIdPut(int id, { AiAdminServicesRbacDtosRoleUpdateDto aiAdminServicesRbacDtosRoleUpdateDto }) async
    test('test systemRolesIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesRbacDtosMenuTreeDto> systemRolesMenuTreeGet() async
    test('test systemRolesMenuTreeGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> systemRolesPost({ AiAdminServicesRbacDtosRoleCreateDto aiAdminServicesRbacDtosRoleCreateDto }) async
    test('test systemRolesPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListSystemInt64> systemRolesUserUserIdGet(int userId) async
    test('test systemRolesUserUserIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> systemRolesUserUserIdPut(int userId, { AiAdminServicesRbacDtosUserRoleAssignDto aiAdminServicesRbacDtosUserRoleAssignDto }) async
    test('test systemRolesUserUserIdPut', () async {
      // TODO
    });

  });
}
