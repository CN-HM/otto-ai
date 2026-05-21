import 'package:flutter/foundation.dart';

import '../auth/auth_controller.dart';
import '../../shared/models/api_result.dart';
import '../../shared/models/auth_models.dart';
import '../../shared/models/billing_models.dart';
import '../../shared/services/app_logger.dart';
import '../../shared/services/billing_api_service.dart';

class SettingsController extends ChangeNotifier {
  SettingsController({
    required AuthController authController,
    required BillingApiService billingApi,
    required AppLogger logger,
  })  : _authController = authController,
        _billingApi = billingApi,
        _logger = logger;

  final AuthController _authController;
  final BillingApiService _billingApi;
  final AppLogger _logger;

  String _statusMessage = '';
  bool _isBusy = false;
  BillingSummary? _billingSummary;
  List<BillingPlanItem> _billingPlans = const [];
  List<BillingOrderItem> _billingOrders = const [];
  BillingOrderPayResult? _latestPayResult;
  String _billingActionMessage = '';
  bool _hasBillingActionError = false;

  UserInfo? get currentUser => _authController.currentUser;
  String get statusMessage => _statusMessage;
  bool get isBusy => _isBusy || _authController.isLoading;
  BillingSummary? get billingSummary => _billingSummary;
  List<BillingPlanItem> get billingPlans => List.unmodifiable(_billingPlans);
  List<BillingOrderItem> get billingOrders => List.unmodifiable(_billingOrders);
  BillingOrderPayResult? get latestPayResult => _latestPayResult;
  String get billingActionMessage => _billingActionMessage;
  bool get hasBillingActionError => _hasBillingActionError;
  String get billingNotice {
    if (_billingSummary == null) {
      return '';
    }

    if (_billingSummary!.isExhausted) {
      return '本月套餐额度已用尽，请升级套餐或联系管理员补量';
    }

    if (_billingSummary!.isLowBalance) {
      return '本月套餐额度即将用尽，建议尽快升级套餐';
    }

    return '';
  }

  Future<void> loadOverview() async {
    _setBusy(true);
    try {
      final refreshed = await _authController.refreshUserInfo();
      final token = _authController.token;
      if (token != null && token.isNotEmpty) {
        await _loadBillingDataInternal(token);
      }

      if (refreshed && _statusMessage.trim().isEmpty) {
        _statusMessage = '已刷新';
      }
      notifyListeners();
    } catch (error, stackTrace) {
      await _logger.error('SettingsController', 'Load overview failed', error, stackTrace);
      _statusMessage = '刷新失败';
      notifyListeners();
    } finally {
      _setBusy(false);
    }
  }

  Future<bool> refreshUserInfo() async {
    await loadOverview();
    return _authController.isAuthenticated;
  }

  Future<void> refreshBillingOrders() async {
    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _setBillingAction('请先登录后刷新订单', true);
      return;
    }

