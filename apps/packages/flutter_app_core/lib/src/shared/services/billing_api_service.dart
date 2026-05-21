import 'package:dio/dio.dart';

import '../models/api_result.dart';
import '../models/billing_models.dart';
import 'api_client.dart';

class BillingApiService {
  BillingApiService({required ApiClient client}) : _client = client;

  final ApiClient _client;

  Dio _dio() => Dio(BaseOptions(baseUrl: _client.baseUrl));

  Future<ApiResult<BillingSummary>> getMySummary(String token) {
    return _client.request<Map<String, dynamic>, BillingSummary>(
      method: 'GET',
      path: '/billing/me/summary',
      token: token,
      send: (headers) async {
        final response = await _dio().get<Map<String, dynamic>>(
          '/billing/me/summary',
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<BillingSummary>(
            code: 1,
            msg: '加载套餐信息失败',
            data: null,
          );
        }

        final result = ApiResult<BillingSummary>.fromJson(body, (value) {
          if (value is! Map<String, dynamic>) {
            return null;
          }

          return BillingSummary(
            userId: (value['userId'] as num?)?.toInt() ?? 0,
            planCode: value['planCode']?.toString(),
            planName: value['planName']?.toString(),
            subscriptionStatus: value['subscriptionStatus']?.toString(),
            periodKey: value['periodKey']?.toString(),
            periodStartAt: value['periodStartAt']?.toString(),
            periodEndAt: value['periodEndAt']?.toString(),
            totalTokens: (value['totalTokens'] as num?)?.toInt() ?? 0,
            consumedTokens: (value['consumedTokens'] as num?)?.toInt() ?? 0,
            remainingTokens: (value['remainingTokens'] as num?)?.toInt() ?? 0,
            remainingRatio: (value['remainingRatio'] as num?)?.toDouble() ?? 0,
            isLowBalance: value['isLowBalance'] == true,
            isExhausted: value['isExhausted'] == true,
          );
        });

        return ApiResult<BillingSummary>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '加载套餐信息失败',
          data: result.data,
        );
      },
    );
  }

  Future<ApiResult<List<BillingPlanItem>>> getPlans(String token) {
    return _client.request<Map<String, dynamic>, List<BillingPlanItem>>(
      method: 'GET',
      path: '/billing/plans',
      token: token,
      send: (headers) async {
        final response = await _dio().get<Map<String, dynamic>>(
          '/billing/plans',
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<List<BillingPlanItem>>(
            code: 1,
            msg: '加载套餐列表失败',
            data: null,
          );
        }

        final result = ApiResult<List<BillingPlanItem>>.fromJson(body, (value) {
          if (value is! List) {
            return null;
          }

          return value.whereType<Map<String, dynamic>>().map(_mapPlanItem).toList();
        });

        return ApiResult<List<BillingPlanItem>>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '加载套餐列表失败',
          data: result.data,
        );
      },
    );
  }

  Future<ApiResult<BillingOrderPage>> getOrders(
    String token, {
    String? status,
    int page = 1,
    int limit = 10,
  }) {
    return _client.request<Map<String, dynamic>, BillingOrderPage>(
      method: 'GET',
      path: '/billing/orders',
      token: token,
      send: (headers) async {
        final response = await _dio().get<Map<String, dynamic>>(
          '/billing/orders',
          queryParameters: {
            'status': status,
            'page': page,
            'limit': limit,
          },
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<BillingOrderPage>(
            code: 1,
            msg: '加载订单失败',
            data: null,
          );
        }

        final result = ApiResult<BillingOrderPage>.fromJson(body, (value) {
          if (value is! Map<String, dynamic>) {
            return null;
          }

          final list = value['list'];
          return BillingOrderPage(
            total: (value['total'] as num?)?.toInt() ?? 0,
            list: list is List ? list.whereType<Map<String, dynamic>>().map(_mapOrderItem).toList() : const [],
          );
        });

        return ApiResult<BillingOrderPage>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '加载订单失败',
          data: result.data,
        );
      },
    );
  }

  Future<ApiResult<BillingOrderDetail>> createOrder(
    String token, {
    required String planId,
    String? providerCode,
  }) {
    return _client.request<Map<String, dynamic>, BillingOrderDetail>(
      method: 'POST',
      path: '/billing/orders',
      token: token,
      send: (headers) async {
        final response = await _dio().post<Map<String, dynamic>>(
          '/billing/orders',
          data: {
            'planId': planId,
            'providerCode': providerCode,
          },
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<BillingOrderDetail>(
            code: 1,
            msg: '创建订单失败',
            data: null,
          );
        }

        final result = ApiResult<BillingOrderDetail>.fromJson(body, (value) {
          if (value is! Map<String, dynamic>) {
            return null;
          }

          return _mapOrderDetail(value);
        });

        return ApiResult<BillingOrderDetail>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '创建订单失败',
          data: result.data,
        );
      },
    );
  }

  Future<ApiResult<BillingOrderPayResult>> payOrder(
    String token, {
    required String orderId,
    String? providerCode,
    String? returnUrl,
  }) {
    return _client.request<Map<String, dynamic>, BillingOrderPayResult>(
      method: 'POST',
      path: '/billing/orders/$orderId/pay',
      token: token,
      send: (headers) async {
        final response = await _dio().post<Map<String, dynamic>>(
          '/billing/orders/$orderId/pay',
          data: {
            'providerCode': providerCode,
            'returnUrl': returnUrl,
          },
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<BillingOrderPayResult>(
            code: 1,
            msg: '发起支付失败',
            data: null,
          );
        }

        final result = ApiResult<BillingOrderPayResult>.fromJson(body, (value) {
          if (value is! Map<String, dynamic>) {
            return null;
          }

          return _mapOrderPayResult(value);
        });

        return ApiResult<BillingOrderPayResult>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '发起支付失败',
          data: result.data,
        );
      },
    );
  }

  Future<ApiResult<bool>> cancelOrder(String token, String orderId) {
    return _client.request<Map<String, dynamic>, bool>(
      method: 'POST',
      path: '/billing/orders/$orderId/cancel',
      token: token,
      send: (headers) async {
        final response = await _dio().post<Map<String, dynamic>>(
          '/billing/orders/$orderId/cancel',
          options: Options(headers: headers),
        );
        return response;
      },
      mapResult: (body) {
        if (body == null) {
          return const ApiResult<bool>(
            code: 1,
            msg: '取消订单失败',
            data: null,
          );
        }

        final result = ApiResult<bool>.fromJson(body, (_) => true);
        return ApiResult<bool>(
          code: result.code,
          msg: result.msg.isNotEmpty ? result.msg : '取消订单失败',
          data: result.data,
        );
      },
    );
  }

  static BillingPlanItem _mapPlanItem(Map<String, dynamic> value) {
    return BillingPlanItem(
      id: value['id']?.toString() ?? '',
      code: value['code']?.toString() ?? '',
      name: value['name']?.toString() ?? '',
      planType: value['planType']?.toString() ?? '',
      includedTokens: (value['includedTokens'] as num?)?.toInt() ?? 0,
      bonusTokens: (value['bonusTokens'] as num?)?.toInt() ?? 0,
      cycleMonths: (value['cycleMonths'] as num?)?.toInt() ?? 0,
      isDefault: value['isDefault'] == true,
      isEnabled: value['isEnabled'] == true,
      sort: (value['sort'] as num?)?.toInt() ?? 0,
      remark: value['remark']?.toString(),
      amount: (value['amount'] as num?)?.toDouble(),
      currencyCode: value['currencyCode']?.toString(),
      regionCode: value['regionCode']?.toString(),
      providerCode: value['providerCode']?.toString(),
    );
  }

  static BillingOrderItem _mapOrderItem(Map<String, dynamic> value) {
    return BillingOrderItem(
      id: value['id']?.toString() ?? '',
      orderNo: value['orderNo']?.toString() ?? '',
      planId: value['planId']?.toString() ?? '',
      planCode: value['planCode']?.toString(),
      planName: value['planName']?.toString(),
      orderType: value['orderType']?.toString() ?? '',
      providerCode: value['providerCode']?.toString() ?? '',
      currencyCode: value['currencyCode']?.toString() ?? '',
      amount: (value['amount'] as num?)?.toDouble() ?? 0,
      grantedTokens: (value['grantedTokens'] as num?)?.toInt() ?? 0,
      status: value['status']?.toString() ?? '',
      externalTradeNo: value['externalTradeNo']?.toString(),
      paidAt: value['paidAt']?.toString(),
      activatedAt: value['activatedAt']?.toString(),
      createDate: value['createDate']?.toString(),
    );
  }

  static BillingOrderDetail _mapOrderDetail(Map<String, dynamic> value) {
    return BillingOrderDetail(
      id: value['id']?.toString() ?? '',
      orderNo: value['orderNo']?.toString() ?? '',
      planId: value['planId']?.toString() ?? '',
      planCode: value['planCode']?.toString(),
      planName: value['planName']?.toString(),
      orderType: value['orderType']?.toString() ?? '',
      providerCode: value['providerCode']?.toString() ?? '',
      currencyCode: value['currencyCode']?.toString() ?? '',
      amount: (value['amount'] as num?)?.toDouble() ?? 0,
      grantedTokens: (value['grantedTokens'] as num?)?.toInt() ?? 0,
      status: value['status']?.toString() ?? '',
      externalTradeNo: value['externalTradeNo']?.toString(),
      paidAt: value['paidAt']?.toString(),
      activatedAt: value['activatedAt']?.toString(),
      createDate: value['createDate']?.toString(),
      regionCode: value['regionCode']?.toString() ?? '',
      cancelledAt: value['cancelledAt']?.toString(),
      latestTransactionNo: value['latestTransactionNo']?.toString(),
      latestPaymentStatus: value['latestPaymentStatus']?.toString(),
      canPayNow: value['canPay'] == true,
      canCancelNow: value['canCancel'] == true,
    );
  }

  static BillingOrderPayResult _mapOrderPayResult(Map<String, dynamic> value) {
    return BillingOrderPayResult(
      orderId: value['orderId']?.toString() ?? '',
      orderNo: value['orderNo']?.toString() ?? '',
      status: value['status']?.toString() ?? '',
      providerCode: value['providerCode']?.toString() ?? '',
      actionType: value['actionType']?.toString(),
      payUrl: value['payUrl']?.toString(),
      externalTradeNo: value['externalTradeNo']?.toString(),
      expireAt: value['expireAt']?.toString(),
      message: value['message']?.toString(),
      payloadJson: value['payloadJson']?.toString(),
    );
  }
}
