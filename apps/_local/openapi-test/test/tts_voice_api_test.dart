import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for TtsVoiceApi
void main() {
  final instance = Openapi().getTtsVoiceApi();

  group(TtsVoiceApi, () {
    //Future<AiAdminInfrastructureResultSystemObject> ttsVoiceDeletePost({ BuiltList<String> requestBody }) async
    test('test ttsVoiceDeletePost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesVoiceDtosTimbreDetailsVo> ttsVoiceGet({ String ttsProfileId, String name, int page, int limit }) async
    test('test ttsVoiceGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesVoiceDtosTimbreDetailsVo> ttsVoiceIdGet(String id) async
    test('test ttsVoiceIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> ttsVoiceIdPut(String id, { AiAdminServicesVoiceDtosTimbreDataDto aiAdminServicesVoiceDtosTimbreDataDto }) async
    test('test ttsVoiceIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> ttsVoicePost({ AiAdminServicesVoiceDtosTimbreDataDto aiAdminServicesVoiceDtosTimbreDataDto }) async
    test('test ttsVoicePost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesVoiceDtosTtsVoiceSyncResultDto> ttsVoiceSyncTtsProfileIdPost(String ttsProfileId) async
    test('test ttsVoiceSyncTtsProfileIdPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesVoiceDtosTtsProfileOptionDto> ttsVoiceTtsProfileOptionsGet() async
    test('test ttsVoiceTtsProfileOptionsGet', () async {
      // TODO
    });

  });
}
