class BillingSummary {
  const BillingSummary({
    required this.userId,
    required this.planCode,
    required this.planName,
    required this.subscriptionStatus,
    required this.periodKey,
    required this.periodStartAt,
    required this.periodEndAt,
    required this.totalTokens,
    required this.consumedTokens,
    required this.remainingTokens,
    required this.remainingRatio,
    required this.isLowBalance,
    required this.isExhausted,
  });

  final int userId;
  final String? planCode;
  final String? planName;
  final String? subscriptionStatus;
  final String? periodKey;
  final String? periodStartAt;
  final String? periodEndAt;
  final int totalTokens;
  final int consumedTokens;
  final int remainingTokens;
  final double remainingRatio;
  final bool isLowBalance;
  final bool isExhausted;

  String get displayPlanName =>
      (planName != null && planName!.trim().isNotEmpty) ? planName! : '未开通套餐';

  String get remainingPercentLabel => '${(remainingRatio * 100).clamp(0, 100).toStringAsFixed(1)}%';
}

 class BillingPlanItem {
   const BillingPlanItem({
     required this.id,
     required this.code,
     required this.name,
     required this.planType,
     required this.includedTokens,
     required this.bonusTokens,
     required this.cycleMonths,
     required this.isDefault,
     required this.isEnabled,
     required this.sort,
     required this.remark,
     required this.amount,
     required this.currencyCode,
     required this.regionCode,
     required this.providerCode,
   });

   final String id;
   final String code;
   final String name;
   final String planType;
   final int includedTokens;
   final int bonusTokens;
   final int cycleMonths;
   final bool isDefault;
   final bool isEnabled;
   final int sort;
   final String? remark;
   final double? amount;
   final String? currencyCode;
   final String? regionCode;
   final String? providerCode;

   int get totalTokens => includedTokens + bonusTokens;

   String get displayPriceLabel {
     if (amount == null || amount! <= 0) {
       return '待配置';
     }

     final currency = (currencyCode != null && currencyCode!.trim().isNotEmpty) ? '$currencyCode ' : '';
     return '$currency${amount!.toStringAsFixed(2)}';
   }

   String get displayCycleLabel => cycleMonths <= 1 ? '按月' : '$cycleMonths 个月';
 }

 class BillingOrderItem {
   const BillingOrderItem({
     required this.id,
     required this.orderNo,
     required this.planId,
     required this.planCode,
     required this.planName,
     required this.orderType,
     required this.providerCode,
     required this.currencyCode,
     required this.amount,
     required this.grantedTokens,
     required this.status,
     required this.externalTradeNo,
     required this.paidAt,
     required this.activatedAt,
     required this.createDate,
   });

   final String id;
   final String orderNo;
   final String planId;
   final String? planCode;
   final String? planName;
   final String orderType;
   final String providerCode;
   final String currencyCode;
   final double amount;
   final int grantedTokens;
   final String status;
   final String? externalTradeNo;
   final String? paidAt;
   final String? activatedAt;
   final String? createDate;

   bool get canPay => status == 'created' || status == 'pending';

   bool get canCancel => status == 'created' || status == 'pending';

   String get displayPlanName => (planName != null && planName!.trim().isNotEmpty) ? planName! : (planCode ?? planId);

   String get displayAmountLabel => '$currencyCode ${amount.toStringAsFixed(2)}';

   String get displayStatusLabel {
     switch (status) {
       case 'created':
         return '待发起支付';
       case 'pending':
         return '待确认支付';
       case 'paid':
         return '已支付';
       case 'activated':
         return '已激活';
       case 'cancelled':
         return '已取消';
       case 'failed':
         return '失败';
       default:
         return status;
     }
   }
 }

 class BillingOrderDetail extends BillingOrderItem {
   const BillingOrderDetail({
     required super.id,
     required super.orderNo,
     required super.planId,
     required super.planCode,
     required super.planName,
     required super.orderType,
     required super.providerCode,
     required super.currencyCode,
     required super.amount,
     required super.grantedTokens,
     required super.status,
     required super.externalTradeNo,
     required super.paidAt,
     required super.activatedAt,
     required super.createDate,
     required this.regionCode,
     required this.cancelledAt,
     required this.latestTransactionNo,
     required this.latestPaymentStatus,
     required this.canPayNow,
     required this.canCancelNow,
   });

   final String regionCode;
   final String? cancelledAt;
   final String? latestTransactionNo;
   final String? latestPaymentStatus;
   final bool canPayNow;
   final bool canCancelNow;
 }

 class BillingOrderPage {
   const BillingOrderPage({required this.total, required this.list});

   final int total;
   final List<BillingOrderItem> list;
 }

 class BillingOrderPayResult {
   const BillingOrderPayResult({
     required this.orderId,
     required this.orderNo,
     required this.status,
     required this.providerCode,
     required this.actionType,
     required this.payUrl,
     required this.externalTradeNo,
     required this.expireAt,
     required this.message,
     required this.payloadJson,
   });

   final String orderId;
   final String orderNo;
   final String status;
   final String providerCode;
   final String? actionType;
   final String? payUrl;
   final String? externalTradeNo;
   final String? expireAt;
   final String? message;
   final String? payloadJson;

   String get displayMessage => (message != null && message!.trim().isNotEmpty) ? message! : '订单已创建，等待支付确认';
 }
