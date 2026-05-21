import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for OtaApi
void main() {
  final instance = Openapi().getOtaApi();

  group(OtaApi, () {
    //Future<AiAdminInfrastructureResultSystemObject> otaMagBatchIdsDelete(String ids) async
    test('test otaMagBatchIdsDelete', () async {
      // TODO
    });

    //Future otaMagDownloadUuidGet(String uuid) async
    test('test otaMagDownloadUuidGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosOtaEntityDto> otaMagGet({ int page, int limit }) async
    test('test otaMagGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemString> otaMagGetDownloadUrlIdGet(String id) async
    test('test otaMagGetDownloadUrlIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesVoiceDtosOtaEntityDto> otaMagIdGet(String id) async
    test('test otaMagIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> otaMagIdPut(String id, { AiAdminServicesVoiceDtosOtaEntityDto aiAdminServicesVoiceDtosOtaEntityDto }) async
    test('test otaMagIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> otaMagPost({ AiAdminServicesVoiceDtosOtaEntityDto aiAdminServicesVoiceDtosOtaEntityDto }) async
    test('test otaMagPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemString> otaMagUploadAssetsBinPost({ MultipartFile file }) async
    test('test otaMagUploadAssetsBinPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemString> otaMagUploadPost({ MultipartFile file }) async
    test('test otaMagUploadPost', () async {
      // TODO
    });

  });
}
