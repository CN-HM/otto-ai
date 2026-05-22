import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../shared/models/billing_models.dart';
import '../../shared/widgets/message_notice.dart';
import '../../shared/widgets/surface_card.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _oldPasswordFocusNode = FocusNode();
  final _newPasswordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

   Future<void> _copyText(String text, String label) async {
     if (text.trim().isEmpty) {
       return;
     }

     await Clipboard.setData(ClipboardData(text: text));
     if (!mounted) {
       return;
     }

     ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text('$label 已复制')),
     );
   }

   Future<void> _confirmCancelOrder(SettingsController controller, BillingOrderItem order) async {
    final shouldCancel = await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('取消订单'),
          content: Text('确认取消订单 ${order.orderNo} 吗？'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('返回'),
            ),
            FilledButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('确认取消'),
            ),
          ],
        );
      },
    );

    if (shouldCancel != true) {
      return;
    }

    await controller.cancelOrder(order);
  }

  Widget _buildBillingPlansSection(BuildContext context, SettingsController controller) {
    final theme = Theme.of(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '购买套餐',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            '选择一个套餐立即下单，系统会生成订单并返回支付指引。',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 14),
          if (controller.billingActionMessage.isNotEmpty)
            MessageNotice(
              message: controller.billingActionMessage,
              error: controller.hasBillingActionError,
            ),
          if (controller.billingActionMessage.isNotEmpty) const SizedBox(height: 14),
          if (controller.billingPlans.isEmpty)
            Text(
              '当前暂无可购买套餐。',
              style: theme.textTheme.bodyMedium,
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildBillingPlanCards(context, controller),
            ),
          if (controller.isBusy) ...[
            const SizedBox(height: 8),
            const Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  List<Widget> _buildBillingPlanCards(BuildContext context, SettingsController controller) {
    final theme = Theme.of(context);
    final plans = controller.billingPlans;
    return List<Widget>.generate(plans.length, (index) {
      final plan = plans[index];
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: index == plans.length - 1 ? 0 : 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    plan.name,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                if (plan.isDefault) const Chip(label: Text('当前默认')),
              ],
            ),
            const SizedBox(height: 8),
            Text('价格：${plan.displayPriceLabel}'),
            const SizedBox(height: 4),
            Text('周期：${plan.displayCycleLabel} · ${plan.planType}'),
            const SizedBox(height: 4),
            Text('额度：${plan.totalTokens} tokens（基础 ${plan.includedTokens} + 赠送 ${plan.bonusTokens}）'),
            if ((plan.remark ?? '').trim().isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(plan.remark!),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: controller.isBusy || !plan.isEnabled ? null : () => controller.purchasePlan(plan),
                child: const Text('立即下单'),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildLatestPaymentSection(BuildContext context, SettingsController controller) {
    final payResult = controller.latestPayResult;
    if (payResult == null) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '支付指引',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 12),
          MessageNotice(message: payResult.displayMessage),
          const SizedBox(height: 12),
          Text('订单号：${payResult.orderNo}'),
          if ((payResult.externalTradeNo ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            Text('支付流水：${payResult.externalTradeNo}'),
          ],
          if ((payResult.expireAt ?? '').isNotEmpty) ...[
            const SizedBox(height: 6),
            Text('有效期至：${payResult.expireAt}'),
          ],
          if ((payResult.payUrl ?? '').isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              '支付链接',
              style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text(payResult.payUrl!),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                OutlinedButton(
                  onPressed: controller.isBusy ? null : () => _copyText(payResult.payUrl!, '支付链接'),
                  child: const Text('复制链接'),
                ),
                OutlinedButton(
                  onPressed: controller.isBusy ? null : controller.refreshBillingOrders,
                  child: const Text('刷新订单状态'),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildOrderSection(BuildContext context, SettingsController controller) {
    final theme = Theme.of(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  '我的订单',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: controller.isBusy ? null : controller.refreshBillingOrders,
                child: const Text('刷新'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (controller.billingOrders.isEmpty)
            Text(
              '你还没有订单，先从上面的套餐创建第一笔订单。',
              style: theme.textTheme.bodyMedium,
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildOrderCards(context, controller),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildOrderCards(BuildContext context, SettingsController controller) {
    final theme = Theme.of(context);
    final orders = controller.billingOrders;
    return List<Widget>.generate(orders.length, (index) {
      final order = orders[index];
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: index == orders.length - 1 ? 0 : 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: theme.colorScheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    order.displayPlanName,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                Chip(label: Text(order.displayStatusLabel)),
              ],
            ),
            const SizedBox(height: 8),
            Text('订单号：${order.orderNo}'),
            const SizedBox(height: 4),
            Text('金额：${order.displayAmountLabel} · 额度：${order.grantedTokens}'),
            const SizedBox(height: 4),
            Text('支付渠道：${order.providerCode}'),
            if ((order.externalTradeNo ?? '').isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('外部流水：${order.externalTradeNo}'),
            ],
            if ((order.createDate ?? '').isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('创建时间：${order.createDate}'),
            ],
            if ((order.activatedAt ?? '').isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('激活时间：${order.activatedAt}'),
            ],
            if (order.canPay || order.canCancel) ...[
              const SizedBox(height: 12),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  if (order.canPay)
                    ElevatedButton(
                      onPressed: controller.isBusy ? null : () => controller.payOrder(order),
                      child: const Text('继续支付'),
                    ),
                  if (order.canCancel)
                    OutlinedButton(
                      onPressed: controller.isBusy ? null : () => _confirmCancelOrder(controller, order),
                      child: const Text('取消订单'),
                    ),
                ],
              ),
            ],
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      context.read<SettingsController>().loadOverview();
    });
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _oldPasswordFocusNode.dispose();
    _newPasswordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsController>(
      builder: (context, controller, _) {
        final items = _buildScrollItems(context, controller);
        return Scaffold(
          appBar: AppBar(title: const Text('设置')),
          body: ListView(
            key: const PageStorageKey<String>('settings-scroll'),
            physics: const AlwaysScrollableScrollPhysics(parent: ClampingScrollPhysics()),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.all(16),
            children: items,
          ),
        );
      },
    );
  }

  List<Widget> _buildScrollItems(BuildContext context, SettingsController controller) {
    return [
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '账号信息',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 12),
            Text(controller.currentUser?.username ?? '未登录用户'),
            const SizedBox(height: 4),
            Text('ID: ${controller.currentUser?.id ?? '-'}'),
            const SizedBox(height: 14),
            OutlinedButton(
              onPressed: controller.isBusy ? null : controller.refreshUserInfo,
              child: const Text('刷新信息'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16),
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '套餐与用量',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 12),
            Text('当前套餐：${controller.billingSummary?.displayPlanName ?? '加载中...'}'),
            const SizedBox(height: 6),
            Text('本月总额度：${controller.billingSummary?.totalTokens ?? 0}'),
            const SizedBox(height: 6),
            Text('本月已用：${controller.billingSummary?.consumedTokens ?? 0}'),
            const SizedBox(height: 6),
            Text('本月剩余：${controller.billingSummary?.remainingTokens ?? 0}'),
            const SizedBox(height: 6),
            Text('剩余占比：${controller.billingSummary?.remainingPercentLabel ?? '0.0%'}'),
            if ((controller.billingSummary?.periodEndAt ?? '').isNotEmpty) ...[
              const SizedBox(height: 6),
              Text('下次重置：${controller.billingSummary!.periodEndAt}'),
            ],
            if (controller.billingNotice.isNotEmpty) ...[
              const SizedBox(height: 14),
              MessageNotice(
                message: controller.billingNotice,
                error: controller.billingSummary?.isExhausted == true,
              ),
            ],
          ],
        ),
      ),
      const SizedBox(height: 16),
      _buildBillingPlansSection(context, controller),
      const SizedBox(height: 16),
      _buildLatestPaymentSection(context, controller),
      if (controller.latestPayResult != null) const SizedBox(height: 16),
      _buildOrderSection(context, controller),
      const SizedBox(height: 16),
      SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '修改密码',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 14),
            TextField(
              controller: _oldPasswordController,
              focusNode: _oldPasswordFocusNode,
              obscureText: true,
              decoration: const InputDecoration(labelText: '原密码'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _newPasswordController,
              focusNode: _newPasswordFocusNode,
              obscureText: true,
              decoration: const InputDecoration(labelText: '新密码'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocusNode,
              obscureText: true,
              decoration: const InputDecoration(labelText: '确认新密码'),
            ),
            const SizedBox(height: 14),
            MessageNotice(
              message: controller.statusMessage,
              error: controller.statusMessage.isNotEmpty && !controller.statusMessage.contains('成功') && !controller.statusMessage.contains('已刷新'),
            ),
            if (controller.statusMessage.isNotEmpty) const SizedBox(height: 14),
            ElevatedButton(
              onPressed: controller.isBusy
                  ? null
                  : () async {
                      final success = await controller.changePassword(
                        oldPassword: _oldPasswordController.text,
                        newPassword: _newPasswordController.text,
                        confirmPassword: _confirmPasswordController.text,
                      );
                      if (success) {
                        _oldPasswordController.clear();
                        _newPasswordController.clear();
                        _confirmPasswordController.clear();
                      }
                    },
              child: const Text('确认修改'),
            ),
            if (controller.isBusy) ...[
              const SizedBox(height: 12),
              const Center(child: CircularProgressIndicator()),
            ],
          ],
        ),
      ),
      const SizedBox(height: 16),
      const SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '关于',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12),
            Text('otto ai'),
            SizedBox(height: 4),
            Text('版本 1.0.0'),
          ],
        ),
      ),
      const SizedBox(height: 20),
      ElevatedButton(
        onPressed: controller.isBusy ? null : controller.logout,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: const Text('退出登录'),
      ),
    ];
  }
}
