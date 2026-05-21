import 'package:flutter/foundation.dart';

import '../../shared/models/auth_models.dart';
import '../../shared/services/app_logger.dart';
import '../../shared/services/auth_api_service.dart';
import '../../shared/services/session_storage.dart';

class AuthController extends ChangeNotifier {
  AuthController({
    required AuthApiService api,
    required SessionStorage storage,
    required AppLogger logger,
  })  : _api = api,
        _storage = storage,
        _logger = logger;

  final AuthApiService _api;
  final SessionStorage _storage;
  final AppLogger _logger;

  String? _token;
  UserInfo? _currentUser;
  bool _isReady = false;
  bool _isLoading = false;
  bool _isLoginMode = true;
  String _message = '';

  String? get token => _token;
  UserInfo? get currentUser => _currentUser;
  bool get isReady => _isReady;
  bool get isLoading => _isLoading;
  bool get isLoginMode => _isLoginMode;
  String get message => _message;
  bool get isAuthenticated => _token != null && _currentUser != null;

  Future<void> initialize() async {
    try {
      _token = await _storage.getToken();
      if (_token != null && _token!.isNotEmpty) {
        await refreshUserInfo(logoutOnFailure: true);
      }
    } catch (error, stackTrace) {
      await _logger.error('AuthController', 'Initialize failed', error, stackTrace);
      await logout(notify: false);
    } finally {
      _isReady = true;
      notifyListeners();
    }
  }

  void toggleMode() {
    _isLoginMode = !_isLoginMode;
    _message = '';
    notifyListeners();
  }

  Future<bool> login({
    required String username,
    required String password,
  }) async {
    _setLoading(true);
    _message = '';
    notifyListeners();

    final response = await _api.login(
      LoginRequest(
        username: username.trim(),
        password: password,
      ),
    );

    if (response.isSuccess && response.data?.token != null) {
      _token = response.data!.token;
      await _storage.setToken(_token!);
      await refreshUserInfo(logoutOnFailure: true);
      if (!isAuthenticated) {
        _message = _message.isNotEmpty ? _message : '登录状态初始化失败';
        _setLoading(false);
        notifyListeners();
        return false;
      }

      _message = '';
      _setLoading(false);
      notifyListeners();
      return true;
    }

    _message = response.msg.isNotEmpty ? response.msg : '登录失败';
    _setLoading(false);
    notifyListeners();
    return false;
  }

  Future<bool> register({
    required String username,
    required String password,
    required String phone,
    required String code,
  }) async {
    _setLoading(true);
    _message = '';
    notifyListeners();

    final response = await _api.register(
      RegisterRequest(
        username: username.trim(),
        password: password,
        phone: phone.trim(),
        code: code.trim(),
      ),
    );

    _setLoading(false);
    _message = response.isSuccess
        ? '注册成功，请使用刚设置的用户名和密码登录'
        : (response.msg.isNotEmpty ? response.msg : '注册失败');

    if (response.isSuccess) {
      _isLoginMode = true;
    }

    notifyListeners();
    return response.isSuccess;
  }

  Future<bool> sendSmsCode(String phone) async {
    final response = await _api.sendSmsCode(
      SmsVerificationRequest(phone: phone.trim()),
    );
    _message = response.isSuccess ? '验证码已发送' : response.msg;
    notifyListeners();
    return response.isSuccess;
  }

  Future<bool> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    if (_token == null || _token!.isEmpty) {
      _message = '未登录';
      notifyListeners();
      return false;
    }

    _setLoading(true);
    notifyListeners();
    final response = await _api.changePassword(
      ChangePasswordRequest(
        password: oldPassword,
        newPassword: newPassword,
      ),
      _token!,
    );
    _setLoading(false);
    _message = response.isSuccess ? '密码修改成功' : response.msg;
    notifyListeners();
    return response.isSuccess;
  }

  Future<bool> refreshUserInfo({bool logoutOnFailure = false}) async {
    if (_token == null || _token!.isEmpty) {
      return false;
    }

    try {
      final response = await _api.getUserInfo(_token!);
      if (response.isSuccess && response.data != null) {
        _currentUser = response.data;
        return true;
      }

      if (response.isUnauthorized || logoutOnFailure) {
        await _logger.warning('AuthController', 'Token invalid, clearing session');
        final failureMessage = response.msg.isNotEmpty ? response.msg : '登录状态已失效';
        await logout(notify: false);
        _message = failureMessage;
        notifyListeners();
        return false;
      }

      await _logger.warning('AuthController', 'Refresh user info returned non-success: ${response.msg}');
      return false;
    } catch (error, stackTrace) {
      await _logger.error('AuthController', 'Refresh user info failed', error, stackTrace);
      if (logoutOnFailure) {
        await logout(notify: false);
        _message = '登录状态已失效';
        notifyListeners();
      }
      return false;
    }
  }

  Future<void> handleUnauthorized([String? message]) async {
    final failureMessage = message != null && message.trim().isNotEmpty
        ? message
        : '登录状态已失效，请重新登录';
    await _logger.warning('AuthController', 'Unauthorized response received, clearing session');
    await logout(notify: false);
    _message = failureMessage;
    notifyListeners();
  }

  Future<void> logout({bool notify = true}) async {
    _token = null;
    _currentUser = null;
    _message = '';
    await _storage.removeToken();
    if (notify) {
      notifyListeners();
    }
  }

  void clearMessage() {
    _message = '';
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
  }
}
