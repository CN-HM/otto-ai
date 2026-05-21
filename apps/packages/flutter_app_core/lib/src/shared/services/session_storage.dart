import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SessionStorage {
  SessionStorage({
    String tokenKey = 'auth_token',
  }) : _tokenKey = tokenKey;

  final String _tokenKey;
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() => _storage.read(key: _tokenKey);

  Future<void> setToken(String token) => _storage.write(key: _tokenKey, value: token);

  Future<void> removeToken() => _storage.delete(key: _tokenKey);
}