    _setBusy(true);
    try {
      await _loadOrdersInternal(token);
      await _loadBillingSummaryInternal(token);
      notifyListeners();
    } finally {
      _setBusy(false);
    }
  }

  Future<bool> purchasePlan(BillingPlanItem plan) async {
    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _setBillingAction('请先登录后下单', true);
      return false;
    }

    _setBusy(true);
    _setBillingAction('', false, notify: false);
    try {
      final orderResponse = await _billingApi.createOrder(
        token,
        planId: plan.id,
        providerCode: plan.providerCode,
      );
      if (await _handleUnauthorizedResponse(orderResponse)) {
        return false;
      }

      final order = orderResponse.data;
      if (!orderResponse.isSuccess || order == null) {
        _setBillingAction(orderResponse.msg.isNotEmpty ? orderResponse.msg : '创建订单失败', true);
        return false;
      }

      final payResponse = await _billingApi.payOrder(
        token,
        orderId: order.id,
        providerCode: plan.providerCode,
      );
      if (await _handleUnauthorizedResponse(payResponse)) {
        return false;
      }

      await _loadOrdersInternal(token);

      final payResult = payResponse.data;
      if (!payResponse.isSuccess || payResult == null) {
        _setBillingAction(payResponse.msg.isNotEmpty ? payResponse.msg : '发起支付失败', true);
        notifyListeners();
        return false;
      }

      _latestPayResult = payResult;
      _setBillingAction(payResult.displayMessage, false, notify: false);
      notifyListeners();
      return true;
    } catch (error, stackTrace) {
      await _logger.error('SettingsController', 'Purchase plan failed', error, stackTrace);
      _setBillingAction('下单失败，请稍后重试', true);
      return false;
    } finally {
      _setBusy(false);
    }
  }

  Future<bool> payOrder(BillingOrderItem order) async {
    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _setBillingAction('请先登录后支付', true);
      return false;
    }

    _setBusy(true);
    _setBillingAction('', false, notify: false);
    try {
      final response = await _billingApi.payOrder(
        token,
        orderId: order.id,
        providerCode: order.providerCode,
      );
      if (await _handleUnauthorizedResponse(response)) {
        return false;
      }

      await _loadOrdersInternal(token);

      final payResult = response.data;
      if (!response.isSuccess || payResult == null) {
        _setBillingAction(response.msg.isNotEmpty ? response.msg : '发起支付失败', true);
        notifyListeners();
        return false;
      }

      _latestPayResult = payResult;
      _setBillingAction(payResult.displayMessage, false, notify: false);
      notifyListeners();
      return true;
    } catch (error, stackTrace) {
      await _logger.error('SettingsController', 'Pay order failed', error, stackTrace);
      _setBillingAction('发起支付失败，请稍后重试', true);
      return false;
    } finally {
      _setBusy(false);
    }
  }

  Future<bool> cancelOrder(BillingOrderItem order) async {
    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _setBillingAction('请先登录后取消订单', true);
      return false;
    }

    _setBusy(true);
    _setBillingAction('', false, notify: false);
    try {
      final response = await _billingApi.cancelOrder(token, order.id);
      if (await _handleUnauthorizedResponse(response)) {
        return false;
      }

      if (!response.isSuccess) {
        _setBillingAction(response.msg.isNotEmpty ? response.msg : '取消订单失败', true);
        return false;
      }

      if (_latestPayResult?.orderId == order.id) {
        _latestPayResult = null;
      }

      await _loadOrdersInternal(token);
      _setBillingAction('订单已取消', false, notify: false);
      notifyListeners();
      return true;
    } catch (error, stackTrace) {
      await _logger.error('SettingsController', 'Cancel order failed', error, stackTrace);
      _setBillingAction('取消订单失败，请稍后重试', true);
      return false;
    } finally {
      _setBusy(false);
    }
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (oldPassword.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty) {
      _statusMessage = '请填写所有密码字段';
      notifyListeners();
      return false;
    }

    if (newPassword != confirmPassword) {
      _statusMessage = '新密码两次输入不一致';
      notifyListeners();
      return false;
    }

    if (newPassword.length < 6) {
      _statusMessage = '密码长度至少6位';
      notifyListeners();
      return false;
    }

    _setBusy(true);
    final success = await _authController.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
    _statusMessage = _authController.message;
    _setBusy(false);
    notifyListeners();
    return success;
  }

  Future<void> logout() async {
    _setBusy(true);
    await _authController.logout();
    _clearBillingState();
    _setBusy(false);
    notifyListeners();
  }

  Future<void> _loadBillingDataInternal(String token) async {
    await _loadBillingSummaryInternal(token);
    if (!_authController.isAuthenticated) {
      return;
    }

    await _loadPlansInternal(token);
    if (!_authController.isAuthenticated) {
      return;
    }

    await _loadOrdersInternal(token);
  }

  Future<void> _loadBillingSummaryInternal(String token) async {
    final response = await _billingApi.getMySummary(token);
    if (await _handleUnauthorizedResponse(response)) {
      return;
    }

    if (response.isSuccess) {
      _billingSummary = response.data;
      return;
    }

    _billingSummary = null;
    if (response.msg.isNotEmpty && _billingActionMessage.trim().isEmpty) {
      _setBillingAction(response.msg, true, notify: false);
    }
  }

  Future<void> _loadPlansInternal(String token) async {
    final response = await _billingApi.getPlans(token);
    if (await _handleUnauthorizedResponse(response)) {
      return;
    }

    if (response.isSuccess) {
      _billingPlans = response.data ?? const [];
      return;
    }

    _billingPlans = const [];
    if (response.msg.isNotEmpty && _billingActionMessage.trim().isEmpty) {
      _setBillingAction(response.msg, true, notify: false);
    }
  }

  Future<void> _loadOrdersInternal(String token) async {
    final response = await _billingApi.getOrders(token, page: 1, limit: 10);
    if (await _handleUnauthorizedResponse(response)) {
      return;
    }

    if (response.isSuccess) {
      _billingOrders = response.data?.list ?? const [];
      if (_latestPayResult != null && !_billingOrders.any((item) => item.id == _latestPayResult!.orderId && item.canPay)) {
        _latestPayResult = null;
      }
      return;
    }

    _billingOrders = const [];
    if (response.msg.isNotEmpty && _billingActionMessage.trim().isEmpty) {
      _setBillingAction(response.msg, true, notify: false);
    }
  }

  Future<bool> _handleUnauthorizedResponse<T>(ApiResult<T> response) async {
    if (!response.isUnauthorized) {
      return false;
    }

    _clearBillingState();
    final message = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
    _statusMessage = message;
    _setBillingAction(message, true, notify: false);
    await _authController.handleUnauthorized(message);
    return true;
  }

  void _clearBillingState() {
    _billingSummary = null;
    _billingPlans = const [];
    _billingOrders = const [];
    _latestPayResult = null;
    _billingActionMessage = '';
    _hasBillingActionError = false;
  }

  void _setBillingAction(String message, bool error, {bool notify = true}) {
    _billingActionMessage = message;
    _hasBillingActionError = error;
    if (notify) {
      notifyListeners();
    }
  }

  void _setBusy(bool value) {
    _isBusy = value;
    notifyListeners();
  }
}
