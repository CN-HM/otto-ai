import 'package:flutter/foundation.dart';

import '../../features/auth/auth_controller.dart';
import '../../shared/models/agent_role_models.dart';
import '../../shared/services/agent_role_api_service.dart';
import '../../shared/services/app_logger.dart';

class AgentRoleController extends ChangeNotifier {
  AgentRoleController({
    required AuthController authController,
    required AgentRoleApiService api,
    required AppLogger logger,
  })  : _authController = authController,
        _api = api,
        _logger = logger,
        _lastAuthenticated = authController.isAuthenticated {
    _authController.addListener(_handleAuthChanged);
  }

  final AuthController _authController;
  final AgentRoleApiService _api;
  final AppLogger _logger;
  bool _lastAuthenticated;

  List<AgentRoleInfo> _roles = const [];
  bool _isLoading = false;
  bool _hasLoaded = false;
  String _statusMessage = '';

  List<AgentRoleInfo> get roles => _roles;
  bool get isLoading => _isLoading;
  bool get hasLoaded => _hasLoaded;
  String get statusMessage => _statusMessage;

  Future<void> loadRoles({bool force = false}) async {
    if (_isLoading) {
      return;
    }

    if (!force && _hasLoaded) {
      return;
    }

    final token = _authController.token;
    if (token == null || token.isEmpty) {
      _statusMessage = '未登录';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _statusMessage = '加载智能体角色...';
    notifyListeners();

    try {
      final response = await _api.getAgentRoles(token);
      await _logger.info(
        'AgentRoleController',
        'loadRoles response: code=${response.code}, count=${response.data?.length ?? 0}, message=${response.msg}',
      );

      if (response.isSuccess) {
        _roles = response.data ?? const [];
        _hasLoaded = true;
        _statusMessage = _roles.isEmpty ? '暂无可用智能体角色' : '已加载 ${_roles.length} 个智能体角色';
      } else if (response.isUnauthorized) {
        _roles = const [];
        _hasLoaded = false;
        _statusMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效，请重新登录';
        await _authController.handleUnauthorized(_statusMessage);
      } else {
        _roles = const [];
        _hasLoaded = false;
        _statusMessage = response.msg.isNotEmpty ? response.msg : '加载智能体角色失败';
      }
    } catch (error, stackTrace) {
      await _logger.error('AgentRoleController', 'Load roles failed', error, stackTrace);
      _roles = const [];
      _hasLoaded = false;
      _statusMessage = '加载智能体角色失败';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  AgentRoleInfo? findById(String? id) {
    if (id == null || id.isEmpty) {
      return null;
    }

    for (final role in _roles) {
      if (role.id == id) {
        return role;
      }
    }

    return null;
  }

  @override
  void dispose() {
    _authController.removeListener(_handleAuthChanged);
    super.dispose();
  }

  void _handleAuthChanged() {
    final isAuthenticated = _authController.isAuthenticated;
    if (_lastAuthenticated == isAuthenticated) {
      return;
    }

    _lastAuthenticated = isAuthenticated;
    _roles = const [];
    _isLoading = false;
    _hasLoaded = false;
    _statusMessage = '';
    notifyListeners();
  }
}
