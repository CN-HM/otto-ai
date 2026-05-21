import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

import '../../shared/models/agent_role_models.dart';
import '../../shared/models/device_models.dart';
import '../../shared/services/app_logger.dart';
import '../../shared/services/ble_support.dart';
import '../../shared/widgets/surface_card.dart';
import '../agent_roles/agent_role_controller.dart';
import 'device_controller.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  String? _lastBuildSnapshot;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DeviceController>().loadDevices();
      context.read<AgentRoleController>().loadRoles();
    });
  }

  Future<void> _refresh(BuildContext context) {
    return Future.wait<void>([
      context.read<DeviceController>().loadDevices(force: true),
      context.read<AgentRoleController>().loadRoles(force: true),
    ]);
  }

  Future<void> _handleScan(BuildContext context) async {
    final deviceController = context.read<DeviceController>();
    final success = await deviceController.startScan();
    if (!context.mounted) {
      return;
    }

    final scaffoldMessenger = ScaffoldMessenger.of(context);
    if (!success) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(deviceController.statusMessage),
          action: deviceController.shouldOpenBlePermissionSettings
              ? SnackBarAction(
                  label: '去授权',
                  onPressed: () {
                    openAppSettings();
                  },
                )
              : null,
        ),
      );
      return;
    }
    if (!kIsWeb) {
      final discoveredDevices = deviceController.discoveredDevices;
      if (discoveredDevices.isEmpty) {
        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('未发现可配网蓝牙设备，请让设备进入配网状态后重试')),
        );
        return;
      }
      if (defaultTargetPlatform == TargetPlatform.android) {
        await _showDiscoveredDevicesSheet(context, deviceController);
      }
      return;
    }

    final logger = context.read<AppLogger>();
    final discoveredDevices = deviceController.discoveredDevices;
    await logger.info(
      'DeviceScreen',
      'scan completed on web: discovered=${discoveredDevices.length}, status=${deviceController.statusMessage}',
    );
    if (!context.mounted) {
      return;
    }
    if (discoveredDevices.isEmpty) {
      scaffoldMessenger.showSnackBar(
        const SnackBar(content: Text('未选择蓝牙设备，或浏览器未返回可配网设备')),
      );
      return;
    }

    final selectedDevice = discoveredDevices.first;
    await _handleBindDiscoveredDevice(context, selectedDevice);
  }

  Future<void> _showDiscoveredDevicesSheet(BuildContext context, DeviceController controller) async {
    final discoveredDevices = List<BluetoothDeviceInfo>.from(controller.discoveredDevices);
    final devices = List<DeviceInfo>.from(controller.devices);
    final selectedDevice = await showModalBottomSheet<BluetoothDeviceInfo>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: SizedBox(
              height: MediaQuery.of(sheetContext).size.height * 0.72,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '扫描结果',
                    style: Theme.of(sheetContext).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text('共发现 ${discoveredDevices.length} 台设备'),
                  const SizedBox(height: 12),
                  Expanded(
                    child: ListView.separated(
                      itemCount: discoveredDevices.length,
                      separatorBuilder: (context, index) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final device = discoveredDevices[index];
                        final boundDevice = _findBoundDeviceForDiscovery(devices, device);
                        final isBound = boundDevice != null;
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text(device.name),
                          subtitle: Text('${device.macAddress} · ${_describeSignalStrength(device.rssi)}'),
                          trailing: TextButton(
                            onPressed: () => Navigator.of(sheetContext).pop(device),
                            child: Text(isBound ? '重新配置' : '配置网络'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
    if (!context.mounted || selectedDevice == null) {
      return;
    }

    await _handleBindDiscoveredDevice(context, selectedDevice);
  }

  Future<void> _handleBindDiscoveredDevice(
    BuildContext context,
    BluetoothDeviceInfo device,
  ) async {
    final logger = context.read<AppLogger>();
    final deviceController = context.read<DeviceController>();
    await logger.info(
      'DeviceScreen',
      'blufi tap: id=${device.id}, mac=${device.macAddress}, name=${device.name}',
    );
    if (!context.mounted) {
      return;
    }

    final selectedRole = await _openAgentRoleSelectorForProvisioning(context);
    if (!context.mounted || selectedRole == null) {
      return;
    }
    if (selectedRole.id == null || selectedRole.id!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('智能体角色数据异常，请刷新后重试')),
      );
      return;
    }

    final credentials = await _openWifiCredentialDialog(context, device);
    if (!context.mounted || credentials == null) {
      return;
    }

    final success = await deviceController.provisionDevice(
      device,
      ssid: credentials.ssid,
      password: credentials.password,
      agentRoleId: selectedRole.id!,
      agentRoleReleaseId: selectedRole.currentReleaseId,
    );
    await logger.info(
      'DeviceScreen',
      'blufi result: success=$success, status=${deviceController.statusMessage}',
    );
    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(deviceController.statusMessage)),
    );
  }

  Future<_WifiCredentialInput?> _openWifiCredentialDialog(
    BuildContext context,
    BluetoothDeviceInfo device,
  ) async {
    final deviceController = context.read<DeviceController>();
    return showDialog<_WifiCredentialInput>(
      context: context,
      builder: (dialogContext) => _WifiCredentialDialog(
        device: device,
        loadWifiNetworks: () => deviceController.loadProvisioningWifiNetworks(device),
      ),
    );
  }

  Future<void> _handleAssignAgentRole(BuildContext context, DeviceInfo device) async {
    await _openAgentRoleSelector(context, device);
  }

  Future<void> _handleClearAgentRole(BuildContext context, DeviceInfo device) async {
    final controller = context.read<DeviceController>();
    final success = await controller.updateDeviceAgentRole(device, null);
    if (!context.mounted) {
      return;
    }

    if (success) {
      await context.read<AgentRoleController>().loadRoles(force: true);
    }

    if (!context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(success ? '已取消智能体角色关联' : controller.statusMessage)),
    );
  }

  Future<AgentRoleInfo?> _openAgentRoleSelectorForProvisioning(BuildContext context) async {
    return _selectAgentRole(
      context,
      title: '选择智能体角色',
      subtitle: '配网时会把所选角色绑定为设备默认对话角色。',
      currentAgentRoleId: null,
      allowClear: false,
    );
  }

  Future<bool> _openAgentRoleSelector(
    BuildContext context,
    DeviceInfo device, {
    String? title,
    String? subtitle,
  }) async {
    final selectedRole = await _selectAgentRole(
      context,
      title: title ?? ((device.agentRoleId?.isNotEmpty ?? false) ? '更换智能体角色' : '绑定智能体角色'),
      subtitle: subtitle ?? '选择后会同步更新设备默认对话角色。',
      currentAgentRoleId: device.agentRoleId,
      allowClear: false,
    );
    if (!context.mounted || selectedRole == null) {
      return false;
    }

    if (selectedRole.id == null || selectedRole.id!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('智能体角色数据异常，请刷新后重试')),
      );
      return false;
    }

    final normalizedAgentRoleId = selectedRole.id!;
    final deviceController = context.read<DeviceController>();
    final success = await deviceController.updateDeviceAgentRole(
      device,
      normalizedAgentRoleId,
      agentRoleReleaseId: selectedRole.currentReleaseId,
    );
    if (!context.mounted) {
      return success;
    }

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(deviceController.statusMessage)),
      );
      return false;
    }

    await context.read<AgentRoleController>().loadRoles(force: true);
    if (!context.mounted) {
      return true;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('已绑定智能体角色：${selectedRole.title}')),
    );
    return true;
  }

  Future<AgentRoleInfo?> _selectAgentRole(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String? currentAgentRoleId,
    required bool allowClear,
  }) async {
    final roleController = context.read<AgentRoleController>();
    await roleController.loadRoles(force: true);
    if (!context.mounted) {
      return null;
    }

    final roles = roleController.roles;
    if (roles.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('暂无可用智能体角色，请先在后台发布并激活角色')),
      );
      return null;
    }

    return showModalBottomSheet<AgentRoleInfo?>(
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (sheetContext) => _AgentRoleSelectionSheet(
        title: title,
        subtitle: subtitle,
        roles: roles,
        currentAgentRoleId: currentAgentRoleId,
        allowClear: allowClear,
      ),
    );
  }

  DeviceInfo? _findBoundDeviceForDiscovery(
    List<DeviceInfo> devices,
    BluetoothDeviceInfo discoveredDevice,
  ) {
    final normalizedDiscoveryId = discoveredDevice.id.toUpperCase();
    final normalizedDiscoveryMac = discoveredDevice.macAddress.toUpperCase();
    for (final device in devices) {
      final deviceId = device.id?.toUpperCase();
      final deviceMac = device.macAddress?.toUpperCase();
      if (deviceId == normalizedDiscoveryId ||
          deviceMac == normalizedDiscoveryId ||
          deviceMac == normalizedDiscoveryMac) {
        return device;
      }
    }

    return null;
  }

  void _logBuildState(DeviceController controller) {
    if (!kDebugMode) {
      return;
    }
    final firstDevice = controller.devices.isNotEmpty ? controller.devices.first : null;
    final snapshot = [
      'devices=${controller.devices.length}',
      'discovered=${controller.discoveredDevices.length}',
      'status=${controller.statusMessage}',
      'firstId=${firstDevice?.id ?? 'null'}',
      'firstMac=${firstDevice?.macAddress ?? 'null'}',
      'firstAgentRoleId=${firstDevice?.agentRoleId ?? 'null'}',
      'firstAgentRoleName=${firstDevice?.agentRoleName ?? 'null'}',
    ].join(', ');

    if (_lastBuildSnapshot == snapshot) {
      return;
    }

    _lastBuildSnapshot = snapshot;
    debugPrint('${DateTime.now().toIso8601String()} [DEVICE-SCREEN] $snapshot');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeviceController>(
      builder: (context, controller, _) {
        final showDiscoveredDevicesInSheet = !kIsWeb && defaultTargetPlatform == TargetPlatform.android;
        _logBuildState(controller);
        return Scaffold(
          appBar: AppBar(title: const Text('我的设备')),
          body: RefreshIndicator(
            onRefresh: () => _refresh(context),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                SurfaceCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '设备中心',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '扫描到设备后，按照提示选择家里的 Wi‑Fi 并输入密码，应用会把网络信息发送给设备。连接完成后，设备信息会自动同步。',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withValues(alpha: 0.82),
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        controller.statusMessage,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.color
                                  ?.withValues(alpha: 0.7),
                            ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        '添加新设备',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '扫描到设备后，点击「配置网络」，选择可用 Wi‑Fi 并完成连接。',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.color
                                  ?.withValues(alpha: 0.78),
                            ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.isScanning ? null : () => _handleScan(context),
                              child: const Text('扫描新设备'),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: controller.isScanning ? controller.stopScan : null,
                              child: const Text('停止扫描'),
                            ),
                          ),
                        ],
                      ),
                      if (controller.isLoading || controller.isScanning) ...[
                        const SizedBox(height: 16),
                        const Center(child: CircularProgressIndicator()),
                      ],
                    ],
                  ),
                ),
                if (controller.discoveredDevices.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  Text(
                    '发现的蓝牙设备',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(height: 12),
                  if (showDiscoveredDevicesInSheet)
                    SurfaceCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('本次扫描发现 ${controller.discoveredDevices.length} 台设备'),
                          const SizedBox(height: 8),
                          Text(
                            '点击下方按钮后再显示设备列表。',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.color
                                      ?.withValues(alpha: 0.78),
                                ),
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: () => _showDiscoveredDevicesSheet(context, controller),
                              child: const Text('查看扫描结果'),
                            ),
                          ),
                        ],
                      ),
                    )
                  else ...[
                    ...controller.discoveredDevices.map(
                      (device) {
                        final boundDevice = _findBoundDeviceForDiscovery(controller.devices, device);
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: _DiscoveredDeviceCard(
                            device: device,
                            boundDevice: boundDevice,
                            onBind: () => _handleBindDiscoveredDevice(context, device),
                            onContinueConfig: () => _handleBindDiscoveredDevice(context, device),
                          ),
                        );
                      },
                    ),
                  ],
                ],
                const SizedBox(height: 16),
                Text(
                  '已绑定设备',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                if (controller.devices.isEmpty)
                  const SurfaceCard(
                    child: Column(
                      children: [
                        Icon(Icons.devices_other_outlined, size: 44),
                        SizedBox(height: 12),
                        Text('暂无已添加设备'),
                        SizedBox(height: 6),
                        Text('完成网络连接后，设备可能需要稍等片刻才会显示在这里'),
                      ],
                    ),
                  )
                else
                  ...controller.devices.map(
                    (device) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: _BoundDeviceCard(
                        device: device,
                        onAssignAgentRole: () => _handleAssignAgentRole(context, device),
                        onClearAgentRole: device.agentRoleId?.isNotEmpty == true
                            ? () => _handleClearAgentRole(context, device)
                            : null,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DiscoveredDeviceCard extends StatelessWidget {
  const _DiscoveredDeviceCard({
    required this.device,
    required this.boundDevice,
    required this.onBind,
    required this.onContinueConfig,
  });

  final BluetoothDeviceInfo device;
  final DeviceInfo? boundDevice;
  final Future<void> Function()? onBind;
  final Future<void> Function()? onContinueConfig;

  @override
  Widget build(BuildContext context) {
    final isBound = boundDevice != null;
    final statusText = isBound
        ? '该设备已添加过，可重新配置网络'
        : '可以开始配置网络';
    final actionLabel = isBound ? '重新配置' : '配置网络';
    final action = isBound ? onContinueConfig : onBind;

    return SurfaceCard(
      child: Row(
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  device.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 6),
                Text(device.macAddress),
                const SizedBox(height: 4),
                Text(_describeSignalStrength(device.rssi)),
                const SizedBox(height: 8),
                Text(
                  statusText,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isBound
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.color
                                ?.withValues(alpha: 0.75),
                        fontWeight: isBound ? FontWeight.w700 : FontWeight.w500,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: action == null ? null : () => action(),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
  }
}

class _BoundDeviceCard extends StatelessWidget {
  const _BoundDeviceCard({
    required this.device,
    required this.onAssignAgentRole,
    required this.onClearAgentRole,
  });

  final DeviceInfo device;
  final Future<void> Function() onAssignAgentRole;
  final Future<void> Function()? onClearAgentRole;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<DeviceController>();
    final lastSeen = device.lastConnectedAt == null
        ? '未连接'
        : DateFormat('yyyy-MM-dd HH:mm').format(device.lastConnectedAt!.toLocal());

    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (device.alias == null || device.alias!.isEmpty) ? '未命名设备' : device.alias!,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 6),
          Text(device.agentRoleName ?? device.agentRoleId ?? '未关联智能体角色'),
          if ((device.agentRoleVersion ?? '').isNotEmpty) ...[
            const SizedBox(height: 4),
            Text('角色版本：${device.agentRoleVersion!}'),
          ],
          if ((device.macAddress ?? '').isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(device.macAddress!),
          ],
          const SizedBox(height: 8),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _StatusChip(
                label: device.isOnline ? '在线' : '离线',
                color: device.isOnline ? Colors.green : Colors.grey,
              ),
              _StatusChip(label: device.appVersion ?? '未知版本', color: Colors.indigo),
              _StatusChip(label: lastSeen, color: Colors.orange),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => onAssignAgentRole(),
                child: Text(device.agentRoleId?.isNotEmpty == true ? '更换智能体角色' : '绑定智能体角色'),
              ),
              if (onClearAgentRole != null)
                TextButton(
                  onPressed: () => onClearAgentRole!(),
                  child: const Text('取消关联'),
                ),
              OutlinedButton(
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('解绑设备'),
                          content: const Text('确认要解绑这台设备吗？'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: const Text('取消'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text('解绑'),
                            ),
                          ],
                        ),
                      ) ??
                      false;
                  if (!confirmed) {
                    return;
                  }
                  final success = await controller.unbindDevice(device);
                  if (!context.mounted) {
                    return;
                  }
                  await context.read<AgentRoleController>().loadRoles(force: true);
                  if (!context.mounted) {
                    return;
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(success ? '已解绑' : controller.statusMessage)),
                  );
                },
                child: const Text('解绑设备'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _WifiCredentialInput {
  const _WifiCredentialInput({
    required this.ssid,
    required this.password,
  });

  final String ssid;
  final String password;
}

class _WifiCredentialDialog extends StatefulWidget {
  const _WifiCredentialDialog({
    required this.device,
    required this.loadWifiNetworks,
  });

  final BluetoothDeviceInfo device;
  final Future<List<ProvisioningWifiNetwork>> Function() loadWifiNetworks;

  @override
  State<_WifiCredentialDialog> createState() => _WifiCredentialDialogState();
}

class _WifiCredentialDialogState extends State<_WifiCredentialDialog> {
  final TextEditingController _ssidController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  List<ProvisioningWifiNetwork> _wifiNetworks = const [];
  bool _isLoadingWifiNetworks = false;
  bool _obscurePassword = true;
  String? _wifiLoadError;
  String? _selectedSsid;
  String? _ssidValidationMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadWifiNetworks();
    });
  }

  @override
  void dispose() {
    _ssidController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadWifiNetworks() async {
    if (_isLoadingWifiNetworks) {
      return;
    }

    setState(() {
      _isLoadingWifiNetworks = true;
      _wifiLoadError = null;
    });

    try {
      final networks = await widget.loadWifiNetworks();
      if (!mounted) {
        return;
      }

      setState(() {
        _wifiNetworks = networks;
        if (networks.isNotEmpty && _ssidController.text.trim().isEmpty) {
          _selectedSsid = networks.first.ssid;
          _ssidController.text = networks.first.ssid;
        }
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      final feedback = BleSupport.describeError(
        error,
        fallbackMessage: '读取设备附近 Wi‑Fi 列表失败',
      );
      setState(() {
        _wifiLoadError = feedback.message;
      });
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingWifiNetworks = false;
        });
      }
    }
  }

  void _selectWifi(ProvisioningWifiNetwork network) {
    setState(() {
      _selectedSsid = network.ssid;
      _ssidController.text = network.ssid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(24, 20, 12, 0),
      title: Row(
        children: [
          const Expanded(child: Text('连接设备到 Wi‑Fi')),
          IconButton(
            onPressed: _isLoadingWifiNetworks ? null : _loadWifiNetworks,
            tooltip: '重新读取 Wi‑Fi',
            icon: _isLoadingWifiNetworks
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh),
          ),
        ],
      ),
      content: SizedBox(
        width: 440,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.device.name),
              const SizedBox(height: 6),
              Text(
                widget.device.macAddress,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 16),
              Text(
                '附近 Wi‑Fi',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              if (_wifiLoadError != null) ...[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.errorContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '自动读取 Wi‑Fi 失败：$_wifiLoadError\n你仍可以手动输入网络名称继续连接。',
                    style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              if (_isLoadingWifiNetworks) ...[
                const LinearProgressIndicator(),
                const SizedBox(height: 8),
                Text(
                  '正在读取设备附近的 Wi‑Fi 列表...',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
              ] else if (_wifiNetworks.isEmpty) ...[
                Text(
                  '暂未读取到 Wi‑Fi 列表，你可以手动输入 2.4G Wi‑Fi 名称。',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(height: 12),
              ] else ...[
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 220),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: Theme.of(context).dividerColor),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _wifiNetworks.length,
                      separatorBuilder: (_, __) => Divider(height: 1, color: Theme.of(context).dividerColor),
                      itemBuilder: (context, index) {
                        final network = _wifiNetworks[index];
                        final selected = network.ssid == _selectedSsid;
                        return ListTile(
                          dense: true,
                          selected: selected,
                          leading: Icon(
                            selected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: selected ? Theme.of(context).colorScheme.primary : null,
                          ),
                          title: Text(network.ssid),
                          subtitle: Text(_describeSignalStrength(network.rssi)),
                          onTap: () => _selectWifi(network),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 12),
              ],
              TextField(
                controller: _ssidController,
                decoration: InputDecoration(
                  labelText: 'Wi‑Fi 名称',
                  hintText: '可从上方点选，也可手动输入 2.4G Wi‑Fi 名称',
                  errorText: _ssidValidationMessage,
                ),
                autofocus: _wifiNetworks.isEmpty,
                onChanged: (_) {
                  if (_ssidValidationMessage != null) {
                    setState(() {
                      _ssidValidationMessage = null;
                    });
                  }
                },
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Wi‑Fi 密码',
                  hintText: '开放网络可留空',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('取消'),
        ),
        FilledButton(
          onPressed: () {
            final ssid = _ssidController.text.trim();
            if (ssid.isEmpty) {
              setState(() {
                _ssidValidationMessage = '请选择或输入 Wi‑Fi 名称';
              });
              return;
            }

            Navigator.of(context).pop(
              _WifiCredentialInput(
                ssid: ssid,
                password: _passwordController.text,
              ),
            );
          },
          child: const Text('开始连接'),
        ),
      ],
    );
  }
}

String _describeSignalStrength(int rssi) {
  if (rssi >= -55) {
    return '信号较强';
  }
  if (rssi >= -72) {
    return '信号一般';
  }
  return '信号较弱';
}

class _AgentRoleSelectionSheet extends StatelessWidget {
  const _AgentRoleSelectionSheet({
    required this.title,
    required this.subtitle,
    required this.roles,
    required this.currentAgentRoleId,
    required this.allowClear,
  });

  final String title;
  final String subtitle;
  final List<AgentRoleInfo> roles;
  final String? currentAgentRoleId;
  final bool allowClear;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.72;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 8),
              Text(subtitle),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  children: [
                    if (allowClear)
                      ListTile(
                        leading: const Icon(Icons.link_off_rounded),
                        title: const Text('取消关联智能体角色'),
                        subtitle: const Text('保留设备绑定，仅移除当前智能体角色'),
                        onTap: () => Navigator.of(context).pop(null),
                      ),
                    ...roles.map(
                      (role) => ListTile(
                        leading: Icon(
                          role.id == currentAgentRoleId ? Icons.check_circle : Icons.psychology_alt_outlined,
                        ),
                        title: Text(role.title),
                        subtitle: Text(role.currentVersion == null || role.currentVersion!.isEmpty
                            ? role.description ?? '已为你的设备准备就绪'
                            : '版本 ${role.currentVersion}'),
                        onTap: () => Navigator.of(context).pop(role),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
