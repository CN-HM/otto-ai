import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for MemoryLibraryApi
void main() {
  final instance = Openapi().getMemoryLibraryApi();

  group(MemoryLibraryApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryLibraryDto> memoryLibrariesGet({ int page, int limit, String keyword, String agentId, int status }) async
    test('test memoryLibrariesGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryLibraryDto> memoryLibrariesIdGet(String id) async
    test('test memoryLibrariesIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosMemoryRecordDto> memoryLibrariesLibraryIdRecordsGet(String libraryId, { int page, int limit, String recordType, String keyword, int includeExpired }) async
    test('test memoryLibrariesLibraryIdRecordsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto> memoryLibrariesLibraryIdRecordsIngestPost(String libraryId, { AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto }) async
    test('test memoryLibrariesLibraryIdRecordsIngestPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto> memoryLibrariesLibraryIdRecordsPost(String libraryId, { AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto }) async
    test('test memoryLibrariesLibraryIdRecordsPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> memoryLibrariesLibraryIdRecordsRecordIdDelete(String libraryId, String recordId) async
    test('test memoryLibrariesLibraryIdRecordsRecordIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRecordDto> memoryLibrariesLibraryIdRecordsRecordIdPut(String libraryId, String recordId, { AiAdminServicesMemoryDtosMemoryRecordUpsertDto aiAdminServicesMemoryDtosMemoryRecordUpsertDto }) async
    test('test memoryLibrariesLibraryIdRecordsRecordIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto> memoryLibrariesLibraryIdRecordsSearchPost(String libraryId, { AiAdminServicesMemoryDtosMemorySearchDto aiAdminServicesMemoryDtosMemorySearchDto }) async
    test('test memoryLibrariesLibraryIdRecordsSearchPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemorySearchResultDto> memoryLibrariesLibraryIdRetrievalTestPost(String libraryId, { AiAdminServicesMemoryDtosMemorySearchDto aiAdminServicesMemoryDtosMemorySearchDto }) async
    test('test memoryLibrariesLibraryIdRetrievalTestPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesMemoryDtosMemoryRuleDto> memoryLibrariesLibraryIdRulesGet(String libraryId) async
    test('test memoryLibrariesLibraryIdRulesGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto> memoryLibrariesLibraryIdRulesPost(String libraryId, { AiAdminServicesMemoryDtosMemoryRuleUpsertDto aiAdminServicesMemoryDtosMemoryRuleUpsertDto }) async
    test('test memoryLibrariesLibraryIdRulesPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> memoryLibrariesLibraryIdRulesRuleIdDelete(String libraryId, String ruleId) async
    test('test memoryLibrariesLibraryIdRulesRuleIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosMemoryRuleDto> memoryLibrariesLibraryIdRulesRuleIdPut(String libraryId, String ruleId, { AiAdminServicesMemoryDtosMemoryRuleUpsertDto aiAdminServicesMemoryDtosMemoryRuleUpsertDto }) async
    test('test memoryLibrariesLibraryIdRulesRuleIdPut', () async {
      // TODO
    });

  });
}
