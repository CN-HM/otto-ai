import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for BillingApi
void main() {
  final instance = Openapi().getBillingApi();

  group(BillingApi, () {
    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingSummaryDto> billingMeSummaryGet() async
    test('test billingMeSummaryGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminInfrastructurePageDataAiAdminServicesBillingDtosBillingOrderItemDto> billingOrdersGet({ String status, int page, int limit }) async
    test('test billingOrdersGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemObject> billingOrdersIdCancelPost(String id) async
    test('test billingOrdersIdCancelPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto> billingOrdersIdGet(String id) async
    test('test billingOrdersIdGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderPayResultDto> billingOrdersIdPayPost(String id, { AiAdminServicesBillingDtosBillingOrderPayDto aiAdminServicesBillingDtosBillingOrderPayDto }) async
    test('test billingOrdersIdPayPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingOrderDetailDto> billingOrdersPost({ AiAdminServicesBillingDtosCreateBillingOrderDto aiAdminServicesBillingDtosCreateBillingOrderDto }) async
    test('test billingOrdersPost', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultSystemCollectionsGenericListAiAdminServicesBillingDtosBillingPlanItemDto> billingPlansGet() async
    test('test billingPlansGet', () async {
      // TODO
    });

    //Future<AiAdminInfrastructureResultAiAdminServicesBillingDtosBillingUsageReportResultDto> billingUsageReportPost({ AiAdminServicesBillingDtosBillingUsageReportDto aiAdminServicesBillingDtosBillingUsageReportDto }) async
    test('test billingUsageReportPost', () async {
      // TODO
    });

  });
}
