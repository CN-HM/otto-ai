import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for WebhookApi
void main() {
  final instance = Openapi().getWebhookApi();

  group(WebhookApi, () {
    //Future webhookDeviceStatusPost({ AiAdminControllersDeviceStatusRequest aiAdminControllersDeviceStatusRequest }) async
    test('test webhookDeviceStatusPost', () async {
      // TODO
    });

  });
}
