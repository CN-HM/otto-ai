import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for DeviceApi
void main() {
  final instance = Openapi().getDeviceApi();

  group(DeviceApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesDeviceDtosUserShowDeviceListVo> adminDeviceAllGet({ String keywords, int page, int limit }) async
    test('test adminDeviceAllGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceBootstrapStatusDto> deviceBootstrapPost() async
    test('test deviceBootstrapPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceIdDelete(String id) async
    test('test deviceIdDelete', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesDeviceDtosIotDeviceDto> deviceIdGet(String id) async
    test('test deviceIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceIdPut(String id, { AiAdminServicesDeviceDtosDeviceUpdateDto aiAdminServicesDeviceDtosDeviceUpdateDto }) async
    test('test deviceIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesDeviceDtosIotDeviceDto> deviceListGet() async
    test('test deviceListGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceManualAddPost({ AiAdminServicesDeviceDtosDeviceManualAddDto aiAdminServicesDeviceDtosDeviceManualAddDto }) async
    test('test deviceManualAddPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesDeviceDtosDeviceProvisioningCredentialDto> deviceProvisioningIssuePost({ AiAdminServicesDeviceDtosDeviceProvisioningIssueDto aiAdminServicesDeviceDtosDeviceProvisioningIssueDto }) async
    test('test deviceProvisioningIssuePost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceToolsCallDeviceIdPost(String deviceId, { AiAdminServicesDeviceDtosDeviceToolsCallReqDto aiAdminServicesDeviceDtosDeviceToolsCallReqDto }) async
    test('test deviceToolsCallDeviceIdPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListSystemObject> deviceToolsListDeviceIdPost(String deviceId) async
    test('test deviceToolsListDeviceIdPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceUnbindPost({ AiAdminServicesDeviceDtosDeviceUnBindDto aiAdminServicesDeviceDtosDeviceUnBindDto }) async
    test('test deviceUnbindPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> deviceUpdateIdPut(String id, { AiAdminServicesDeviceDtosDeviceUpdateDto aiAdminServicesDeviceDtosDeviceUpdateDto }) async
    test('test deviceUpdateIdPut', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> otaPost({ String deviceId, AiAdminServicesDeviceDtosDeviceReportDto aiAdminServicesDeviceDtosDeviceReportDto }) async
    test('test otaPost', () async {
      // TODO
    });

  });
}
