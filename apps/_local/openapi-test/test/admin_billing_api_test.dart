import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for AdminBillingApi
void main() {
  final instance = Openapi().getAdminBillingApi();

  group(AdminBillingApi, () {
    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingOrderItemDto> adminBillingOrdersGet({ String keyword, String status, int page, int limit }) async
    test('test adminBillingOrdersGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto> adminBillingOrdersIdMarkPaidPost(String id, { AiAdminServicesBillingDtosAdminMarkOrderPaidDto aiAdminServicesBillingDtosAdminMarkOrderPaidDto }) async
    test('test adminBillingOrdersIdMarkPaidPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto> adminBillingPlansGet() async
    test('test adminBillingPlansGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingSubscriptionItemDto> adminBillingSubscriptionsGet({ String mobile, int page, int limit }) async
    test('test adminBillingSubscriptionsGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosAdminBillingUsageItemDto> adminBillingUsageGet({ String keyword, String serviceType, int page, int limit }) async
    test('test adminBillingUsageGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> adminBillingUsersUserIdGrantTokensPost(int userId, { AiAdminServicesBillingDtosManualGrantTokensDto aiAdminServicesBillingDtosManualGrantTokensDto }) async
    test('test adminBillingUsersUserIdGrantTokensPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto> adminBillingUsersUserIdSummaryGet(int userId) async
    test('test adminBillingUsersUserIdSummaryGet', () async {
      // TODO
    });

  });
}
