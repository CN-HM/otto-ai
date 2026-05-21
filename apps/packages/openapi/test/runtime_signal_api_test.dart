import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for RuntimeSignalApi
void main() {
  final instance = Openapi().getRuntimeSignalApi();

  group(RuntimeSignalApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesMemoryDtosRuntimeSignalDto> adminRuntimeSignalsGet({ int page, int limit, String signalType, String status, String severity, String keyword }) async
    test('test adminRuntimeSignalsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminRuntimeSignalsIdDelete(String id) async
    test('test adminRuntimeSignalsIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesMemoryDtosRuntimeSignalDto> adminRuntimeSignalsIdStatusPut(String id, { AiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto aiAdminServicesMemoryDtosRuntimeSignalStatusUpdateDto }) async
    test('test adminRuntimeSignalsIdStatusPut', () async {
      // TODO
    });

  });
}
