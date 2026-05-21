import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for McpToolApi
void main() {
  final instance = Openapi().getMcpToolApi();

  group(McpToolApi, () {
    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListSystemString> adminMcpToolsCategoriesGet() async
    test('test adminMcpToolsCategoriesGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMcpToolsDtosMcpToolDto> adminMcpToolsGet({ int page, int limit, String keyword, String status, String category }) async
    test('test adminMcpToolsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminMcpToolsIdDelete(String id) async
    test('test adminMcpToolsIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto> adminMcpToolsIdGet(String id) async
    test('test adminMcpToolsIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto> adminMcpToolsIdPut(String id, { AiAdminServicesMcpToolsDtosMcpToolUpsertDto aiAdminServicesMcpToolsDtosMcpToolUpsertDto }) async
    test('test adminMcpToolsIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMcpToolsDtosMcpToolOptionDto> adminMcpToolsOptionsGet() async
    test('test adminMcpToolsOptionsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMcpToolsDtosMcpToolDto> adminMcpToolsPost({ AiAdminServicesMcpToolsDtosMcpToolUpsertDto aiAdminServicesMcpToolsDtosMcpToolUpsertDto }) async
    test('test adminMcpToolsPost', () async {
      // TODO
    });

  });
}
