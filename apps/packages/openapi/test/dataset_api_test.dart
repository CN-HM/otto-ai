import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DatasetApi
void main() {
  final instance = Openapi().getDatasetApi();

  group(DatasetApi, () {
    //Future<AiAdminInfrastructureResultSystemObject> datasetsBatchDelete({ String ids }) async
    test('test datasetsBatchDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> datasetsDatasetIdChunksPost(String datasetId, { BuiltMap<String, BuiltList<String>> requestBody }) async
    test('test datasetsDatasetIdChunksPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> datasetsDatasetIdDelete(String datasetId) async
    test('test datasetsDatasetIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> datasetsDatasetIdDocumentsDelete(String datasetId, { AiAdminServicesKnowledgeDtosBatchIdReqDto aiAdminServicesKnowledgeDtosBatchIdReqDto }) async
    test('test datasetsDatasetIdDocumentsDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosListVoDto> datasetsDatasetIdDocumentsDocumentIdChunksGet(String datasetId, String documentId, { int page, int pageSize, String keywords }) async
    test('test datasetsDatasetIdDocumentsDocumentIdChunksGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> datasetsDatasetIdDocumentsDocumentIdDelete(String datasetId, String documentId) async
    test('test datasetsDatasetIdDocumentsDocumentIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto> datasetsDatasetIdDocumentsGet(String datasetId, { String name, String status, int page, int pageSize }) async
    test('test datasetsDatasetIdDocumentsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto> datasetsDatasetIdDocumentsPost(String datasetId, { String name, String chunkMethod, String parserConfig, MultipartFile file }) async
    test('test datasetsDatasetIdDocumentsPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeFilesDto> datasetsDatasetIdDocumentsStatusStatusGet(String datasetId, String status, { int page, int pageSize }) async
    test('test datasetsDatasetIdDocumentsStatusStatusGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeFilesDto> datasetsDatasetIdDocumentsTextPost(String datasetId, { AiAdminServicesKnowledgeDtosKnowledgeTextImportDto aiAdminServicesKnowledgeDtosKnowledgeTextImportDto }) async
    test('test datasetsDatasetIdDocumentsTextPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto> datasetsDatasetIdGet(String datasetId) async
    test('test datasetsDatasetIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto> datasetsDatasetIdPut(String datasetId, { AiAdminServicesKnowledgeDtosKnowledgeBaseDto aiAdminServicesKnowledgeDtosKnowledgeBaseDto }) async
    test('test datasetsDatasetIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosResultVoDto> datasetsDatasetIdRetrievalTestPost(String datasetId, { AiAdminServicesKnowledgeDtosTestReqDto aiAdminServicesKnowledgeDtosTestReqDto }) async
    test('test datasetsDatasetIdRetrievalTestPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesAgentRolesDtosOptionItemDto> datasetsEmbeddingModelOptionsGet() async
    test('test datasetsEmbeddingModelOptionsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesKnowledgeDtosKnowledgeBaseDto> datasetsGet({ String name, int page, int pageSize }) async
    test('test datasetsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesKnowledgeDtosKnowledgeBaseDto> datasetsPost({ AiAdminServicesKnowledgeDtosKnowledgeBaseDto aiAdminServicesKnowledgeDtosKnowledgeBaseDto }) async
    test('test datasetsPost', () async {
      // TODO
    });

  });
}
